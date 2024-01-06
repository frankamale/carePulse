import 'package:carepulse/models/user%20auth/firebase_auth_services.dart';
import 'package:carepulse/models/user%20auth/form_container.dart';
import 'package:carepulse/pages/1_home_page.dart';
import 'package:carepulse/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  bool _isLoading = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:  Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Text("Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               FormContainer(
                controller: _emailController,
                hintText: 'email',
                isPasswordField: false,
              ),
              const SizedBox(
                height: 20,
              ),
               FormContainer(
                 controller: _usernameController,
                hintText: 'Username',
                isPasswordField: false,
              ),
              const SizedBox(
                height: 20,
              ),
               FormContainer(
                 controller: _passwordController,
                hintText: 'password',
                isPasswordField: true,
              ),

              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: _signUp,
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:  Center(
                    child: _isLoading? const CircularProgressIndicator(color: Colors.white,):const Text('Sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,

                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const Login()), (route) => false);
                    },
                    child: const Text('  Login',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        )
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );

  }

  void _signUp() async{
    final fireStore = FirebaseFirestore.instance;

    setState(() {
      _isLoading = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;
    String username = _usernameController.text;

    User? user = await _auth.signUpWithEmailAndPassword(password, email);

    setState(() {
      _isLoading = false;
    });


    if (user != null){

      print('User successfully created');

      fireStore.collection('User_Info').add({
        'email': email,
        'password': password,
        'username': username,
      });
      saveUserData(email, password, username);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);

    }
    else{
      print('Some error occured');
    }
  }
  Future<void> saveUserData(String userId, String userEmail, String userName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
    prefs.setString('userEmail', userEmail);
    prefs.setString('userName', userName);
  }
}
