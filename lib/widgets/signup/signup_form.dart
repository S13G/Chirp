import 'package:cherry_toast/cherry_toast.dart';
import 'package:chirp/screens/core/signin.dart';
import 'package:chirp/widgets/signup/signup_buttons.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _isSending = false;
  bool _obscureText = true;
  String? _emailError;
  String? _passwordError;
  bool _isChecked = false;

  void _validateFields() {
    setState(() {
      _emailError = _validateEmail(_enteredEmail);
      _passwordError = _validatePassword(_enteredPassword);
      print(_emailError);
      print(_passwordError);
    });
  }

  String? _validateEmail(String value) {
    if (value.trim().isEmpty || value.trim().length <= 1) {
      print(value);
      return 'Invalid email';
    }
    return null;
  }

  String? _validatePassword(String value) {
    if (value.trim().isEmpty || value.trim().length < 6) {
      print(value);
      return 'Password must not be less than 6 characters';
    }
    return null;
  }

  Future<void> _acceptDetails() async {
    _validateFields();
    if (_emailError == null && _passwordError == null) {
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

      // Simulate a delay for the signup process
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SignInScreen()));

        CherryToast.success(
          title: Text(
            'Signed up successfully',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.green),
          ),
          animationDuration: const Duration(milliseconds: 1200),
          toastDuration: const Duration(milliseconds: 1700),
        ).show(context);
      });
    } else {
      CherryToast.error(
        title: Text(
          'Invalid credentials',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.red),
        ),
        animationDuration: const Duration(milliseconds: 1200),
        toastDuration: const Duration(milliseconds: 1700),
      ).show(context);
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
                    return _validateEmail(value!);
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
                    return _validatePassword(value!);
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
                    'Sign up',
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
        const SignUpButtons(),
      ],
    );
  }
}
