import 'package:auto_route/auto_route.dart';

import '../pages/pages.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        CustomRoute(
          page: HomeRoute.page,
          path: '/home',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: AuthRoute.page,
          path: '/auth',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];
}
