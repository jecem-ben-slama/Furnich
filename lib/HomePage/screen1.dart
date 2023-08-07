import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<String> circleImage = [
    "assets/images/HomePage/storage.png",
    "assets/images/HomePage/potsplants.png",
    "assets/images/HomePage/painting.png",
    "assets/images/HomePage/childbed.png",
    "assets/images/HomePage/storage.png",
  ];
  List<String> circleName = [
    "Storage",
    "Pots & plants",
    "Painting",
    "Children's beds",
    "Caprets"
  ];
  List<String> rectangleImage = [
    "assets/images/HomePage/tapi.png",
    "assets/images/HomePage/gladstad.png",
    "assets/images/HomePage/bild.png",
    "assets/images/HomePage/svartpoppel.png",
    "assets/images/HomePage/sanela.png",
  ];
  List<String> rectangleName = [
    "Blanskog",
    "Gladstad",
    "bild",
    "Svartpoppel",
    "Sanela"
  ];
  List<String> price = [
    "139.00 SAR",
    "2.245.00 SAR",
    "19.00 SAR",
    "59.00 SAR",
    "49.00 SAR",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(178, 247, 244, 242),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  //Search Bar
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFeee9e5),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9, left: 9),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Search",
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                              )),
                        ),
                        const Expanded(child: SizedBox()),
                        IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.brown),
                          onPressed: () {},
                          icon: const Padding(
                            padding: EdgeInsets.only(top: 6.0),
                            child: SizedBox(
                                width: 30,
                                height: 30,
                                child: Image(
                                    image:
                                        AssetImage("assets/icons/filter.png"))),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search_outlined)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  //Image
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: const Stack(
                      children: [
                        Image(
                          image: AssetImage(
                              "assets/images/HomePage/couchhome.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 50),
                          child: Text(
                            "All our products can be     customized to fit your spave",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "myFonts",
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Categories
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: circleImage.length,
                        itemBuilder: (context, index) {
                          return circle(index);
                        }),
                  ),

                  const Divider(
                    thickness: 0.5,
                    height: 1.5,
                    color: Colors.grey,
                  ),

                  Row(
                    children: [
                      const Text("Flash Sale",
                          style:
                              TextStyle(fontFamily: "myFonts", fontSize: 22)),
                      const Expanded(child: SizedBox()),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "More >>",
                          style: TextStyle(color: Colors.brown),
                        ),
                      ),
                    ],
                  ),
                  //Products
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 162,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: rectangleImage.length,
                        itemBuilder: (context, index) {
                          return rectangle(index);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rectangle(index) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 78,
              height: 115,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(rectangleImage[index]),
                  )),
            ),
            Text(rectangleName[index]),
            const SizedBox(height: 15),
            Text(
              price[index],
              style: const TextStyle(color: Color(0xfff4624f)),
            ),
          ],
        ),
        const SizedBox(width: 5),
      ],
    );
  }

  Widget circle(index) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircleAvatar(
                child: Image(
                  image: AssetImage(circleImage[index]),
                ),
              ),
            ),
            Text(circleName[index]),
          ],
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
