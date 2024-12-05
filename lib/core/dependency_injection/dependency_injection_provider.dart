part of 'dependency_injection.dart';

/// This is my riverpod state provider

// Provider for table data
final dynamicTableProvider = StateNotifierProvider<DynamicTableStateNotifier, DynamicTableState>((ref) {
  return DynamicTableStateNotifier(dynamicTableDom: getIt());
});