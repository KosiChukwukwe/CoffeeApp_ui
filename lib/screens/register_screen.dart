import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:week6_tast_two/screens/login_screen.dart';

import '../logic/auth.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();
  late bool _obscureText;
  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: 160,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      //borderRadius: BorderRadius.all(Radius.circular(40)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/login.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(20),
                  TextFormField(
                      controller: emailController,
                      cursorColor: Colors.brown,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'Enter Email Address',
                        labelStyle: const TextStyle(color: Colors.brown),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.brown),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.brown),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.brown),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Required";
                        }
                      }),
                  const Gap(10),
                  TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      cursorColor: Colors.brown,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.brown),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.brown),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.brown),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.brown),
                          ),
                          hintText: 'Enter Password',
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 18,
                              color: Colors.brown,
                            ),
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          )),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Required";
                        }
                        if (val.length < 6) {
                          return "Password must be atleast 6 characters long";
                        }
                        if (val.length > 20) {
                          return "Password must be less than 20 characters";
                        }
                        return null;
                      }),
                  const Gap(4),
                  Text(
                    'Password must contain at least 6 characters',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = !isLoading;
                        });
                        if (_formKey.currentState!.validate()) {
                          await auth.register(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          if (mounted) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                      ),
                      child: (isLoading)
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.5,
                            )
                          : const Text("Register"),
                    ),
                  ),
                  const Gap(10),
                  Center(
                    child: Text(
                      'By clicking this button, you agree to our terms & conditions',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
