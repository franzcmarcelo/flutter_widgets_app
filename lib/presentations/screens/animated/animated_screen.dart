import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  bool runAnimation = false;

  double width = 100;
  double height = 100;
  Color color = Colors.indigo;
  double borderRadius = 20;

  void _animate() {
    final random = Random();

    setState(() {
      width = random.nextInt(300) + 70;
      height = random.nextInt(300) + 70;
      color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );
      borderRadius = (random.nextInt(100) + 20).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated'),
      ),
      body: _AnimatedView(
        width: width,
        height: height,
        color: color,
        borderRadius: borderRadius,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(runAnimation ? 'Stop' : 'Animate'),
        icon: Icon(runAnimation ? Icons.stop : Icons.play_arrow),
        onPressed: () => {
          if (runAnimation) {
            setState(() {
              runAnimation = false;
            })
          } else {
            setState(() {
              runAnimation = true;
            }),
            Future.doWhile(() async {
              await Future.delayed(const Duration(milliseconds: 400));
              if (runAnimation) {
                _animate();
                return true;
              } else {
                return false;
              }
            })
          }

        },
      ),
    );
  }
}

class _AnimatedView extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final double borderRadius;

  const _AnimatedView({
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      )
    );
  }
}