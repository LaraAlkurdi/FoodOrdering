import 'package:flutter/material.dart';
import 'package:food_1/ui/shared/utils.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('More',
      style: TextStyle(
        fontSize:  screenWidth(20),
      ),),
    );
  }
}