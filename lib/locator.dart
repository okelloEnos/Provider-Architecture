import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/view_model/comments_model.dart';
import 'package:provider_architecture/core/view_model/home_model.dart';
import 'package:provider_architecture/core/view_model/log_in_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LogInModel());
  locator.registerLazySingleton(() => HomeModel());
  locator.registerLazySingleton(() => CommentsModel());
}