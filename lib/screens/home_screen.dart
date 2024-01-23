import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:week6_tast_two/screens/widgets/coffee_card.dart';
import 'package:week6_tast_two/utils/implementation/api_service.dart';
import 'package:week6_tast_two/utils/model.dart';

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
                  FutureBuilder<List<CoffeeType>>(
                    future: getCoffeeType(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                clipBehavior: Clip.none,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int i) {
                                  return CoffeeCard(
                                    coffeeType: snapshot.data![i],
                                  );
                                }));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const Column(
                        children: [
                          CircularProgressIndicator(
                            color: Colors.brown,
                            strokeWidth: 1.5,
                          ),
                        ],
                      );
                    },
                  ),
                  const Gap(10),
                  const Gap(20),
                  // SizedBox(
                  //   height: 55,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => const CheckOutScreen()));
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.brown,
                  //     ),
                  //     child: const Text("Proceed To CheckOut"),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget menuBar() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(children: [
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
                MaterialPageRoute(
                    builder: (context) => const OnboardingScreen()));
          },
        ),
      ]),
    );
  }
}
