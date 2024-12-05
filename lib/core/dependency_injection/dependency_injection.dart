import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_test/data/model/table/table_row.dart';
import 'package:technical_test/features/dynamic_table/applications/dynamic_table_state_notifier.dart';
import 'package:technical_test/features/dynamic_table/domain/dynamic_table_domain.dart';
import 'package:technical_test/features/dynamic_table/infrastructure/dynamic_table_domain_i.dart';

part 'dependency_injection_provider.dart';

final getIt = GetIt.instance;

void init() {

  getIt.registerLazySingleton<DynamicTableDom>(()=> DynamicTableDomI());

}