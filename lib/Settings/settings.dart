import 'package:flutter/material.dart';
import 'package:furnich/Components/header.dart';
import 'package:furnich/Settings/toggle.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFE6DED8),
      body: Column(
        children: [
          //Header
          SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.14,
              child: const Header()),

          //Body
          Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color.fromARGB(178, 247, 244, 242),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(25),
                  right: Radius.circular(25),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.81,
              child: Column(
                children: [
                  //Container1:Notification
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE6DED8),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: const Row(
                      children: [
                        Text(
                          "Active notifications",
                          style: TextStyle(fontSize: 15),
                        ),
                        Expanded(child: SizedBox()),
                        CustomToggle(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Container2:Image
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/picsettings.png")),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 12.5,
                          left: 15,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.76,
                            height: 30,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              color: Color(0xffbea16f),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 26,
                          left: 20,
                          child: Row(
                            children: [
                              Text(
                                "Find your dream living room  ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 8),
                                  Image(
                                    image:
                                        AssetImage("assets/images/arrow.png"),
                                    width: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Container3
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                      color: const Color.fromARGB(178, 247, 244, 242),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.13,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Profile "),
                        SizedBox(height: 6),
                        Text("Leave Feedback "),
                        SizedBox(height: 6),
                        Text("Contact support "),
                        SizedBox(height: 6),
                        Text("About company "),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Container4
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                      color: const Color.fromARGB(178, 247, 244, 242),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Terms and conditions "),
                        SizedBox(height: 6),
                        Text("Legal policy "),
                        SizedBox(height: 6),
                        Text("Language: English "),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Container5
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                      color: const Color.fromARGB(178, 247, 244, 242),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: const Text(
                        "Share the application with familly and  friends"),
                  ),

                  const SizedBox(height: 20),
                  //Container6
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                      color: const Color.fromARGB(178, 247, 244, 242),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.075,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Delete your account "),
                        SizedBox(height: 6),
                        Text("Log out "),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
