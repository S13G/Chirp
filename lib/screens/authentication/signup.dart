import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _isSending = false;
  bool _obscureText = true;

  void _acceptDetails() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _isSending = true;
    }
  }

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
                Text(
                  'Sign in to your account',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 23),
                ),
                Container(
                  width: 320, // width of the form
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          maxLength: 100,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                            // placeholders
                            hintText: 'Email',
                            counterText: '',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color.fromRGBO(218, 222, 227, 1),
                                ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.red,
                                ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length <= 1) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          maxLength: 100,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                            hintText: 'Password',
                            counterText: '',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color.fromRGBO(218, 222, 227, 1),
                                ),
                            suffixIcon: IconButton(
                              // adding the eye icon in the password box
                              icon: Icon(_obscureText
                                  ? Icons.remove_red_eye_rounded
                                  : Icons.remove_red_eye_outlined),
                              onPressed: () {
                                setState(() {
                                  _obscureText =
                                      !_obscureText; // state changes upon eye pressed
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.red,
                                ),
                          ),
                          obscureText: _obscureText,
                          autocorrect: false,
                          enableSuggestions: false,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length < 6) {
                              return 'Password must not be less than 6 characters';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              value: false,
                              onChanged: (value) {
                                setState(() {
                                  value = true;
                                });
                              },
                              activeColor:
                                  const Color.fromRGBO(42, 113, 176, 1),
                              side: const BorderSide(
                                  color: Color.fromRGBO(42, 113, 176, 1)),
                            ),
                            Text(
                              'Remember me',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            _acceptDetails();
                          },
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(320, 55),
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
                            'Sign in',
                            style: Theme.of(context)
                                .textTheme
                                .copyWith()
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                            builder: (context) => const SignupScreen()));
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(158, 47),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.onTertiary,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      icon: Image.asset(
                        'assets/images/fb.png',
                        height: 25,
                      ),
                      label: Text(
                        'Facebook',
                        style: Theme.of(context)
                            .textTheme
                            .copyWith()
                            .bodyMedium!
                            .copyWith(
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
                            builder: (context) => const SignupScreen()));
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(158, 47),
                        ),
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
                        style: Theme.of(context)
                            .textTheme
                            .copyWith()
                            .bodyMedium!
                            .copyWith(
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
                    Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
