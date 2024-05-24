import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_fitness_app/components/my_button.dart';
import 'package:minimal_fitness_app/components/my_textfield.dart';
import 'package:minimal_fitness_app/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget{

  void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  //register method
  void register() async {
    //show loading circle

    showDialog(
      context: context, 
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
        )
      );

    //make sure paswords match
    if (passwordController.text != confirmPwController.text){
      //pop loading circle
      Navigator.pop(context);
      //show error message to user
      displayMessageToUser("Passwords don't match!", context);
    }
    else{
      try{
        
      //try creating a new user
      UserCredential? userCredential = await
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,
        );

      //create user document and add it to firestore
      createUserDocument(userCredential);

      //pop loading cicle
      Navigator.pop(context);

    } on FirebaseAuthException catch(e){
      //pop loading circle
      Navigator.pop(context);
      //display message to user
      displayMessageToUser(e.code, context);
    }
    }
  }


  //create user document and sent it to firestore
  Future <void> createUserDocument(UserCredential? userCredential) async { 

    if(userCredential != null && userCredential.user != null){
      await FirebaseFirestore
        .instance
        .collection("Users")
        .doc(userCredential.user!.email)
        .set({
          'email': userCredential.user!.email,
          'username': usernameController.text,
      });
    }

  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
          
              //logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 25),
          
              //app name
              const Text(
              "M I N I M A L",
              style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 50),
              

              //username textfield
              MyTextField(
                hintText: "Username", 
                obscureText: false, 
                controller: usernameController
                ),
                
              const SizedBox(height: 10),
              
          
              //email textfield
              MyTextField(
                hintText: "Email", 
                obscureText: false, 
                controller: emailController
                ),
                
              const SizedBox(height: 10),

              //password
              MyTextField(
                hintText: "Password", 
                obscureText: true, 
                controller: passwordController,
                ),

              const SizedBox(height: 10),


              //confirm password
              MyTextField(
                hintText: "Confirm Password", 
                obscureText: true, 
                controller: confirmPwController
                ),

              const SizedBox(height: 25),

              //sign in button
              MyButton(
                text: "Register", 
                onTap: register,
                ),

              const SizedBox(height: 25),
              
              //Don't have an account Register here?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,              
                    child: const Text("Login Here",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    )
                  ),
                  )                 
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}