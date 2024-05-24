// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_fitness_app/components/my_back_button.dart';
import 'package:minimal_fitness_app/components/my_drawer.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
    .collection("Users")
    .doc(currentUser!.email)
    .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "ProfilePage",
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


      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot){

          //loading ...
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //error
          else if(snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          }
          //data
          else if (snapshot.hasData) {
            //extract map
            Map<String, dynamic>? user = snapshot.data!.data();



            return Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [

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

                  const SizedBox(height: 10,),

                  //profilepic
                  Container(
                    decoration: 
                      BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(24)
                      ),
                      
                      padding: EdgeInsets.all(25),
                      child: const Icon(
                        Icons.person,
                        size: 64,),
                  ),

                  const SizedBox(height: 10,),

                  //username
                  Text(
                    user!['username'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )
                  ),

                  const SizedBox(height: 10,),

                  //email
                  Text(
                    user['email'],
                    style: TextStyle(
                      color: Colors.grey[600]
                    )
                  ),


                ],
              ),
            );
          }

          else{
            return const Text("No data");
          }

        }
      )
    );

  }
}