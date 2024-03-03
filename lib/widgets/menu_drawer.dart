import 'package:delivery/screens/sign_in/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
  });
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SignInPage(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged Out Successfully!'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.grey,
          padding: EdgeInsets.all(15),
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.7,
                scale: 0.8,
                image: AssetImage("assets/images/drawer.jpg"),
              ),
            ),
            accountName: Text("Your Name"),
            accountEmail: Text("your@email.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  "assets/images/avatar.png"), // Add your image path here
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              // Navigate to the home page or perform the desired action
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("History"),
            onTap: () {
              // Navigate to the history page or perform the desired action
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add), // Icon for "Add User"
            title: Text("Add User"), // Text for "Add User"
            onTap: () {
              // Implement the "Add User" functionality
            },
          ),
          Divider(), // Add a divider between items
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              // Implement the logout functionality
              _signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
