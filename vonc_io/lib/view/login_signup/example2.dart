import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  final GlobalKey<FabCircularMenuPlusState> _fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent.shade200,
      body: Center(
        child: Text('Example 2'),
      ),

      floatingActionButton: Builder(builder: (context) {
        return FabCircularMenuPlus(
          alignment: Alignment.centerRight,
          key: _fabKey,
          fabColor: Colors.indigoAccent.shade200,
          ringColor: Colors.transparent,
          ringDiameter: 400.0,
          ringWidth: 50.0,
          animationCurve: Curves.bounceInOut,
          animationDuration: const Duration(milliseconds: 800),
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/technical-support.png",
                  height: 50,
                  width: 50,
                ),
                iconSize: 20.0,
                onPressed: () {},
              ),
            ),
            Spacer(flex: 1),
            Container(
              decoration: BoxDecoration(
                  color: Colors.yellowAccent, shape: BoxShape.circle),
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/woman (1).png",
                  height: 50,
                  width: 50,
                ),
                iconSize: 20.0,
                onPressed: () {},
              ),
            ),
            Spacer(flex: 1),
            Container(
              decoration: BoxDecoration(
                  color: Colors.indigoAccent, shape: BoxShape.circle),
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/vonc_io_main-removebg-preview.png",
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
                iconSize: 20.0,
                onPressed: () {},
              ),
            ),
            Spacer(flex: 1),
            Container(
              decoration: BoxDecoration(
                  color: Colors.greenAccent, shape: BoxShape.circle),
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/groceries.png",
                  height: 50,
                  width: 50,
                ),
                iconSize: 20.0,
                onPressed: () {},
              ),
            ),
            Spacer(flex: 1),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle), //CircleBorder(),
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/food1.png",
                  height: 50,
                  width: 50,
                ),
                iconSize: 20.0,
                onPressed: () {},
              ),
            ),
          ],
        );
      }),
      
    );
  }
}
