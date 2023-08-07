import 'package:flutter/material.dart';
import 'package:furnich/Components/header.dart';

class Fav1 extends StatefulWidget {
  const Fav1({super.key});

  @override
  State<Fav1> createState() => _Fav1State();
}

class _Fav1State extends State<Fav1> {
  final List<String> images = [
    "assets/images/HomePage/bed1.png",
    "assets/images/HomePage/vareld.png",
    "assets/images/HomePage/sagstua.png",
    "assets/images/HomePage/virklund.png",
  ];
  final List<String> names = [
    "Sagstua",
    "Vareld",
    "Sagstua",
    "virklund",
  ];
  List<String> desc = [
    "Bed frame, black, 140x200 cm",
    "Bedspread, dark grey, 230x250 cm",
    "Table lamp, brass/white",
    "Rug flatwood, in/outdoos, beige/darkgreyR",
  ];
  final List<String> prices = [
    "725.00 SAR",
    "299.00 SAR",
    "99.00 SAR",
    "249.00 SAR",
  ];
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
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: const BoxDecoration(
              color: Color.fromARGB(178, 247, 244, 242),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            padding: const EdgeInsets.only(top: 1, left: 14, right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text("Favorite products", style: TextStyle(fontSize: 22)),
                //Favorite
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width *
                          0.5 /
                          (MediaQuery.of(context).size.height * 0.38),
                      crossAxisSpacing: 15,
                    ),
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return box(index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget box(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(),
          ),
          child: Column(
            children: [
              //Liked Button
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage("assets/icons/favred.png"),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              //Image
              Image(
                image: AssetImage(images[index]),
                width: 120,
              ),
            ],
          ),
        ),
        //names
        Text(
          names[index],
          style: const TextStyle(fontFamily: "myFonts", fontSize: 22),
        ),
        const SizedBox(height: 8),
        //description
        Text(
          desc[index],
          style: const TextStyle(fontFamily: "myFonts", fontSize: 9),
        ),
        const SizedBox(height: 8),
        //price
        Text(
          prices[index],
          style: const TextStyle(
              fontFamily: "myFonts", fontSize: 17, color: Color(0xfff4624f)),
        ),
      ],
    );
  }
}
