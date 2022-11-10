import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:week6_tast_two/screens/check_out_screen.dart';

import '../logic/auth.dart';
import 'onboarding_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldState,
      drawer: menuBar(),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        _scaffoldState.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.brown,
                      )),
                  const SizedBox(
                    height: 150,
                    child: Image(
                        image: AssetImage("assets/images/home.png"),
                    ),
                  ),
                  const Text(
                    'Your coffee is almost ready...',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'Select the coffee you want and proceed to check-out',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      SizedBox(
                        height: 160,
                        width: 150,
                        child: Card(
                          child: Column(
                            children: const [
                              Image(
                                image: AssetImage('assets/images/home1.png'),
                                fit: BoxFit.cover,

                              ),
                              Gap(12),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('CAPPUCCINO',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        width: 150,
                        child: Card(
                          child: Column(
                            children: const [
                              Image(
                                image: AssetImage('assets/images/home2.png'),
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('CAFFÉ'
                                    ' MOCHA',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      SizedBox(
                        height: 180,
                        width: 150,
                        child: Card(
                          child: Column(
                            children: const [
                              Image(
                                image: AssetImage('assets/images/home3.png'),
                                fit: BoxFit.cover,
                              ),
                              Gap(20),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('ICED COFFEE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 180,
                        width: 150,
                        child: Card(
                          child: Column(
                            children: const [
                              Image(
                                image: AssetImage('assets/images/home4.png'),
                                fit: BoxFit.cover
                                ,
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Text('FRAPPUCCINO',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CheckOutScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                      ),

                      child: const Text("Proceed To CheckOut"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget menuBar(){
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const Gap(30),
          ListTile(
            leading: const Icon(
              Icons.delete_forever,
              color: Colors.brown,
            ),
            title: const Text('Delete Account'),
            onTap: () async {
              final auth = Auth();
              auth.deleteAccount();
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OnboardingScreen()));
            },
          ),
        ]
      ),
    );
  }
}
