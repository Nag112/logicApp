// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedGetItGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:logic/_core/services/connectivityService.dart';
import 'package:logic/_core/services/httpService.dart';
import 'package:logic/_core/services/userService.dart';
import 'package:logic/_core/services/utilsService.dart';

final locator = StackedLocator.instance;

void setupLocator() {
  locator.registerLazySingleton(()=>DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UtilsService());
  locator.registerLazySingleton(()=>ConnectivityService());
  locator.registerLazySingleton(()=>SnackbarService());
  locator.registerLazySingleton(()=>HttpService());
  locator.registerLazySingleton(() => UserService());
}
