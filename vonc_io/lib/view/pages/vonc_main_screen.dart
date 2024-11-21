import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vonc_io/view/pages/Shopping_cart_page.dart';
import 'package:vonc_io/view/pages/bell.dart';
import 'package:vonc_io/view/pages/favourite_page.dart';
import 'package:vonc_io/view/pages/home_screen.dart';
import 'package:vonc_io/view/pages/payment_page.dart';
import 'package:vonc_io/view/pages/user_settings.dart';

//import 'package:vonc/view/pages/vonc_io.dart';

class VoncMainScreen extends StatefulWidget {
  const VoncMainScreen({super.key, user});

  @override
  State<VoncMainScreen> createState() => _VoncMainScreenState();
}

class _VoncMainScreenState extends State<VoncMainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const FavouritePage(),
    const PaymentPage(),
    const ShoppingCartPage(),
    const UserSettings(),
  ];

  final List<Widget> _navigationItem = [
    const Icon(
      Icons.home_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.favorite_border_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.qr_code_scanner_rounded,
      color: Colors.white,
    ),
    const Icon(
      Icons.shopping_cart_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.person_outline_rounded,
      color: Colors.white,
    ),
  ];

  //late final GoogleSignInAccount user;

  //final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          flexibleSpace: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                colors: [
                  Color(0xff000000),
                  Color(0xff3533cd),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/img/V_O_n_C_Logo crop-min.png",
                height: 30,
                width: 50,
              ),
              const SizedBox(
                width: 2,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.542,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                    cursorHeight: 25,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      hintText: '',
                      hintStyle: const TextStyle(color: Colors.white),
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
                    style: const TextStyle(color: Colors.white, fontSize: 30)),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bell()),
                  );
                },
                child: Icon(Icons.notifications_outlined,
                    color: Colors.white, size: 30),
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
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            backgroundColor: Colors.transparent,
            color: Colors.indigoAccent,
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
      ),
    );
  }
}
