import 'package:animate_do/animate_do.dart';
import 'package:delivery/screens/boarding/title_page/titlepage.dart';
import 'package:delivery/screens/sign_in/sign_in.dart';
import 'package:delivery/widgets/coloredButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpPage();
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypePasswordController = TextEditingController();

  Future<void> _submitForm() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      User? user = userCredential.user;
      if (user != null) {
        // User is signed up successfully
        print('User signed up: ${user.uid}');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TitlePage(),
            ));
        // You can navigate to a new screen or perform other actions here.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Sign-up SuccessFull:'), // Display the success message
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            padding: EdgeInsets.all(15),
          ),
        );
      }
    } catch (e) {
      // Handle sign-up errors here (e.g., email already in use)
      String errorMessage = e.toString();
      String cleanedErrorMessage = errorMessage.split('] ')[1];
      String formattedErrorMessage = ' $cleanedErrorMessage';
      print('Error signing up: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Sign-in failed: ${formattedErrorMessage}'), // Display the error message
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
          padding: EdgeInsets.all(15),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ZoomIn(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Create an Account!',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Lottie.asset(
                          'assets/images/signup.json',
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        onTapOutside: (event) {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus &&
                              currentFocus.focusedChild != null) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: _retypePasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Retype Password',
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _submitForm();
                  },
                  child: ColoredButton(
                    text: "Sign Up",
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(color: Colors.grey.shade400),
                          children: <InlineSpan>[
                            TextSpan(
                                text: " Sign in to your account",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignInPage(),
                                      ),
                                    );
                                  })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
