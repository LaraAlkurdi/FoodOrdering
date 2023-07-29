import 'package:flutter/material.dart';
import 'package:food_1/ui/shared/utils.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile',
      style: TextStyle(
        fontSize:  screenWidth(20),
      ),),
    );
  }
}