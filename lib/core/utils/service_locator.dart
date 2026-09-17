import 'package:get_it/get_it.dart';
import 'package:otlob/core/networking/api_consumer.dart';

final getIt = GetIt.instance;


locateDependencies() {
   getIt. registerLazySingleton <ApiConsumer>(() => ApiConsumer());
}
