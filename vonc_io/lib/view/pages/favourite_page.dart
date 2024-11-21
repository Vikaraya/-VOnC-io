import 'package:flutter/material.dart';
import 'package:vonc_io/view/pages/cervices.dart';
import 'package:vonc_io/view/pages/food_page.dart';
import 'package:vonc_io/view/pages/living_Essentials.dart';
import 'package:vonc_io/view/pages/living_generals.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: TabBar(
          indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              color: Colors.white),
          labelColor: Colors.indigoAccent,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: const Icon(Icons.fastfood),
              child: Text("Food", style: TextStyle(fontSize: 12)),
            ),
            Tab(
                icon: Icon(Icons.local_grocery_store_outlined),
                child: Text(
                  "Living Essentials",
                  style: TextStyle(fontSize: 12),
                )),
            Tab(
              icon: Icon(Icons.watch),
              child: const Text(
                "Living Generals",
                style: TextStyle(fontSize: 12),
              ),
            ),
             Tab(
              icon: Icon(Icons.work),
              child: Text(
                "cevices",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: TabBarView(
          children: [
            const FoodpageFavourite(),
            const Living_Essentials_Favourite(),
            const LivingGenerals_Favourite(),
            const Cervices_Favourite(),
          ],
        ),
      ),
    );
  }
}
