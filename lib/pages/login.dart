import 'package:carepulse/models/user%20auth/firebase_auth_services.dart';
import 'package:carepulse/models/user%20auth/form_container.dart';
import 'package:carepulse/pages/1_home_page.dart';
import 'package:carepulse/pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();


  }
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:  Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Text("Login",
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
                 controller: _passwordController,
                hintText: 'password',
                isPasswordField: true,
              ),

              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  logIn();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:  Center(
                    child: _isLoading? const CircularProgressIndicator(color: Colors.white,):const Text('Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Text("Don't have an account?",
                   style: TextStyle(
                     fontSize: 15,
                     color: Colors.black,

                   ),
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignUp()), (route) => false);
                   },
                   child: const Text('  Sign up',
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
  void logIn() async {
    setState(() {
      _isLoading = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.logInWithEmailAndPassword(password, email);
    setState(() {
      _isLoading = false;
    });

    if (user != null){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
      print('User logged in successfully');
    }
  }
}
