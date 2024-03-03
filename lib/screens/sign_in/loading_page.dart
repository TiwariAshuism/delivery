import 'package:delivery/screens/sign_in/sign_in.dart';
import 'package:delivery/screens/sign_in/sign_up.dart';
import 'package:delivery/widgets/coloredButton.dart';
import 'package:delivery/widgets/lightbutton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddLoadingPage extends StatelessWidget {
  const AddLoadingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;

    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 20),
            Lottie.asset(
              'assets/images/LoadingPageanimation.json',
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
                horizontal:
                    isWideScreen ? MediaQuery.of(context).size.width / 3 : 0,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: ColoredButton(
                      text: "Sign Up",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    },
                    child: LightButton(text: "Sign In"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
