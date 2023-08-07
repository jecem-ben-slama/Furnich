import 'package:flutter/material.dart';
import 'package:furnich/HomePage/screen1.dart';
import 'package:furnich/Components/header.dart';
import 'package:furnich/HomePage/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFE6DED8),
      body: Stack(
        children: [
          // Body
          CustomScrollView(
            slivers: <Widget>[
              //Header
              SliverAppBar(
                elevation: 0,
                backgroundColor: const Color(0xFFE6DED8),
                toolbarHeight: MediaQuery.of(context).size.height * 0.1,
                stretch: false,
                pinned: true,
                flexibleSpace: const Header(),
              ),
              //Body
              const SliverToBoxAdapter(
                child: Screen1(),
              ),
            ],
          ),

          // Products Page
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            top: status
                ? MediaQuery.of(context).size.height * 0.15
                : MediaQuery.of(context).size.height * 0.84,
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  status = !status;
                });
              },
              child: const Products(),
            ),
          ),
        ],
      ),
    );
  }
}
