import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missed_prayers/src/presentation/pages/auth/widgets/confirm_info.dart';
import 'package:missed_prayers/src/presentation/pages/auth/widgets/info_text.dart';
import 'package:missed_prayers/src/presentation/pages/auth/widgets/select_birthdate.dart';
import 'package:missed_prayers/src/presentation/pages/auth/widgets/select_first_ehtilam.dart';
import 'package:missed_prayers/src/presentation/pages/auth/widgets/select_start_prayer.dart';

import '../../../gen/colors.gen.dart';
import '../../components/components.dart';
import '../../routes/app_router.dart';
import 'cubit/auth_cubit.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late PageController _controller;
  late DateTime _birthdate;
  late DateTime _firstEhtilam;
  late DateTime _startPrayer;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _birthdate = DateTime.now();
    _firstEhtilam = DateTime.now();
    _startPrayer = DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('===> auth page dispose');
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.mainBackground,
      body: Center(
        child: Container(
          width: 320,
          height: 480,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorName.white,
            boxShadow: [
              BoxShadow(
                color: ColorName.primary.withOpacity(0.1),
                blurRadius: 25,
              ),
            ],
          ),
          child: BlocProvider<AuthCubit>(
            create: (_) => AuthCubit(),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.currentPage > 5) {
                  // context.router.pushAndPopUntil(
                  //   const HomeRoute(),
                  //   predicate: (_) => false,
                  // );
                }
              },
              builder: (context, state) {
                final AuthCubit cubit = context.read<AuthCubit>();
                return Column(
                  children: [
                    if (state.dateProgress > 0)
                      LinearProgressIndicator(
                        color: ColorName.primary,
                        backgroundColor: ColorName.mainBackground,
                        value: state.dateProgress,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    Expanded(
                      child: PageView(
                        controller: _controller,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const InfoText(),
                          SelectBirthdate(
                            onDateChanged: (date) {
                              _birthdate = date;
                            },
                          ),
                          SelectFirstEhtilam(
                            onDateChanged: (date) {
                              _firstEhtilam = date;
                            },
                          ),
                          SelectStartPrayer(
                            onDateChanged: (date) {
                              _startPrayer = date;
                            },
                          ),
                          ConfirmInfo(
                            birthdate: _birthdate,
                            ehtilam: _firstEhtilam,
                            startPrayer: _startPrayer,
                          ),
                        ],
                      ),
                    ),
                    AcceptButton(
                      onPressed: () {
                        cubit.nextPage();
                        _controller.nextPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.bounceInOut,
                        );
                      },
                      title: state.acceptButtonText,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
