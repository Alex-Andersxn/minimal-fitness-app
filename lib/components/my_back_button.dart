import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => Navigator.pop(context),
      child: Container(
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.inversePrimary,  
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
        padding: EdgeInsets.all(10), 
      ),
    );
  }
}