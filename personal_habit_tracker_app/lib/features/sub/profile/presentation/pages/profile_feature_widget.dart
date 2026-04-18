import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_habit_tracker_app/core/extensions/context_extensions.dart';
import 'package:personal_habit_tracker_app/core/widgets/loading_widget.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/presentation/cubit/profile_cubit.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/presentation/cubit/profile_state.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/presentation/pages/profile_bottom_widget.dart';

class ProfileFeatureWidget extends StatelessWidget {
  const ProfileFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final profileCubit = context.read<ProfileCubit>();
          return BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileSuccessState) {
                context.showBottomSheet(
                  widget: ProfileBottomWidget(profileEntity: state.profile),
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () => profileCubit.getProfileMethod(),
                  child: CircleAvatar(
                    child: state is ProfileLoadingState
                        ? LoadingWidget()
                        : Icon(Icons.person, color: Colors.white),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
