import 'package:RoadBuddy/main.dart';
import 'package:RoadBuddy/userhomenew.dart';
import 'package:flutter/material.dart';
import 'package:RoadBuddy/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    gotoLogin();
    // TODO: implement initState
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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/back2.jpg'), // Replace with your image path
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Road Buddy',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              // Use SvgPicture.asset() to load and display your GIF
              Image.asset('assets/service.gif', width: 200.0, height: 200.0),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => Loginscreen()));
  }
  /* Future<void>checkuserLoggedin()async{
    final _sharedpref=await SharedPreferences.getInstance();
   final _userLoggedin= _sharedpref.getBool(SAVE_KEY_NAME);
   if(_userLoggedin==null||_userLoggedin==false){
    gotoLogin();
   }
   else{
   // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1)=>Homescreennew(userId: userId, name: name)));
   }
  }*/
}
