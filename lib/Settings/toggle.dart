import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  const CustomToggle({super.key});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool isToggled = false; //inverse

  void _toggleSwitch() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: Container(
        width: 80.0,
        height: 40.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
              left: isToggled ? 40.0 : 0.0,
              right: isToggled ? 0.0 : 40.0,
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  color: Color(0xffbea16f),
                ),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment:
                  isToggled ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
