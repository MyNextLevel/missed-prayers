import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/colors.gen.dart';
import '../../routes/app_router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _starAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _starAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 4),
      ],
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          context.router
              .pushAndPopUntil(const AuthRoute(), predicate: (_) => false);
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(_starAnimation.value),
              child: SvgPicture.asset('assets/images/splash.svg'),
            );
          },
        ),
      ),
    );
  }
}
