import 'package:flutter/material.dart';
import 'package:furnich/HomePage/get_status.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool isProductUp = true;
  List<bool> likedItems = List.generate(8, (index) => true);
  final List<String> images = [
    "assets/images/HomePage/bed1.png",
    "assets/images/HomePage/vareld.png",
    "assets/images/HomePage/sagstua.png",
    "assets/images/HomePage/virklund.png",
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
    "Sagstua",
    "Vareld",
    "Sagstua",
    "virklund",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Color(0xFFE6DED8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.only(top: 1, left: 14, right: 14),
      child: Column(
        children: [
          //Text
          SizedBox(
            height: 31,
            child: Row(
              children: [
                const Text("Just For You", style: TextStyle(fontSize: 22)),
                const Expanded(child: SizedBox()),
                TextButton(
                  onPressed: () {
                    setState(() {
                      getStatusValue(!isProductUp);
                      isProductUp = !isProductUp;
                    });
                  },
                  child: const Text(
                    "More >>",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ],
            ),
          ),
          //Product
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
    );
  }

  Widget box(int index) {
    bool isLiked = likedItems[index];
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
                    onPressed: () {
                      setState(() {
                        likedItems[index] = !likedItems[index];
                      });
                    },
                    icon: isLiked
                        ? const ImageIcon(
                            AssetImage("assets/icons/fav1.png"),
                          )
                        : const ImageIcon(
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
        Text(
          names[index],
          style: const TextStyle(fontFamily: "myFonts", fontSize: 22),
        ),
        const SizedBox(height: 8),
        const Text(
          "Bed frame, black, 140x200 cm",
          style: TextStyle(fontFamily: "myFonts", fontSize: 15),
        ),
        const SizedBox(height: 8),
        const Text(
          "725.00 SAR",
          style: TextStyle(
              fontFamily: "myFonts", fontSize: 17, color: Color(0xfff4624f)),
        ),
      ],
    );
  }
}
