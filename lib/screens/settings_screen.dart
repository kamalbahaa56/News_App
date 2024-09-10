import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'SettingsScreen',style: TextStyle(color: Colors.black,fontSize: 33,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}