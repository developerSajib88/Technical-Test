import 'package:http/http.dart' as http;
import 'package:technical_test/common/global/functions/global_functions.dart';
import 'package:technical_test/data/api/api_urls/api_urls.dart';
import 'package:technical_test/data/custom_log.dart';
import 'package:technical_test/data/model/table/table_row.dart';

class ApiServices {

  static Future<List<TableRowData>?> fetchTableData() async {

    final response = await http.get(Uri.parse(ApiUrls.dynamicTable));
    if (response.statusCode == 200) {
      final htmlContent = response.body;
      CustomLog.customPrinterGreen(response.body);
      return GlobalFunctions.parseHtmlTable(htmlContent); // Parse and update state
    } else {
      return null;
    }

  }

}