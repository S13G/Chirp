import 'package:chirp/widgets/misc/continue_page.dart';
import 'package:chirp/widgets/misc/loader.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  bool _delayed = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _delayed = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        body: _delayed ? const Loader() : const ContinuePage());
  }
}
