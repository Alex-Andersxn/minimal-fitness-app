import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  //logout the user
  void logout(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
        //drawer headder
        Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.inversePrimary,
                )
              ),

          //home tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("H O M E"),
              onTap: () {
                Navigator.pop(context);
                //navigate to home page
                Navigator.pushNamed(context, "/home_page");
              }
            ),
          ),
          const SizedBox(height: 25),
          
          //profile tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.person, 
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("P O F I L E"),
              onTap: () {
                Navigator.pop(context);
                //navigate to Profile page
                Navigator.pushNamed(context, "/profile_page");
              }
            ),
          ),
          const SizedBox(height: 25),

          //user tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.people,
                color: Theme.of(context).colorScheme.inversePrimary,
                ),
              title: const Text("U S E R S"),
              onTap: () {
                Navigator.pop(context);
                //navigate to Users page
                Navigator.pushNamed(context, "/users_page");
              }
            ),
          ),
          const SizedBox(height: 25),
            ],
          ),

          //Logout
          Padding(
            padding: const EdgeInsets.only(left: 25.0,bottom: 25.0),

            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
                ),
              title: const Text("L O G O U T"),
              onTap: () {
                //logout
                logout();
                Navigator.pop(context);
              }
            ),
          ),
      ],),
    );
  }
}