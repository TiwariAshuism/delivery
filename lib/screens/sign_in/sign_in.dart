import 'package:delivery/screens/boarding/title_page/titlepage.dart';
import 'package:delivery/screens/sign_in/sign_up.dart';
import 'package:delivery/widgets/coloredButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
// Replace with the import for your title page widget

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _submitForm() async {
    setState(() {
      _isLoading = true; // Show the circular progress indicator
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text,
        password: _passwordController.text,
      );

      User? user = userCredential.user;
      if (user != null) {
        // User is signed in
        print('User signed in: ${user.uid}');
        // Navigate to the home page or any other page you want to go to on success
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TitlePage(), // Replace with your home page widget
            ),
            (setting) => false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Sign-in SuccessFull:'), // Display the success message
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            padding: EdgeInsets.all(15),
          ),
        );
      }
    } catch (e) {
      // Handle sign-in errors here (e.g., invalid credentials)
      print('Error signing in: $e');
      String errorMessage = e.toString();
      String cleanedErrorMessage = errorMessage.split('] ')[1];
      String formattedErrorMessage = ' $cleanedErrorMessage';
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
    } finally {
      setState(() {
        _isLoading = false; // Hide the circular progress indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;

    final TextStyle welcomeTextStyle = TextStyle(
      fontSize: isWideScreen ? 24.0 : 16.0,
      fontWeight: FontWeight.bold,
    );

    final TextStyle createAccountTextStyle = TextStyle(
      fontSize: isWideScreen ? 24.0 : 18.0,
      fontWeight: FontWeight.bold,
    );

    final TextStyle labelTextStyle = TextStyle(
      fontSize: isWideScreen ? 18.0 : 16.0,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(isWideScreen ? 30.0 : 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome!',
                      style: welcomeTextStyle,
                    ),
                    Text(
                      'Create an Account!',
                      style: createAccountTextStyle,
                    ),
                    Lottie.asset(
                      'assets/images/signin.json',
                      width: isWideScreen
                          ? MediaQuery.of(context).size.width * 2
                          : MediaQuery.of(context).size.width * 2,
                      height: isWideScreen
                          ? MediaQuery.of(context).size.height / 2
                          : MediaQuery.of(context).size.height / 2,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: isWideScreen
                            ? MediaQuery.of(context).size.width / 3
                            : MediaQuery.of(context).size.width / 16,
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Email address',
                              labelStyle: labelTextStyle,
                            ),
                          ),
                          SizedBox(height: isWideScreen ? 20.0 : 10.0),
                          TextField(
                            onTapOutside: (event) {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus &&
                                  currentFocus.focusedChild != null) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            },
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: labelTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: isWideScreen ? 20.0 : 10.0),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: isWideScreen
                            ? MediaQuery.of(context).size.width / 3
                            : 0,
                      ),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (!_isLoading) {
                                _submitForm();
                              }
                            },
                            child: ColoredButton(text: "Sign In"),
                          ),
                          if (_isLoading)
                            Center(
                              child:
                                  CircularProgressIndicator(), // Display the circular progress indicator
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: isWideScreen ? 20.0 : 10.0),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(isWideScreen ? 20.0 : 10.0),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Don’t have an account yet?",
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: isWideScreen ? 16.0 : 12.0),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: isWideScreen ? 16.0 : 12.0),
                        children: <InlineSpan>[
                          TextSpan(
                              text: " Sign Up",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: isWideScreen ? 16.0 : 12.0,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpPage(),
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
    );
  }
}
