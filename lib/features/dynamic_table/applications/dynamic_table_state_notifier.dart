import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_test/data/model/table/table_row.dart';
import 'package:technical_test/features/dynamic_table/applications/dynamic_table_state.dart';
import 'package:technical_test/features/dynamic_table/domain/dynamic_table_domain.dart';



class DynamicTableStateNotifier extends StateNotifier<DynamicTableState> {

  final DynamicTableDom dynamicTableDom;
  DynamicTableStateNotifier({required this.dynamicTableDom}) : super(DynamicTableState.init());

  void stateMaker(DynamicTableState newState)=> state = newState;

  Future<void> init()async{
    fetchTableData();
  }

  // Fetch and parse the table data
  Future<void> fetchTableData() async {
    stateMaker(state.copyWith(isLoading: true));
    await dynamicTableDom.fetchTableData().then((list){
      if(list != null){
        stateMaker(state.copyWith(tableRowData: list));
      }
    });
    stateMaker(state.copyWith(isLoading: false));
  }
}