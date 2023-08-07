import 'package:flutter/material.dart';
import 'package:furnich/LogIn/register_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SMSCode extends StatefulWidget {
  const SMSCode({super.key});

  @override
  State<SMSCode> createState() => _SMSCodeState();
}

class _SMSCodeState extends State<SMSCode> {
  final _formKey = GlobalKey<FormState>();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6DED8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                image: DecorationImage(
                    image: AssetImage("assets/images/couchsms.png"),
                    fit: BoxFit.fill),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.52,
            ),
            const SizedBox(height: 18),
            //Welcome Text
            const Text(
              "WELCOME TO",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  fontFamily: "myFont"),
            ),
            const SizedBox(height: 26),
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
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 25),
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
                    const Text(
                      "You will recieve a verification code by SMS",
                      style: TextStyle(fontFamily: "myFont"),
                    ),
                    const SizedBox(height: 45),
                    //Button
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.84,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF114956),
                        ),
                        onPressed: _formKey.currentState?.validate() == true
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              }
                            : null,
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

  bool isValidPhoneNumber(String phoneNumber) {
    final RegExp phoneRegex = RegExp(r'^\+[0-9]{6,}$');
    return phoneRegex.hasMatch(phoneNumber);
  }
}
