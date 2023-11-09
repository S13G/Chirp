import 'dart:ui';

import 'package:chirp/screens/authentication/signup.dart';
import 'package:flutter/material.dart';

class ContinuePage extends StatelessWidget {
  const ContinuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 259,
            ),
            Text(
              'The best portal job of this country',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignupScreen()));
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(280, 47),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(90, 108, 234, 0.9),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              child: Text(
                'Continue',
                style: Theme.of(context)
                    .textTheme
                    .copyWith()
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
