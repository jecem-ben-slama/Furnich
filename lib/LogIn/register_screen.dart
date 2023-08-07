import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:furnich/LogIn/verification.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final password = TextEditingController();
  final mail = TextEditingController();
  final phone = TextEditingController();

  bool isSwitched = false;

  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6DED8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.zero),
                image: DecorationImage(
                    image: AssetImage("assets/images/couch.png"),
                    fit: BoxFit.fill),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.23,
            ),
            const SizedBox(height: 22),
            // Welcome Text
            const Text(
              "REGISTER AT",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  fontFamily: "myFont"),
            ),
            const SizedBox(height: 10),
            Container(
              height: 25,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/furnich.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 15),
            //Inputs
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Name Input
                    TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                        labelText: 'Full name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    const SizedBox(height: 10),
                    // Email Input
                    TextFormField(
                      controller: mail,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        } else if (!isValidEmail(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    const SizedBox(height: 10),
                    //Password Inout
                    TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),
                    //Switch Button:inverted
                    Row(
                      children: [
                        const Text(
                          "I got an invitaion from someone else",
                          style: TextStyle(fontFamily: "myFont"),
                        ),
                        const SizedBox(width: 35),
                        FlutterSwitch(
                          inactiveToggleColor: Colors.grey.shade400,
                          activeToggleColor: Colors.brown,
                          toggleSize: 30,
                          switchBorder: Border.all(color: Colors.black),
                          value: isSwitched,
                          activeColor: const Color(0xFFE6DED8),
                          inactiveColor:
                              const Color.fromARGB(181, 230, 222, 216),
                          onToggle: (bool value) {
                            setState(() {
                              isSwitched = !isSwitched;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "The phone of the person who sent you the invitation",
                      style: TextStyle(fontFamily: "myFont"),
                    ),
                    const SizedBox(height: 16),
                    //Number Input
                    IntlPhoneField(
                      validator: (phone) {
                        if (phone!.isValidNumber()) {
                          return 'Please enter your phone number';
                        }
                        if (!isValidPhoneNumber(phone.toString())) {
                          return 'Please enter a valid phone number';
                        }
                        return null; // Return null if the input is valid
                      },
                      controller: phone,
                      initialCountryCode: "SA",
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          hintText: "— — — — — — — — ",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                    const SizedBox(height: 15),
                    //Radio Button
                    Row(
                      children: [
                        FlutterSwitch(
                          inactiveToggleColor: Colors.transparent,
                          activeToggleColor: Colors.brown,
                          toggleSize: 10,
                          width: 20,
                          height: 20,
                          switchBorder: Border.all(color: Colors.black),
                          value: ispressed,
                          activeColor: const Color(0xFFE6DED8),
                          inactiveColor: const Color(0xFFE6DED8),
                          onToggle: (bool value) {
                            setState(() {
                              ispressed = !ispressed;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "I agree to the terms and conditions",
                          style: TextStyle(
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //Button
                    SizedBox(
                      height: 46,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF114956),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              ispressed == true) {
                            _formKey.currentState!.save();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Verification()),
                            );
                          } else if (ispressed == false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please agree to the terms of use',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(fontFamily: "myFont", fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Phone validation
  bool isValidPhoneNumber(String phoneNumber) {
    final RegExp phoneRegex = RegExp(r'^\+[0-9]{6,}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

//Email validation
  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@[a-zA-Z\d]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }
}
