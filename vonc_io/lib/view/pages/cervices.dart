import 'package:flutter/material.dart';

class Cervices extends StatefulWidget {
  const Cervices({super.key});

  @override
  State<Cervices> createState() => _CervicesState();
}

class _CervicesState extends State<Cervices> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Opp`s we are coming soon')),
    );
  }
}

class Cervices_Favourite extends StatefulWidget {
  const Cervices_Favourite({super.key});

  @override
  State<Cervices_Favourite> createState() => _Cervices_FavouriteState();
}

class _Cervices_FavouriteState extends State<Cervices_Favourite> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
