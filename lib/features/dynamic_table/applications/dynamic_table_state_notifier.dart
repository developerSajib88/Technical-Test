import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_test/features/dynamic_table/applications/dynamic_table_state.dart';
import 'package:technical_test/features/dynamic_table/domain/dynamic_table_domain.dart';



class DynamicTableStateNotifier extends StateNotifier<DynamicTableState> {

  final DynamicTableDom dynamicTableDom;
  DynamicTableStateNotifier({required this.dynamicTableDom}) : super(DynamicTableState.init());

  void stateMaker(DynamicTableState newState)=> state = newState;

  Future<void> init()async{
    fetchTableData();
  }


  void addEnteredValues(String key, String inputValue) {
    Map<String, int> updatedValues = Map.from(state.enteredValues);
    updatedValues[key] = int.parse(inputValue);
    state = state.copyWith(
      enteredValues: updatedValues,
    );
  }


  void calculateEnteredSum() {
    int totalEnteredValue = state.enteredValues.values.fold(0, (a,b)=> a + b );
    stateMaker(state.copyWith(
      totalEnteredValue: totalEnteredValue
    ));
  }

  Future<void> calculatePreFieldSum()async{
    final uniqueNumbers = <int>{};
    for (var row in state.tableRowData) {
      for (var cell in row.cells) {
        final num = int.tryParse(cell);
        if (num != null && uniqueNumbers.add(num)) {
          stateMaker(
            state.copyWith(
              totalPreFiledValue: state.totalPreFiledValue + num
            )
          );
        }
      }
    }
  }


  // Fetch and parse the table data
  Future<void> fetchTableData() async {
    stateMaker(state.copyWith(isLoading: true));
    await dynamicTableDom.fetchTableData().then((list){
      if(list != null){
        stateMaker(state.copyWith(tableRowData: list));
        calculatePreFieldSum();
      }
    });
    stateMaker(state.copyWith(isLoading: false));
  }
}