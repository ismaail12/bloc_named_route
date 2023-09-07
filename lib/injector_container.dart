import 'package:get_it/get_it.dart';
import 'package:named_route_app/navigator_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<NavigatorService>(
    () => NavigatorService(),
  );
}
