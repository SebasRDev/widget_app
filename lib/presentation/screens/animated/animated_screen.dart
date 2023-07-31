import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {

  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.play_arrow_rounded),),
    );
  }
}