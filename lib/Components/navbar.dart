import 'package:flutter/material.dart';
import 'package:furnich/Favorites/fav.dart';
import 'package:furnich/Settings/settings.dart';
import 'package:furnich/HomePage/home_page.dart';
import 'package:furnich/more.dart';
import 'package:furnich/Shop/shop.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List iconss = [
    "assets/icons/fav1.png",
    "assets/icons/bag.png",
    "assets/icons/home.png",
    "assets/icons/what.png",
    "assets/icons/more.png"
  ];
  List pages = [
    const Fav(),
    const Shop(),
    const HomePage(),
    const More(),
    const Settings()
  ];

  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1, child: navBar()),
      ),
    );
  }

  Widget navBar() {
    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(size: 30),
      iconSize: 30,
      elevation: 0,
      selectedItemColor: null,
      currentIndex: currentIndex,
      onTap: _onTabTapped,
      type: BottomNavigationBarType.fixed,
      items: [
        buildBottomNavigationBarItem(
            const ImageIcon(AssetImage('assets/icons/fav1.png')), '', 0),
        buildBottomNavigationBarItem(
            const ImageIcon(AssetImage('assets/icons/bag.png')), '', 1),
        buildBottomNavigationBarItem(
            const ImageIcon(AssetImage('assets/icons/home.png')), '', 2),
        buildBottomNavigationBarItem(
            const ImageIcon(AssetImage('assets/icons/what.png')), '', 3),
        buildBottomNavigationBarItem(
            const ImageIcon(AssetImage('assets/icons/more.png')), '', 4),
      ],
    );
  }

  buildBottomNavigationBarItem(ImageIcon iconn, String label, int index) {
    return BottomNavigationBarItem(
      icon: index == currentIndex
          ? Center(
              child: Stack(
                children: [
                  const ImageIcon(
                    AssetImage("assets/icons/blue.png"),
                    color: Color(0xff114956),
                    size: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 10),
                    child: ImageIcon(
                      AssetImage(iconss[currentIndex]),
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            )
          : iconn,
      label: label,
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
