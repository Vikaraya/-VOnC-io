import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vonc_io/common_widget/data.dart';
import 'package:vonc_io/view/pages/Shopping_cart_page.dart';
import 'package:vonc_io/view/pages/bell.dart';
import 'package:vonc_io/view/pages/cervices.dart';
import 'package:vonc_io/view/pages/food_page.dart';
import 'package:vonc_io/view/pages/home_screen.dart';
import 'package:vonc_io/view/pages/living_generals.dart';
import 'package:vonc_io/view/pages/offers_page.dart';
import 'package:vonc_io/view/pages/payment_page.dart';
import 'package:vonc_io/view/pages/user_settings.dart';
import 'package:vonc_io/view/pages/vonc_io_screens.dart';
import 'package:vonc_io/view/pages/vonc_main_screen.dart';

class LivingEssentials extends StatefulWidget {
  const LivingEssentials({super.key});

  @override
  State<LivingEssentials> createState() => _LivingEssentialsState();
}

class _LivingEssentialsState extends State<LivingEssentials> {
  int _currentIndex = 0;
  Timer? _doubleTapTimer;
  final List<Widget> _screens = [
    const Living_Essentials_home(),
    const Living_Essentials_Favourite(),
    const PaymentPage(),
    const LivingEssentials_ShoppingCartPage(),
    const UserSettings(),
  ];

  late List<Widget> _navigationItem;

  @override
  void initState() {
    super.initState();
    _navigationItem = [
      GestureDetector(
        onDoubleTap: () {
          _navigateTOMainScreen();
        },
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      const Icon(Icons.favorite, color: Colors.white),
      const Icon(
        Icons.qr_code_scanner_rounded,
        color: Colors.white,
      ),
      const Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      const Icon(
        Icons.person,
        color: Colors.white,
      ),
    ];
  }

  void _navigateTOMainScreen() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => const VoncMainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff4cd21d), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              height: 30,
              width: 60,
              child: Image.asset(
                "assets/img/V_O_n_C_Logo crop-min.png",
                fit: BoxFit.cover,
              )),
          Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.542,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: TextFormField(
                  cursorHeight: 25,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    hintText: '',
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mic,
                          color: Colors.white,
                        )),
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 35),
                ),
              )),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Bell()),
              );
            },
            child: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Image.asset(
            "assets/icons/vonc wathsapp logo crop.png",
            height: 25,
            width: 25,
            fit: BoxFit.cover,
          ),
        ]),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: Colors.black,
          color: Color(0xff4cd21d),
          index: _currentIndex,
          onTap: (index) {
            _doubleTapTimer?.cancel();
            switch (index) {
              case 0:
                if (_currentIndex == 0) {
                  _doubleTapTimer =
                      Timer(const Duration(milliseconds: 300), () {
                    setState(() {
                      _navigateTOMainScreen();
                    });
                  });
                } else
                  setState(() {
                    _currentIndex = 0;
                  });
                break;
              case 1:
                setState(() {
                  _currentIndex = 1;
                });
                break;
              case 2:
                setState(() {
                  _currentIndex = 2;
                });
                break;
              case 3:
                setState(() {
                  _currentIndex = 3;
                });
                break;
              case 4:
                setState(() {
                  _currentIndex = 4;
                });
            }
          },
          items: _navigationItem),
      body: _screens[_currentIndex],
    );
  }
}

class Living_Essentials_Favourite extends StatefulWidget {
  const Living_Essentials_Favourite({super.key});

  @override
  State<Living_Essentials_Favourite> createState() =>
      _Living_Essentials_FavouriteState();
}

class _Living_Essentials_FavouriteState
    extends State<Living_Essentials_Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Living_Essentials_home extends StatefulWidget {
  const Living_Essentials_home({super.key});

  @override
  State<Living_Essentials_home> createState() => _Living_Essentials_homeState();
}

class _Living_Essentials_homeState extends State<Living_Essentials_home> {
  int _CrossAxisCount = 2;

  double _aspectRatio = 1.5;

  VeiwType _viewType = VeiwType.grid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: CarouselSlider(
                  items: List.generate(
                    AppData.LEBannerCategoriesStyleImages.length,
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
                            image: AssetImage(
                                AppData.LEBannerCategoriesStyleImages.map(
                                    (e) => e).toList()[index]),
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
              Row(
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
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              "assets/icons/cateogrie_icon-removebg-preview.png",
                              height: 40,
                              width: 40,
                            ),
                          )
                        : Icon(Icons.list, color: Colors.white, size: 40),
                  ),
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      _viewType == VeiwType.grid
                          ? Stack(
                              children: [
                                GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: _CrossAxisCount,
                                          childAspectRatio: _aspectRatio),
                                  itemCount:
                                      AppData.LECategoriesStyleImages.length,
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
                                                      return const HomeScreen();
                                                    case 1:
                                                      return const Living_Essentials_home();

                                                    case 2:
                                                      return const Living_Essentials_home();
                                                    case 3:
                                                      return const Living_Essentials_home();
                                                    case 4:
                                                      return const Living_Essentials_home();
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
                                                    0.138,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(AppData
                                                            .LECategoriesStyleImages[
                                                        index]),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                    width: 3,
                                                    color: AppData
                                                        .LEborderColors[index],
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
                                              AppData.LECategoriesText[index],
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
                                //   Align(
                                //     alignment: Alignment.center,
                                //     child: InkWell(
                                //       onTap: () {
                                //         Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   const VoncIoScreens()),
                                //         );
                                //       },
                                //       child: Image.asset(
                                //         "assets/icons/vonc_io_main-removebg-preview.png", // Replace with your image asset
                                //         width: 120,
                                //         height: 120,
                                //       ),
                                //     ),
                                //   ),
                              ],
                            )
                          : Stack(
                              children: [
                                ListView.builder(
                                  itemCount:
                                      AppData.LECategoriesStyleImages.length,
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
                                                              .LECategoriesStyleImages[
                                                          index]),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          child: Container(
                                            color: Colors.transparent,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            child: Center(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  AppData
                                                      .LECategoriesText[index],
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
                                //   Align(
                                //     alignment: Alignment.topRight,
                                //     child: InkWell(
                                //       onTap: () {
                                //         Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   const VoncIoScreens()),
                                //         );
                                //       },
                                //       child: Image.asset(
                                //         "assets/icons/vonc_io_main-removebg-preview.png", // Replace with your image asset
                                //         width: 100,
                                //         height: 100,
                                //       ),
                                //     ),
                                //   ),
                              ],
                            ),
                    ],
                  )),
              SizedBox(
                height: 1,
              ),
              Container(
                height: 20,
                width: MediaQuery.sizeOf(context).width,
                child: Text(
                  " Recentely Viewed",
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
                        children: [
                          Container(
                            height: 200,
                            child: Center(
                              child: Text(
                                "No Items found",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                        // children: AppData.LivingEssentials.map((image) {
                        //   return Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: InkWell(
                        //       onTap: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(builder: (context) {
                        //             return const FoodPage();
                        //           }),
                        //         );
                        //       },
                        //       child: Container(
                        //         height: 200,
                        //         width: MediaQuery.sizeOf(context).width - 50,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(30),
                        //           image: DecorationImage(
                        //             image: AssetImage(image),
                        //             fit: BoxFit.fill,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   );
                        // }).toList(),
                      ),
                      // Align(
                      //     alignment: Alignment.centerRight,
                      //     child: IconButton(
                      //       icon: Icon(
                      //         Icons.arrow_forward_ios,
                      //         color: Colors.white,
                      //       ),
                      //       onPressed: () {
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(builder: (context) {
                      //             return const FoodPage();
                      //           }),
                      //         );
                      //       },
                      //     )),
                    ],
                  ),
                ),
              ),
              Container(
                height: 20,
                width: MediaQuery.sizeOf(context).width,
                child: Text(
                  " Trending Offers",
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
                        children: AppData.LivingEssentials.map((image) {
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
                                height: 200,
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
              Container(
                height: 20,
                width: MediaQuery.sizeOf(context).width,
                child: Text(
                  " Best Sellers",
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
                        children: AppData.LivingEssentials.map((image) {
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
                                height: 200,
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
            ],
          )),
    );
  }
}

enum VeiwType { grid, list }

