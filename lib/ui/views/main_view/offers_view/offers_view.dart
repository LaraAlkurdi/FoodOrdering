import 'package:flutter/material.dart';
import 'package:food_1/ui/shared/utils.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Offers',
      style: TextStyle(
        fontSize:  screenWidth(20),
      ),),
    );
  }
}