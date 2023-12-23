import 'package:flutter/material.dart';
import 'package:money_manager_v2/Screens/HomeScreen.dart';
import 'package:money_manager_v2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  // final _currentstate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "LOGIN",
                  textScaler: TextScaler.linear(3),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _usernamecontroller,
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Username";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Password";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      if (_formkey.currentState!.validate() == true)
                        CheckLogin(context);
                    },
                    icon: Icon(Icons.check),
                    label: Text("Login")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void CheckLogin(BuildContext ctx) async {
    final _username = _usernamecontroller.text;
    final _password = _passwordcontroller.text;

    if (_username == _password) {
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return HomeScreen();
      }));
    } else {
      final _errormessage = "Username and Password doesn't match";

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(_errormessage),
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red[700],
        ),
      );
    }
  }
}
