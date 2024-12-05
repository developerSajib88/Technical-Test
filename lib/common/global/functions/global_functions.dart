import 'package:technical_test/data/model/table/table_row.dart';

class GlobalFunctions {

  static List<TableRowData> parseHtmlTable(String htmlResponse) {
    final rowsRegex = RegExp(r'<tr>(.*?)<\/tr>', dotAll: true);
    final rowMatches = rowsRegex.allMatches(htmlResponse);

    return rowMatches.map((rowMatch) {
      return TableRowData.fromHtmlTableRow(rowMatch.group(1) ?? '');
    }).toList();
  }


}