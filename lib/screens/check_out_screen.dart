import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:week6_tast_two/screens/onboarding_screen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 300,
                  child: Image(
                    image: AssetImage("assets/images/checkout.jpg"),
                  ),
                ),
                const Gap(24),
                const Center(
                  child: Text(
                    'Your coffee is just a click away...',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 42,
                      color: Colors.brown,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(10),
                Center(
                  child: Text(
                    'Your order has been added to cart and\nIn no time, it will be at your doorstep!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(58),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const OnboardingScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),

                    child: const Text("Log Out"),
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
