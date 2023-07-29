import 'package:flutter/material.dart';
import 'package:food_1/ui/shared/utils.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Menu',
      style: TextStyle(
        fontSize: screenWidth(20),
      ),),
    );
  }
}