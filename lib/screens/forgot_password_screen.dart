import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:week6_tast_two/screens/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(48),
                const SizedBox(
                  height: 300,
                  child: Image(
                    image: AssetImage("assets/images/forgotpassword.png"),
                  ),
                ),
                const Center(
                  child: Text(
                    'Forgot Your Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.brown,
                    ),
                  ),
                ),
                const Gap(12),
                Center(
                  child: Text(
                    'Don\'t worry, it happens. Please enter the \nEmail address associated with your account \nto receive password reset instruction.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(30),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Address',
                    hintText: 'Enter Email Address',
                  ),
                ),
                const Gap(40),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),

                    child: const Text("Send"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
