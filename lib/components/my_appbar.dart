import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key,
  required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary, // Change this to the desired text color
          ),
        ),        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
    );
  }
}
