import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:week6_tast_two/screens/login_screen.dart';
import 'package:week6_tast_two/screens/register_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFEDE7DD),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 360,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/onboarding.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(50),
              const Center(
                child: Text(
                  'Coffee has never',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Seemed so Close!',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              const Gap(15),
              const Center(
                child: Text(
                  'In less than a minute, \n order a cup coffee to your location.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.brown)),
                    child: const Text('Register'),
                  ),
                  const Gap(24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.brown)),
                    child: const Text("Login"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
