import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_test/common/widgets/buttons/primary_buttons.dart';
import 'package:technical_test/core/dependency_injection/dependency_injection.dart';
import 'package:technical_test/data/model/table/table_row.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:technical_test/features/dynamic_table/widgets/total_display_widget.dart';
import 'package:technical_test/utils/styles/color_palates.dart';
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
                          padding: const EdgeInsets.all(8.0),
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

              const SizedBox(height: 20),
              PrimaryButton(
                text: "Calculate Sum",
                onPressed: () {
                  dynamicTableCtrl.calculateEnteredSum();
                  showResult.value = true;
                },
                icon: Icons.calculate,
              ),


              Visibility(
                  visible: showResult.value,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      TotalsDisplay(
                          totalEnteredValue: dynamicTableState.totalEnteredValue,
                          totalPreFiledValue: dynamicTableState.totalPreFiledValue
                      )


                    ],
                  )
              )

            ],
          ),
        ),
      ),
    );
  }


}

class EditableCell extends StatefulHookConsumerWidget {
  final TableRowData row;
  final String cell;

  const EditableCell(this.row, this.cell, {super.key});

  @override
  ConsumerState<EditableCell> createState() => _EditableCellState();
}

class _EditableCellState extends ConsumerState<EditableCell> {
  String key = Random().nextInt(2384928439).toString();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.cell == 'EditText' ? '' : widget.cell;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        errorText: _validateInput(controller.text),
        errorStyle: TextStyle(fontSize: 5.5.sp),
      ),
      onChanged: (value){
        ref.read(dynamicTableProvider.notifier).addEnteredValues(key,value);
      },
    );
  }

  String? _validateInput(String input) {
    final num = int.tryParse(input);
    if (num == null || num < 100 || num > 999) {
      return 'Enter a number 100-999';
    }
    // Ensure no duplicates in row
    final duplicates = widget.row.cells.where((cell) => cell == input).length;
    if (widget.row.cells.contains(input)) {
      return 'Duplicate number';
    }
    return null;
  }
}
