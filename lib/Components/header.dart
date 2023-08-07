import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
      child: const Center(
        child: Row(
          children: [
            SizedBox(height: 10),
            //Furnich
            SizedBox(
              width: 130,
              height: 40,
              child: Image(
                image: AssetImage("assets/images/furnich.png"),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Text(
              "Hi Seif",
              style: TextStyle(fontSize: 27),
            ),
            SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: Image(
                image: AssetImage("assets/icons/notification.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
