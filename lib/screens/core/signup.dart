import 'package:chirp/widgets/signup/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 44),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 139,
                ),
                const SizedBox(height: 32,),
                Text(
                  'Sign up for free',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 23),
                ),
                const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
