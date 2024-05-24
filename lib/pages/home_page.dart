import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_fitness_app/components/my_back_button.dart';
import 'package:minimal_fitness_app/components/my_drawer.dart';
import 'package:minimal_fitness_app/components/my_list_tile.dart';
import 'package:minimal_fitness_app/components/my_post_button.dart';
import 'package:minimal_fitness_app/components/my_textfield.dart';
import 'package:minimal_fitness_app/database/firestore.dart';
import 'dart:developer';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  // firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  // text controller
  final TextEditingController newPostController = TextEditingController();

  // post a message
  void postMessage(){

    if(newPostController.text.isNotEmpty){
      
      //post message
      String message = newPostController.text;

      database.addPost(message);
    }

    // clear the controller
    newPostController.clear();

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "T R A C K",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary, // Change this to the desired text color
          ),         
        ),


        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary, // Drawer icon color
        ),
        
      ),
      drawer: const MyDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
          
            // text box for yuser to type
            Row(
              children: [

                //text field
                Expanded(child: 
                  MyTextField(
                    hintText: "Say something..", 
                    obscureText: false, 
                    controller: newPostController,
                  ),
                ),
                
                // post button
                MyPostButton(
                  onTap: (){

                    postMessage();
                  },
                ),
              ],
            ),
          
            // POSTS
            StreamBuilder(
              stream: database.getPostStream(), 
              builder: (context, snapshot){
                //show loading circle
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                //get all posts
                final posts = snapshot.data!.docs;

                //no data ?
                if(snapshot.data == null || posts.isEmpty){ 
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text("No posts.. post something!"),
                    )
                  );
                }

                //return as list
                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index){
                      // get each individual post
                      final post = posts[index];

                      // get data form each post
                      String message = post['PostMessage'];
                      String userEmail = post['UserEmail'];
                      Timestamp timestamp= post['TimeStamp'];
                      
                      // return as a list tile
                      return MyListTile(title: message, subTitle: userEmail);
                    },
                  )
                );
              }
            ),      
          ],
        ),
      ),
    );
  }
}