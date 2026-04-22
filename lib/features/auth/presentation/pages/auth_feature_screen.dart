import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_habit_tracker_app/core/constants/app_images.dart';
import 'package:personal_habit_tracker_app/core/extensions/context_extensions.dart';
import 'package:personal_habit_tracker_app/core/navigation/routers.dart';
import 'package:personal_habit_tracker_app/core/utils/formatters.dart';
import 'package:personal_habit_tracker_app/core/utils/validators.dart';
import 'package:personal_habit_tracker_app/core/widgets/custom_text_field.dart';
import 'package:personal_habit_tracker_app/core/widgets/date_picker_field.dart';
import 'package:personal_habit_tracker_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:personal_habit_tracker_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:personal_habit_tracker_app/features/auth/presentation/widgets/fade_animated_container.dart';
import 'package:personal_habit_tracker_app/features/auth/presentation/widgets/sign_switch_widget.dart';
import 'package:sizer/sizer.dart';

class AuthFeatureScreen extends HookWidget {
  const AuthFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final TextEditingController name = useTextEditingController();
    final TextEditingController email = useTextEditingController();
    final TextEditingController dOBCon = useTextEditingController();
    final TextEditingController password = useTextEditingController();
    final keyField = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 20, // Reduced to make room for content
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          context.hideLoading();
          switch (state) {
            case AuthLoadingState _:
              context.showLoading();
            case AuthSuccessState _:
              context.go(Routes.habits);
            case AuthErrorState _:
              context.showSnackBar(state.message, isError: true);
          }
        },
        child: Column(
          children: [
            SizedBox(
              height: 25.sh,
              child: Center(
                child: Lottie.asset(
                  AppImages.welcome3,
                  height: 22.sh,
                  errorBuilder: (context, error, stackTrace) => Text(
                    'Welcome!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      Form(
                        key: keyField,
                        child: BlocBuilder<AuthCubit, AuthState>(
                          buildWhen: (previous, current) =>
                              current is AuthInitialState,
                          builder: (context, state) {
                            return Column(
                              spacing: 15,
                              children: [
                                Text(
                                  state.signIn
                                      ? "Welcome Back"
                                      : "Create Account",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const Gap(10),

                                FadeAnimatedContainer(
                                  fade: state.signIn,
                                  widget: CustomTextField(
                                    label: 'Name',
                                    controller: name,
                                    textInputType: .name,
                                    validator: state.signIn
                                        ? null
                                        : Validators.validateFullName,
                                  ),
                                ),

                                CustomTextField(
                                  label: 'Email',
                                  controller: email,
                                  textInputType: .emailAddress,
                                  validator: Validators.validateEmail,
                                ),

                                FadeAnimatedContainer(
                                  fade: state.signIn,
                                  widget: DatePickerField(
                                    onSubmit: (date) => dOBCon.text =
                                        Formatters.formatDate(date),
                                    isRequired: !state.signIn,
                                  ),
                                ),

                                CustomTextField(
                                  label: 'Password',
                                  controller: password,
                                  validator: Validators.validatePassword,
                                ),

                                FilledButton(
                                  onPressed: () =>
                                      keyField.currentState!.validate()
                                      ? state.signIn
                                            ? authCubit.signIn(
                                                email.text,
                                                password.text,
                                              )
                                            : authCubit.signUp(
                                                name: name.text,
                                                email: email.text,
                                                dateOfBirth: DateTime.parse(
                                                  dOBCon.text,
                                                ),
                                                password: password.text,
                                              )
                                      : null,
                                  child: Text(
                                    state.signIn ? 'Sign In' : 'Sign Up',
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      const Gap(20),

                      BlocBuilder<AuthCubit, AuthState>(
                        buildWhen: (previous, current) => current is AuthInitialState,
                        builder: (context, state) {
                          return SignSwitchWidget(
                            signIn: state.signIn,
                            onChangeSelect: (value) =>
                                authCubit.toggleSign(value),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
