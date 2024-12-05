class TableRowData {
  final List<String> cells;

  TableRowData(this.cells);

  factory TableRowData.fromHtmlTableRow(String htmlRow) {
    // Parse individual `<td>` tags
    final regex = RegExp(r'<td>(.*?)<\/td>');
    final matches = regex.allMatches(htmlRow).map((e) => e.group(1) ?? '').toList();
    return TableRowData(matches);
  }
}
