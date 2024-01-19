import 'package:get_it/get_it.dart';

import '../../presentation/routes/app_router.dart';

final GetIt getIt = GetIt.instance;

Future setUpDependencies() async {
  getIt.registerSingleton<AppRouter>(AppRouter());
}

final appRouter = getIt.get<AppRouter>();