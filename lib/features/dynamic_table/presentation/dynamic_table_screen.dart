
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_test/common/widgets/buttons/primary_buttons.dart';
import 'package:technical_test/core/dependency_injection/dependency_injection.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:technical_test/features/dynamic_table/widgets/editable_cell.dart';
import 'package:technical_test/features/dynamic_table/widgets/total_display_widget.dart';
import 'package:technical_test/utils/utils.dart';

class DynamicTable extends HookConsumerWidget {

  static String get path => "/dynamicTable";
  static String get name => "dynamicTable";

  const DynamicTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dynamicTableState = ref.watch(dynamicTableProvider);
    final dynamicTableCtrl = ref.read(dynamicTableProvider.notifier);
    final showResult = useState<bool>(false);

    useEffect((){
      Future.microtask(()=> dynamicTableCtrl.fetchTableData());
      return null;
    },[]);


    return Scaffold(

      appBar: AppBar(
          title:  Text(
            "Dynamic Table",
            style: TextStyle(color: ColorPalates.defaultWhite),
          ),
          backgroundColor: ColorPalates.primaryColor,
      ),

      body: Container(
        width: 1.sw,
        height: 1.sh,
        padding: padding6,
        child: dynamicTableState.tableRowData.isEmpty ?
        const Center(child: CircularProgressIndicator()) :
        SingleChildScrollView(
          child: Column(
            children: [
              Table(
                border: TableBorder.all(),
                children: dynamicTableState.tableRowData.map((row) {
                  return TableRow(
                    children: row.cells.map((cell) {
                      return TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: padding4,
                          child: cell == "EditText" ?
                          EditableCell(row, cell) :
                          Padding(
                            padding: paddingLeft6,
                            child: Text(cell),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),

              gap10,

              PrimaryButton(
                text: "Calculate Sum",
                onPressed: () {
                  dynamicTableCtrl.calculateEnteredSum();
                  showResult.value = true;
                },
                icon: Icons.calculate,
              ),


              gap10,

              Visibility(
                  visible: showResult.value,
                  child: TotalsDisplay(
                      totalEnteredValue: dynamicTableState.totalEnteredValue,
                      totalPreFiledValue: dynamicTableState.totalPreFiledValue
                  )
              )

            ],
          ),
        ),
      ),
    );
  }


}
