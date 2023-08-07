import 'package:flutter/material.dart';
import 'package:furnich/Shop/card.dart';
import 'package:furnich/Components/header.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int selectedSwitchIndex = 0;
  String selectedSwitchName = "";
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Shopping Cart",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  //Container1 : products
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: const Color.fromARGB(178, 247, 244, 242),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  const SizedBox(height: 20),
                  //Container2 : Image
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/HomePage/finddream.png")),
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
                  //Payment
                  const Text("Payment Method", style: TextStyle(fontSize: 25)),
                  const SizedBox(height: 20),
                  //Mada
                  cardSelection(
                    context,
                    "Mada",
                    selectedSwitchIndex ==
                        1, // Check if it's the selected switch
                    const AssetImage("assets/images/shop/mada.png"),
                    (bool value) {
                      setState(() {
                        if (value) {
                          selectedSwitchIndex = 1; // Set the current index to 1
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 5),
                  //Visa
                  cardSelection(
                    context,
                    "Visa",
                    selectedSwitchIndex ==
                        2, // Check if it's the selected switch
                    const AssetImage("assets/images/shop/visa.png"),
                    (bool value) {
                      setState(() {
                        if (value) {
                          selectedSwitchIndex = 2; // Set the current index to 2
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 5),
                  //MasterCard
                  cardSelection(
                    context,
                    "Master",
                    selectedSwitchIndex ==
                        3, // Check if it's the selected switch
                    const AssetImage("assets/images/shop/mc.png"),
                    (bool value) {
                      setState(() {
                        if (value) {
                          selectedSwitchIndex = 3; // Set the current index to 3
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  //Button
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11)),
                          backgroundColor: const Color(0xffbea16f),
                        ),
                        onPressed: () {
                          switch (selectedSwitchIndex) {
                            case 1:
                              selectedSwitchName = "Mada";
                              break;
                            case 2:
                              selectedSwitchName = "Visa";
                              break;
                            case 3:
                              selectedSwitchName = "Master";
                              break;
                            default:
                              break;
                          }
                        },
                        child: const Text("Pay Now")),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
