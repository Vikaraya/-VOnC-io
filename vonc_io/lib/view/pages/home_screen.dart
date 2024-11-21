import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vonc_io/common_widget/data.dart';
import 'package:vonc_io/view/pages/cervices.dart';
import 'package:vonc_io/view/pages/food_page.dart';
import 'package:vonc_io/view/pages/living_Essentials.dart';
import 'package:vonc_io/view/pages/living_generals.dart';
import 'package:vonc_io/view/pages/offers_page.dart';
import 'package:vonc_io/view/pages/vonc_io_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _CrossAxisCount = 2;

  double _aspectRatio = 1.5;

  VeiwType _viewType = VeiwType.grid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: CarouselSlider(
                items: List.generate(
                  AppData.CategoriesStyleImages.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            switch (index) {
                              case 0:
                                return const OffersPage();
                              case 1:
                                return const FoodPage();
                              case 2:
                                return const LivingEssentials();
                              case 3:
                                return const LivingGenerals();
                              case 4:
                                return const Cervices();

                              default:
                                return const HomeScreen();
                            }
                          }),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(AppData.innerStyleImages
                              .map((e) => e)
                              .toList()[index]),
                          fit: BoxFit.fill,
                        ),
                      )),
                    );
                  },
                ),
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: _aspectRatio,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              height: 30,
              color: Color(0xFF212325),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "   Categories",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (_viewType == VeiwType.list) {
                          _CrossAxisCount = 2;
                          _aspectRatio = 1.5;
                          _viewType = VeiwType.grid;
                        } else {
                          _CrossAxisCount = 1;
                          _aspectRatio = 5;
                          _viewType = VeiwType.list;
                        }
                      });
                    },
                    icon: _viewType == VeiwType.grid
                        ? SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.asset(
                              "assets/icons/cateogrie_icon-removebg-preview.png",
                              height: 80,
                              width: 80,
                            ),
                          )
                        : Icon(Icons.view_list_outlined, color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.30,
                margin: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    _viewType == VeiwType.grid
                        ? Stack(
                            children: [
                              GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: _CrossAxisCount,
                                        childAspectRatio: _aspectRatio),
                                itemCount: AppData.CategoriesStyleImages.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                switch (index) {
                                                  case 0:
                                                    return const FoodPage();
                                                  case 1:
                                                    return const LivingEssentials();
                                                  case 2:
                                                    return const LivingGenerals();
                                                  case 3:
                                                    return const Cervices();
                                                  case 4:
                                                    return const VoncIoScreens();
                                                  default:
                                                    return const HomeScreen();
                                                }
                                              }),
                                            );
                                          },
                                          child: Center(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(AppData
                                                          .CategoriesStyleImages[
                                                      index]),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  width: 3,
                                                  color: AppData
                                                      .borderColors[index],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 15.0),
                                          child: Text(
                                            AppData.CategoriesText[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VoncIoScreens()),
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/icons/vonc_io_main-removebg-preview.png", // Replace with your image asset
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            children: [
                              ListView.builder(
                                itemCount: AppData.CategoriesStyleImages.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Stack(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                  switch (index) {
                                                    case 0:
                                                      return const FoodPage();
                                                    case 1:
                                                      return const LivingEssentials();
                                                    case 2:
                                                      return const LivingGenerals();
                                                    case 3:
                                                      return const Cervices();
                                                    case 4:
                                                      return const VoncIoScreens();
                                                    default:
                                                      return const HomeScreen();
                                                  }
                                                }),
                                              );
                                            },
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Container(
                                                height: 180,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(AppData
                                                            .CategoriesStyleImages[
                                                        index]),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        width: MediaQuery.sizeOf(context).width,
                                        child: Container(
                                          color: Colors.transparent,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: Center(
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                AppData.CategoriesText[index],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VoncIoScreens()),
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/icons/vonc_io_main-removebg-preview.png", // Replace with your image asset
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                )),
            SizedBox(
              height: 1,
            ),
            Container(
              height: 30,
              width: MediaQuery.sizeOf(context).width,
              color: Color(0xFF212325),
              child: Text(
                " Foods",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                      children: AppData.FoodImages.map((image) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const FoodPage();
                                }),
                              );
                            },
                            child: Container(
                              height: 150,
                              width: MediaQuery.sizeOf(context).width - 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const FoodPage();
                              }),
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              height: 30,
              width: MediaQuery.sizeOf(context).width,
              color: Color(0xFF212325),
              child: Text(
                " Living Essentails",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: AppData.LivingEssentials.map((image) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LivingEssentials()),
                            );
                          },
                          child: Container(
                            height: 180,
                            width: MediaQuery.sizeOf(context).width - 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LivingEssentials()),
                          );
                        },
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              height: 30,
              width: MediaQuery.sizeOf(context).width,
              color: Color(0xFF212325),
              child: Text(
                " Living Generals",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: AppData.LivingGenerals.map((image) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LivingGenerals()),
                            );
                          },
                          child: Container(
                            height: 180,
                            width: MediaQuery.sizeOf(context).width - 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LivingGenerals()),
                          );
                        },
                      )),
                ],
              ),
            ),
            Container(
              height: 30,
              width: MediaQuery.sizeOf(context).width,
              color: Color(0xFF212325),
              child: Text(
                " Cevices",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: AppData.Cevices.map((image) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Cervices()),
                            );
                          },
                          child: Container(
                            height: 180,
                            width: MediaQuery.sizeOf(context).width - 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cervices()),
                          );
                        },
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 1,
          ),
          FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.transparent,
              onPressed: () {
                setState(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VoncIoScreens()),
                    );
                  },
                );
              },
              child: Icon(
                Icons.messenger_rounded,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

enum VeiwType { grid, list }

class Living_Essentials_home extends StatefulWidget {
  const Living_Essentials_home({super.key});

  @override
  State<Living_Essentials_home> createState() => _Living_Essentials_homeState();
}

class _Living_Essentials_homeState extends State<Living_Essentials_home> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  List<Widget> _pages = [
    const Living_Essentials_home(),
    const Fruits(),
    const Vegetables(),
    const Cleaners(),
    const Sweets(),
    const Dairy(),
    const Bakery(),
    const Meat(),
  ];

  final List<Map<String, dynamic>> categories = [
    {'title': 'All', 'icon': Icons.all_inclusive},
    {'title': 'Fruits', 'icon': Icons.apple_rounded},
    {'title': 'Vegetables', 'icon': Icons.crop_landscape},
    {'title': 'Cleaners', 'icon': Icons.cleaning_services},
    {'title': 'Sweets', 'icon': Icons.cake},
    {'title': 'Dairy', 'icon': Icons.local_drink},
    {'title': 'Bakery', 'icon': Icons.bakery_dining},
    {'title': 'Meat', 'icon': Icons.restaurant},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 250,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipPath(
          clipper: AppBarCustomClipper(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade900,
                    Colors.green.shade900,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                ),
                image: DecorationImage(
                  image: AssetImage('assets/img/living_essentails/vonc_Le.png'),
                  fit: BoxFit.fill,
                )),
            // child: Container(
            //   margin: const EdgeInsets.only(bottom: 80),
            //   child: Image.asset(
            //     'assets/img/living_essentails/vonc_Le.png',
            //     fit: BoxFit.fill,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}

class AppBarCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 80);
    path.quadraticBezierTo(width / 2, height, width, height - 80);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Fruits extends StatelessWidget {
  const Fruits({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Vegetables extends StatelessWidget {
  const Vegetables({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Cleaners extends StatelessWidget {
  const Cleaners({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Sweets extends StatelessWidget {
  const Sweets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Dairy extends StatelessWidget {
  const Dairy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Meat extends StatelessWidget {
  const Meat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Bakery extends StatelessWidget {
  const Bakery({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
