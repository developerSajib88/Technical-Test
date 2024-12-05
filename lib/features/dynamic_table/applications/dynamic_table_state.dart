import 'package:equatable/equatable.dart';
import 'package:technical_test/data/model/table/table_row.dart';


class DynamicTableState extends Equatable {
  final bool isLoading;
  final int totalPreFiledValue;
  final int totalEnteredValue;
  final List<TableRowData> tableRowData;
  final Map<String,int> enteredValues;

  const DynamicTableState({
   required this.isLoading,
   required this.totalPreFiledValue,
   required this.totalEnteredValue,
   required this.tableRowData,
   required this.enteredValues
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    totalPreFiledValue,
    totalEnteredValue,
    tableRowData,
    enteredValues
  ];


  factory DynamicTableState.init()=> const DynamicTableState(
      isLoading: false,
      totalPreFiledValue: 0,
      totalEnteredValue: 0,
      tableRowData: [],
      enteredValues: {}
  );

  DynamicTableState copyWith({
    bool? isLoading,
    int? totalPreFiledValue,
    int? totalEnteredValue,
    List<TableRowData>? tableRowData,
    Map<String,int>? enteredValues
  })=> DynamicTableState(
      isLoading: isLoading ?? this.isLoading,
      totalPreFiledValue: totalPreFiledValue ?? this.totalPreFiledValue,
      totalEnteredValue: totalEnteredValue ?? this.totalEnteredValue,
      tableRowData: tableRowData ?? this.tableRowData,
      enteredValues: enteredValues ?? this.enteredValues
  );


}
