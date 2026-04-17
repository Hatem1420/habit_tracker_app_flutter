import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_habit_tracker_app/core/extensions/context_extensions.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/presentation/cubit/profile_cubit.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/presentation/pages/profile_bottom_widget.dart';


class ProfileFeatureWidget extends StatelessWidget {
  const ProfileFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<ProfileCubit>();
          return GestureDetector(
            onTap: () => context.showBottomSheet(widget: ProfileBottomWidget()),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          );
        },
      ),
    );
  }
}
