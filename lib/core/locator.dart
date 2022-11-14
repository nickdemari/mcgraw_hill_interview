import 'package:get_it/get_it.dart';
import 'package:mcgraw_hill_interview/core/services/api/api_service.dart';

final locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton(() => ApiService());
}
