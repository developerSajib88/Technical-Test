import 'package:technical_test/data/local_database/key_local_database.dart';
import 'package:hive_flutter/hive_flutter.dart';


class GetLocalDatabase {

  final database = Hive.box(KeyLocalDatabase.databaseName);

  bool? userIsLogIn() => database.get(KeyLocalDatabase.userIsLogIn);

  bool? userRegister() => database.get(KeyLocalDatabase.userRegister);

  String? userType() => database.get(KeyLocalDatabase.userType);

  int? userId() => database.get(KeyLocalDatabase.userId);

  String? userName() => database.get(KeyLocalDatabase.userName);

  String? userEmail() => database.get(KeyLocalDatabase.userEmail);

  String? userPhone() => database.get(KeyLocalDatabase.userPhone);

  String? userAccessToken() => database.get(KeyLocalDatabase.userAccessToken);

  String? userRefreshToken() => database.get(KeyLocalDatabase.userRefreshToken);

}