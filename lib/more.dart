import 'package:flutter/material.dart';
import 'package:furnich/Components/header.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  bool isProductUp = true;
  List<bool> likedItems = List.generate(8, (index) => true);
  final List<String> images = [
    "assets/images/HomePage/sagstua.png",
    "assets/images/HomePage/virklund.png",
  ];
  final List<String> names = [
    "Sagstua",
    "virklund",
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
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color.fromARGB(178, 247, 244, 242),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(25),
                  right: Radius.circular(25),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
                  //:Image
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/HomePage/finddream.png")),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 12.5,
                          left: 15,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.76,
                            height: 30,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              color: Color(0xffbea16f),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 26,
                          left: 20,
                          child: Row(
                            children: [
                              Text(
                                "Find your dream living room  ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 8),
                                  Image(
                                    image:
                                        AssetImage("assets/images/arrow.png"),
                                    width: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  //Text
                  SizedBox(
                    height: 31,
                    child: Row(
                      children: [
                        const Text("Limited Edition",
                            style: TextStyle(fontSize: 22)),
                        const Expanded(child: SizedBox()),
                        TextButton(
                          onPressed: () {
                            /* setState(() {
                        getStatusValue(!isProductUp);
                        isProductUp = !isProductUp;
                      });*/
                          },
                          child: const Text(
                            "More >>",
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Products
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width *
                              0.5 /
                              (MediaQuery.of(context).size.height * 0.6),
                          crossAxisSpacing: 15,
                        ),
                        itemCount: images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return box(index);
                        }),
                  ),
                ],
              )),
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
          height: MediaQuery.of(context).size.height * 0.33,
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
