import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Shopping Cart'),
      ),
    );
  }
}

class LivingEssentials_ShoppingCartPage extends StatefulWidget {
  const LivingEssentials_ShoppingCartPage({super.key});

  @override
  State<LivingEssentials_ShoppingCartPage> createState() => _LivingEssentials_ShoppingCartPageState();
}

class _LivingEssentials_ShoppingCartPageState extends State<LivingEssentials_ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
