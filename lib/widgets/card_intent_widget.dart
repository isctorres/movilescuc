import 'package:flutter/material.dart';

class CardIntentWidget extends StatelessWidget {
  const CardIntentWidget({super.key, this.icon});

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Icon(icon, size: 60, color: Colors.white,),
    );
  }
}