import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.mainBackground,
      body: Center(
        child: Container(
          width: 300,
          height: 400,
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
                  context.router.pushAndPopUntil(
                    const HomeRoute(),
                    predicate: (_) => false,
                  );
                }
              },
              builder: (context, state) {
                final AuthCubit cubit = context.read<AuthCubit>();
                return Column(
                  children: [
                    AcceptButton(
                      onPressed: cubit.nextPage,
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
