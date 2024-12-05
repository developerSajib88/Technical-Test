import 'package:equatable/equatable.dart';
import 'package:technical_test/data/model/table/table_row.dart';


class DynamicTableState extends Equatable {
  final bool isLoading;
  final int sumOfEntered;
  final List<TableRowData> tableRowData;

  const DynamicTableState({
   required this.isLoading,
   required this.sumOfEntered,
   required this.tableRowData
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    sumOfEntered,
    tableRowData
  ];


  factory DynamicTableState.init()=> const DynamicTableState(
      isLoading: false,
      sumOfEntered: 0,
      tableRowData: []
  );

  DynamicTableState copyWith({
    bool? isLoading,
    int? sumOfEntered,
    List<TableRowData>? tableRowData
  })=> DynamicTableState(
      isLoading: isLoading ?? this.isLoading,
      sumOfEntered: sumOfEntered ?? this.sumOfEntered,
      tableRowData: tableRowData ?? this.tableRowData
  );


}
