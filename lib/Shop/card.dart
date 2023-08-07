import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

Widget cardSelection(context, text, isPressed, asset, function) {
  return Container(
    width: MediaQuery.of(context).size.width * 1,
    height: MediaQuery.of(context).size.height * 0.07,
    decoration: BoxDecoration(
      color: isPressed ? const Color(0xffeee9e5) : Colors.transparent,
      border: Border.all(color: Colors.grey),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
    ),
    child: Row(
      children: [
        const SizedBox(width: 15),
        FlutterSwitch(
          inactiveToggleColor: Colors.transparent,
          activeToggleColor: const Color(0xffbea16f),
          toggleSize: 30,
          width: 30,
          height: 30,
          switchBorder: Border.all(color: Colors.grey),
          value: isPressed,
          activeColor: const Color(0xfff7f4f2),
          inactiveColor: const Color(0xfff7f4f2),
          onToggle: function,
        ),
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(fontSize: 19),
        ),
        const Expanded(child: SizedBox()),
        Image(
          image: asset,
          width: 80,
        ),
        const SizedBox(width: 15),
      ],
    ),
  );
}
