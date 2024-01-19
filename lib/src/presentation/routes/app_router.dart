import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../pages/pages.dart';
import 'circle_reveal_clipper.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        CustomRoute(
          page: HomeRoute.page,
          path: '/home',
          durationInMilliseconds: 1500,
          opaque: false,
          barrierDismissible: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final size = MediaQuery.of(context).size;
            final Offset center = Offset(size.width / 2, size.height / 2);
            const double beginRadius = 0.0;
            final double endRadius =
                size.width > size.height ? size.width : size.height;

            final tween = Tween(begin: beginRadius, end: endRadius);
            final radiusTweenAnimation = animation.drive(tween);

            return ClipPath(
              clipper: CircleRevealClipper(
                radius: radiusTweenAnimation,
                center: center,
              ),
              child: child,
            );
          },
        ),
      ];
}
