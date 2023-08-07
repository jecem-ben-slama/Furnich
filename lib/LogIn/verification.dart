import 'package:flutter/material.dart';
import 'package:furnich/Components/navbar.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final TextEditingController fieldSix = TextEditingController();
  final TextEditingController fieldFive = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe6ded8),
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
                  fontSize: 23,
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
            const SizedBox(height: 10),
            //Code Handler
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Verification code ",
                      style: TextStyle(fontSize: 13, fontFamily: "myFont"),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        input(fieldOne, false),
                        input(fieldTwo, false),
                        input(fieldThree, false),
                        input(fieldFour, false),
                        input(fieldFive, false),
                        input(fieldSix, false),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Please enter the verification code that you recieved via SMS",
                      style: TextStyle(fontSize: 13, fontFamily: "myFont"),
                    ),
                    const SizedBox(height: 45),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.84,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: const Color(0xFF114956),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavBar(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(fontFamily: "myFont", fontSize: 20),
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

  Widget input(controller, autoFocus) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextFormField(
        autofocus: autoFocus,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '!';
          }
          final RegExp numericRegex = RegExp(r'^[0-9]+$');
          if (!numericRegex.hasMatch(value)) {
            return '!';
          }
          return null;
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
