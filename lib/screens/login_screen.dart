import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:week6_tast_two/screens/forgot_password_screen.dart';
import 'package:week6_tast_two/screens/home_screen.dart';
import 'package:week6_tast_two/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                const Gap(24),
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    // borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/login.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Gap(25),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Address',
                    hintText: 'Enter Email Address',
                  ),
                ),
                const Gap(20),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),
                ),
                const Gap(10),
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
                const Gap(24),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()));
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
                            MaterialPageRoute(builder: (context) => const RegisterScreen()));
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
    );
  }
}
