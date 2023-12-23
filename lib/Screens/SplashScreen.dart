import 'package:flutter/material.dart';
import 'package:money_manager_v2/Screens/HomeScreen.dart';
import 'package:money_manager_v2/Screens/LoginScreen.dart';
import 'package:money_manager_v2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    CheckLogin(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Center(
        child: Text("Money Manager"),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> GotoLogin(context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }

  Future<void> CheckLogin(context) async {
    final _sharedpref = await SharedPreferences.getInstance();
    final _userloggedin = _sharedpref.getBool(SAVE_KEY_NAME);
    if (_userloggedin == false || _userloggedin == null) {
      GotoLogin(context);
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => HomeScreen()));
    }
  }
}
