import 'package:flutter/material.dart';
import 'package:personal_habit_tracker_app/core/utils/formatters.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/domain/entities/profile_entity.dart';
import 'package:personal_habit_tracker_app/features/sub/sign_out/presentation/pages/sign_out_feature_widget.dart';
import 'package:sizer/sizer.dart';

class ProfileBottomWidget extends StatelessWidget {
  final ProfileEntity profileEntity;
  const ProfileBottomWidget({super.key, required this.profileEntity});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 5,
        children: [
          SizedBox(
            height: 10.sh,
            child: CircleAvatar(
              minRadius: 60,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
          ),
          ListTile(
            title: Text('Name', style: Theme.of(context).textTheme.titleLarge),
            subtitle: Text(
              profileEntity.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            title: Text(
              'Email',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              profileEntity.email,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            title: Text('Age', style: Theme.of(context).textTheme.titleMedium),
            subtitle: Text(
              Formatters.getAge(profileEntity.dateOfBirth),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            title: Text(
              'Total Habits',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              profileEntity.totalHabits.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            title: Text(
              'No. Of Completions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              profileEntity.noOfCompletes.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SignOutFeatureWidget(),
        ],
      ),
    );
  }
}
