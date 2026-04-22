import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_habit_tracker_app/core/extensions/context_extensions.dart';
import 'package:personal_habit_tracker_app/core/navigation/routers.dart';
import 'package:personal_habit_tracker_app/features/sub/sign_out/presentation/cubit/sign_out_cubit.dart';
import 'package:personal_habit_tracker_app/features/sub/sign_out/presentation/cubit/sign_out_state.dart';

class SignOutFeatureWidget extends StatelessWidget {
  const SignOutFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final signOutCubit = context.read<SignOutCubit>();
          return BlocListener<SignOutCubit, SignOutState>(
            listener: (context, state) {
              context.hideLoading();
              switch (state) {
                case SignOutSuccessState _:
                  context.go(Routes.auth);
                case SignOutErrorState _:
                  context.showSnackBar(state.message);
                case SignOutLoadingState _:
                  context.showLoading();
              }
            },
            child: ListTile(
              onTap: () => signOutCubit.getSignOutMethod(),
              title: const Text(
                'Log Out',
                style: TextStyle(color: Colors.redAccent, fontWeight: .bold),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.redAccent,
              ),
            ),
          );
        },
      ),
    );
  }
}
