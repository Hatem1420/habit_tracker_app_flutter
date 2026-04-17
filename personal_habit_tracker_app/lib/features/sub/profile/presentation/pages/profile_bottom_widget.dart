import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_habit_tracker_app/core/widgets/loading_widget.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/presentation/cubit/profile_cubit.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/presentation/cubit/profile_state.dart';

class ProfileBottomWidget extends StatelessWidget {
  const ProfileBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getProfileMethod();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return switch (state) {
          ProfileInitialState _ => Center(child: LoadingWidget()),
          ProfileErrorState _ => Center(child: Text(state.message)),
          ProfileSuccessState _ => Column(
            children: [
              Text('Name', style: Theme.of(context).textTheme.titleMedium),
              Text(
                state.profile.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text('Email', style: Theme.of(context).textTheme.titleMedium),
              Text(
                state.profile.email,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text('Age', style: Theme.of(context).textTheme.titleMedium),
              Text(
                state.profile.dateOfBirth.year.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          _ => SizedBox.shrink(),
        };
      },
    );
  }
}
