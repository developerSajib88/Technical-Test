part of 'dependency_injection.dart';

/// This is my riverpod state provider

// Provider for table data
final dynamicTableProvider = StateNotifierProvider<DynamicTableStateNotifier, List<TableRowData>>((ref) {
  return DynamicTableStateNotifier(dynamicTableDom: getIt());
});