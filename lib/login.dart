import 'package:flutter/material.dart';
import 'package:RoadBuddy/adminhome.dart';
import 'package:RoadBuddy/createuser.dart';
import 'package:RoadBuddy/db/data_model.dart';

import 'package:hive/hive.dart';
import 'package:RoadBuddy/userhome.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/back2.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      checkLogin(context);
                    },
                    child: const Text('LOGIN'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the registration screen
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (ctx1) => const Createscreen()),
                      );
                    },
                    child: const Text('Create Account'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = usernameController.text;
    final _password = passwordController.text;
    final usersBox = await Hive.openBox<UserModel>('user_db');

    // Check if the username and password are 'admin'
    if (_username == 'admin' && _password == 'admin') {
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => Adminscreen()));
    } else {
      try {
        final user = usersBox.values.firstWhere(
          (user) => user.username == _username && user.password == _password,
        );
        if (user != null) {
          Navigator.of(ctx).pushReplacement(MaterialPageRoute(
            builder: (ctx1) =>
                Homescreen1(userId: user.id.toString(), name: user.name),
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(10),
            content: const Text('Username or password is incorrect.'),
          ),
        );
      }
    }
  }
}
