import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_fitness_app/components/my_back_button.dart';
import 'package:minimal_fitness_app/components/my_drawer.dart';
import 'package:minimal_fitness_app/components/my_list_tile.dart';
import 'package:minimal_fitness_app/helper/helper_functions.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "UserPage",
      //     style: TextStyle(
      //       color: Theme.of(context).colorScheme.primary, // Change this to the desired text color
      //     ),
      //   ),
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   elevation: 0,
      //   iconTheme: IconThemeData(
      //     color: Theme.of(context).colorScheme.primary, // Drawer icon color
      //   ),
        
      // ),

      // drawer: MyDrawer(),
    
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context,snapshot){
          
          //error
          if(snapshot.hasError) {
            displayMessageToUser("Something went wrong!", context);
          }

          //loading ...
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          //data
          
          if(snapshot.data == null){ 
            return const Text("No data");
          }

          //get all users
          final users = snapshot.data!.docs;
          return Column(
            children:[

              const Padding(
                padding: EdgeInsets.only(
                  top: 50.0,
                  left: 25
                  ),
                child: Row(
                  children: [
                    MyBackButton(),
                  ],
                ),
              ),


              //list of users in the app
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index){
                
                    final user = users[index];
                
                    return MyListTile(
                      title: user['username'], 
                      subTitle: user['email']
                    );
                  }
                ),
              ),
            ]
          );
        },
      ),
    
    
    
    );
  }
}