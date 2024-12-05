import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_test/data/model/table/table_row.dart';
import 'package:technical_test/features/dynamic_table/domain/dynamic_table_domain.dart';



class DynamicTableStateNotifier extends StateNotifier<List<TableRowData>> {

  final DynamicTableDom dynamicTableDom;
  DynamicTableStateNotifier({required this.dynamicTableDom}) : super([]);

  // Fetch and parse the table data
  Future<void> fetchTableData() async {
    await dynamicTableDom.fetchTableData().then((list){
      if(list != null){
        state = list;
      }
    });
  }
}