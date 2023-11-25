import 'package:flutter/material.dart';
import 'package:RoadBuddy/db/data_model.dart';
import 'package:RoadBuddy/db/dbfunction.dart';
import 'package:RoadBuddy/login.dart';

class Createscreen extends StatefulWidget {
  const Createscreen({super.key});

  @override
  State<Createscreen> createState() => _CreatescreenState();
}

class _CreatescreenState extends State<Createscreen> {
  final namecontroller = TextEditingController();

  final usernamecontroller = TextEditingController();

  final phonecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

//bool _isdata =true;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add details')),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/back2.jpg'), // Replace with your image path
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      
                      ),
                      child: TextFormField(
                        controller: namecontroller,
                        decoration: const InputDecoration(
                           filled: true,
        fillColor: Colors.white,
                          //  fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'value empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                     
                    ),
                    child: TextFormField(
                      controller: usernamecontroller,
                      decoration: const InputDecoration(
                         filled: true,
        fillColor: Colors.white,
                        //  fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'value empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                     
                    ),
                    child: TextFormField(
                      controller: phonecontroller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                         filled: true,
        fillColor: Colors.white,
                        // fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Phone Number',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'value empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                     
                    ),
                    child: TextFormField(
                      controller: passwordcontroller,
                      decoration: const InputDecoration(
                         filled: true,
        fillColor: Colors.white,
                        //  fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'value empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            onAddbutton();
                            showDialog(
                                context: context,
                                builder: (ctx1) {
                                  return AlertDialog(
                                    title: const Text('Data saved'),
                                    content:
                                        const Text('Data saved successfully'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          Loginscreen()),
                                                  (route) => false);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            print('Data empty');
                          }
                        },
                        child: const Text('Save')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddbutton() async {
    final _name = namecontroller.text.trim();
    final _username = usernamecontroller.text.trim();
    final _phone = phonecontroller.text.trim();
    final _password = passwordcontroller.text.trim();
    if (_name.isEmpty ||
        _username.isEmpty ||
        _phone.isEmpty ||
        _password.isEmpty) {
      return;
    }
    final _user = UserModel(
        name: _name, username: _username, phone: _phone, password: _password);
//final student=StudentModel(name: _name,age: _age,div: _div,rollno: _rollno, imagepath: _selectedImagePath);
    addUser(_user);
  }
}
