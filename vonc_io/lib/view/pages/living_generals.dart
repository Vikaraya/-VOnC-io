import 'package:flutter/material.dart';

class LivingGenerals extends StatefulWidget {
  const LivingGenerals({super.key});

  @override
  State<LivingGenerals> createState() => _LivingGeneralsState();
}

class _LivingGeneralsState extends State<LivingGenerals> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Opp`s we are coming soon')),
    );
  }
}

class LivingGenerals_Favourite extends StatefulWidget {
  const LivingGenerals_Favourite({super.key});

  @override
  State<LivingGenerals_Favourite> createState() => _LivingGenerals_FavouriteState();
}

class _LivingGenerals_FavouriteState extends State<LivingGenerals_Favourite> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}