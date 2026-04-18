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
import 'package:personal_habit_tracker_app/core/widgets/date_picker_bottom.dart';
import 'package:personal_habit_tracker_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:personal_habit_tracker_app/features/auth/presentation/cubit/auth_state.dart';
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
          if (state is AuthLoadingState) {
            context.showLoading();
          }
          if (state is AuthSuccessState) {
            context.go(Routes.habits); //'home'
          }
          if (state is AuthErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: SingleChildScrollView(
          padding: const .all(8.0),
          child: Column(
            crossAxisAlignment: .center,
            spacing: 10.sizeSH(max: 30),
            children: [
              Lottie.asset(
                AppImages.welcome,
                width: 400,
                height: 250,
                fit: BoxFit.fill,
                /* onLoaded: (composition) {
                              lottieController.duration = composition.duration;
                              lottieController.forward();
                              lottieController.addListener(() {
                                if (lottieController.value >= 0.35) {
                                  lottieController.stop();
                                }
                              });
                            }, */
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
                            AnimatedCrossFade(
                              duration: Duration(milliseconds: 500),
                              sizeCurve: Curves.easeInOut,
                              crossFadeState: state.signIn
                                  ? .showSecond
                                  : .showFirst,
                              firstChild: CustomTextField(
                                label: 'Name',
                                controller: name,
                                textInputType: .name,
                                textInputAction: .next,
                                validator: state.signIn
                                    ? null
                                    : Validators.validateFullName,
                              ),
                              secondChild: SizedBox.shrink(),
                            ),

                            CustomTextField(
                              label: 'Email',
                              controller: email,
                              textInputType: .emailAddress,
                              textInputAction: .next,
                              validator: Validators.validateEmail,
                            ),

                            AnimatedCrossFade(
                              duration: Duration(milliseconds: 500),
                              sizeCurve: Curves.easeInOut,
                              crossFadeState: state.signIn
                                  ? .showSecond
                                  : .showFirst,
                              firstChild: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      label: 'Date Of Birth',
                                      controller: dOBCon,
                                      readOnly: true,
                                      validator: state.signIn
                                          ? null
                                          : Validators.validateRequired,
                                    ),
                                  ),
                                  IconButton.filled(
                                    padding: .zero,
                                    onPressed: () {
                                      context.showBottomSheet(
                                        height: 50.sh,
                                        widget: DatePickerBottom(
                                          onSubmit: (date) => dOBCon.text =
                                              Formatters.formatDate(date),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                ],
                              ),
                              secondChild: SizedBox.shrink(),
                            ),

                            CustomTextField(
                              label: 'Password',
                              controller: password,
                              validator: Validators.validatePassword,
                            ),

                            Gap(20),

                            FilledButton(
                              onPressed: () => keyField.currentState!.validate()
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
                  return SegmentedButton(
                    style: ButtonStyle(
                      animationDuration: Duration(milliseconds: 500),
                      side: .all(.none),
                      padding: .all(.symmetric(horizontal: 16)),
                      textStyle: .all(Theme.of(context).textTheme.titleMedium),
                      foregroundColor: .all(
                        Theme.of(context).colorScheme.onSurface,
                      ),
                      backgroundColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return Theme.of(
                            context,
                          ).colorScheme.primary; // Color when selected
                        }
                        return Colors.transparent; // Color when unselected
                      }),
                    ),
                    showSelectedIcon: false,
                    segments: [
                      ButtonSegment(value: true, label: Text('Sign In')),
                      ButtonSegment(value: false, label: Text('Sign Up')),
                    ],
                    selected: {state.signIn},
                    onSelectionChanged: (value) =>
                        authCubit.toggleSign(value.last),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
