import 'package:technical_test/data/model/table/table_row.dart';

class GlobalFunctions {

  static List<TableRowData> parseHtmlTable(String htmlResponse) {
    final rowsRegex = RegExp(r'<tr>(.*?)<\/tr>', dotAll: true);
    final rowMatches = rowsRegex.allMatches(htmlResponse);

    return rowMatches.map((rowMatch) {
      return TableRowData.fromHtmlTableRow(rowMatch.group(1) ?? '');
    }).toList();
  }


  static String? validateInput({required TableRowData tableRowData, required String input}) {
    final num = int.tryParse(input);
    if (num == null || num < 100 || num > 999) {
      return 'Enter a number 100-999';
    }
    if (tableRowData.cells.contains(input)) {
      return 'Duplicate number';
    }
    return null;
  }


}