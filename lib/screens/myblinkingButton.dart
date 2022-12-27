import 'package:chit_game_android/screens/scratchcard.dart';
import 'package:flutter/material.dart';

class MyBlinkingButton extends StatefulWidget {
  @override
  _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
}

class _MyBlinkingButtonState extends State<MyBlinkingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animationController,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ScratchPage()));
          },
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(), backgroundColor: Colors.green),
          child: const Text(
            'Play Now',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
        // child: MaterialButton(
        //   onPressed: () => null,
        //   color: Colors.green,
        //   child: const Text("Play Now"),
        // ),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
