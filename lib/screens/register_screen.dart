import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:week6_tast_two/screens/login_screen.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          'Create Your Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.brown,
                          ),
                        ),
                        Text(
                          'Register and get started',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        const Gap(16),
                        Container(
                          height: 140,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            //borderRadius: BorderRadius.all(Radius.circular(40)),
                            image: DecorationImage(
                              image: AssetImage('assets/images/login.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Gap(10),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                            hintText: 'Enter Email Address',
                          ),
                        ),
                        const Gap(10),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter Password',
                          ),
                        ),
                        const Gap(10),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                            hintText: 'Enter Password again',
                          ),
                        ),
                        const Gap(20),
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

                            child: const Text("Register"),
                          ),
                        ),
                        const Gap(8),
                        Center(
                          child: Text(
                            'By clicking this button, you agree to our terms & conditions',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            textAlign: TextAlign.center,),
                        )
                      ],
                    ),),),),);
  }
}
