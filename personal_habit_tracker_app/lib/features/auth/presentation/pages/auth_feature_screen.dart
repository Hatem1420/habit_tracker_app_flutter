import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_habit_tracker_app/core/constants/app_images.dart';
import 'package:personal_habit_tracker_app/core/extensions/context_extensions.dart';
import 'package:personal_habit_tracker_app/core/extensions/font_extensions.dart';
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
      appBar: AppBar(backgroundColor: Colors.transparent),
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const .all(8.0),
            child: Column(
              crossAxisAlignment: .center,
              spacing: 10.sizeSH(max: 30),
              children: [
                Lottie.asset(
                  AppImages.welcome3,
                  height: 22.sh,
                  errorBuilder: (context, error, stackTrace) => Text(
                    'Welcome!',
                    style: TextStyle(fontWeight: .bold, fontSize: 25.sp),
                  ),
                ),

                Card(
                  clipBehavior: .antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: keyField,
                      child: BlocBuilder<AuthCubit, AuthState>(
                        buildWhen: (previous, current) =>
                            current is AuthInitialState,
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: .center,
                            spacing: 10,
                            children: [
                              FadeAnimatedContainer(
                                fade: state.signIn,
                                widget: CustomTextField(
                                  label: 'Name',
                                  controller: name,
                                  textInputType: .name,
                                  textInputAction: .next,
                                  validator: state.signIn
                                      ? null
                                      : Validators.validateFullName,
                                ),
                              ),

                              CustomTextField(
                                label: 'Email',
                                controller: email,
                                textInputType: .emailAddress,
                                textInputAction: .next,
                                validator: Validators.validateEmail,
                              ),

                              FadeAnimatedContainer(
                                fade: state.signIn,
                                widget: DatePickerField(
                                  onSubmit: (date) =>
                                      dOBCon.text = Formatters.formatDate(date),
                                  isRequired: !state.signIn,
                                ),
                              ),

                              CustomTextField(
                                label: 'Password',
                                controller: password,
                                validator: Validators.validatePassword,
                              ),

                              Gap(5),

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
                  ),
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  buildWhen: (previous, current) => current is AuthInitialState,
                  builder: (context, state) {
                    return SignSwitchWidget(
                      signIn: state.signIn,
                      onChangeSelect: (value) => authCubit.toggleSign(value),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
