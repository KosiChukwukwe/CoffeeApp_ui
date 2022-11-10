import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:week6_tast_two/screens/forgot_password_screen.dart';
import 'package:week6_tast_two/screens/home_screen.dart';
import 'package:week6_tast_two/screens/register_screen.dart';

import '../logic/auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      // appBar: AppBar(
      //   backgroundColor: Colors.white
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.brown,
                      )),
                  const Text(
                    'Welcome Back,',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'Login to continue',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const Gap(10),
                  Container(
                    height: 160,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      // borderRadius: BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/login.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                      hintText: 'Enter Email Address',
                    ),
                      validator:(val){
                        if(val!.isEmpty){
                          return "Required";
                        }
                      }
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                      validator:(val){
                        if(val!.isEmpty){
                          return "Required";
                        }
                        if(val.length < 6){
                          return "Password must be atleast 6 characters long";
                        }
                        if(val.length > 20){
                          return "Password must be less than 20 characters";
                        }
                      }
                  ),
                  const Gap(4),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                        },
                        child: Text('Forgot Password?',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black.withOpacity(0.5),
                          ),)

                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()){
                          await auth.login(
                            email: emailController.text,
                            password: passwordController.text,);
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                      ),

                      child: const Text("Login"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ), TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterScreen()));
                        },
                        child: const Text('Register',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.brown,
                          ),)

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
