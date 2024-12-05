import 'package:technical_test/data/model/table/table_row.dart';

abstract class DynamicTableDom {
  Future<List<TableRowData>?> fetchTableData();
}