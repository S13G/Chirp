import 'package:chirp/screens/authentication/signup.dart';
import 'package:flutter/material.dart';

import 'package:chirp/screens/authentication/signin.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Forgot the password?',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'or continue with',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignInScreen()));
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(158, 47),
                ),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.045))),
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.onTertiary,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              icon: Image.asset('assets/images/fb.png', height: 25),
              label: Text(
                'Facebook',
                style:
                    Theme.of(context).textTheme.copyWith().bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
              ),
            ),
            const SizedBox(width: 20),
            // Add a 24px gap between the buttons.
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignInScreen()));
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(158, 47),
                ),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.045))),
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.onTertiary,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              icon: Image.asset('assets/images/gog.png', height: 30),
              label: Text(
                'Google',
                style:
                    Theme.of(context).textTheme.copyWith().bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color.fromRGBO(133, 140, 148, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignUpScreen()));
              },
              child: Text(
                'Sign up',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
