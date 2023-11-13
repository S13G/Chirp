import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.only(top: 150, bottom: 180),
          child: Image.asset(
            'assets/images/logo.png',
            height: 259,
          ),
        ),
        FadeTransition(
          opacity: _opacityAnimation,
          child: const CircularProgressIndicator(
            backgroundColor: Color.fromRGBO(244, 123, 36, 0.5),
            valueColor:
                AlwaysStoppedAnimation<Color>(Color.fromRGBO(244, 123, 36, 1)),
          ),
        )
      ]),
    );
  }
}
