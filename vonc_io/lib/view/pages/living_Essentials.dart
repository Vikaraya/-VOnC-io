import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vonc_io/view/pages/Shopping_cart_page.dart';
import 'package:vonc_io/view/pages/bell.dart';
import 'package:vonc_io/view/pages/home_screen.dart';
import 'package:vonc_io/view/pages/payment_page.dart';
import 'package:vonc_io/view/pages/user_settings.dart';

class LivingEssentials extends StatefulWidget {
  const LivingEssentials({super.key});

  @override
  State<LivingEssentials> createState() => _LivingEssentialsState();
}

class _LivingEssentialsState extends State<LivingEssentials> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const Living_Essentials_home(),
    const Living_Essentials_Favourite(),
    const PaymentPage(),
    const LivingEssentials_ShoppingCartPage(),
    const UserSettings(),
  ];

  final List<Widget> _navigationItem = [
    const Icon(
      Icons.home,
      color: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green.shade900,
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
          backgroundColor: Colors.lightGreen.shade800,
          color: Colors.green.shade900,
          index: _currentIndex,
          onTap: (index) {
            switch (index) {
              case 0:
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
