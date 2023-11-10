import 'package:cherry_toast/cherry_toast.dart';
import 'package:chirp/screens/main/dashboard.dart';
import 'package:chirp/widgets/signin/signin_buttons.dart';
import 'package:chirp/widgets/signup/signup_buttons.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _isSending = false;
  bool _obscureText = true;
  String? _emailError;
  String? _passwordError;
  bool _isChecked = false;

  Future<void> _acceptDetails() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // loading circle
      showDialog(
          barrierDismissible: false, // disable dismissing by tapping outside
          barrierColor: Colors.black.withOpacity(0.7),
          context: context,
          builder: (context) {
            return Center(
                child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const CircularProgressIndicator(
                backgroundColor: Color.fromRGBO(42, 113, 176, 0.3),
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(42, 113, 176, 1)),
              ),
            ));
          });

      // Simulate a delay for the sign-in process
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DashboardScreen()));

        // After the sign-in process, set loading state to false

        CherryToast.success(
          title: Text(
            'Sign in successful',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.green),
          ),
          animationDuration: const Duration(milliseconds: 1200),
          toastDuration: const Duration(milliseconds: 1700),
        ).show(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320,
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Email TextFormField
                TextFormField(
                  maxLength: 100,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                    counterText: '',
                    // remove text counts
                    // placeholders
                    hintText: 'Email',
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color.fromRGBO(218, 222, 227, 1),
                        ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0.5)),
                    ),
                    errorText: _emailError,
                    errorStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.error,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      setState(() {
                        _emailError = 'Invalid email';
                      });

                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          _emailError = null;
                        });
                      });

                      return null;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredEmail = value!;
                  },
                ),
                const SizedBox(height: 24),

                // Password TextFormField
                TextFormField(
                  maxLength: 100,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                    hintText: 'Password',
                    counterText: '',
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                      borderSide:
                          BorderSide(color: Colors.white.withOpacity(0.5)),
                    ),
                    errorText: _passwordError,
                    errorStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.error,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                  ),
                  obscureText: _obscureText,
                  autocorrect: false,
                  enableSuggestions: false,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length < 6) {
                      setState(() {
                        _passwordError =
                            'Password must not be less than 6 characters';
                      });
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          _passwordError = null;
                        });
                      });
                      return null;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredPassword = value!;
                  },
                ),
                const SizedBox(height: 16),

                // Remember me checkbox
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      activeColor: const Color.fromRGBO(42, 113, 176, 1),
                      side: const BorderSide(
                          color: Color.fromRGBO(42, 113, 176, 1)),
                    ),
                    Text(
                      'Remember me',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: _acceptDetails,
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
                // Sign-in Button
              ],
            ),
          ),
        ),
        const SignInButtons(),
      ],
    );
  }
}
