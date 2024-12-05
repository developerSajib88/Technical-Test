import 'package:technical_test/data/api/api_services/api_services.dart';
import 'package:technical_test/data/model/table/table_row.dart';
import 'package:technical_test/features/dynamic_table/domain/dynamic_table_domain.dart';

class DynamicTableDomI implements DynamicTableDom{

  @override
  Future<List<TableRowData>?> fetchTableData() async => await ApiServices.fetchTableData();

}