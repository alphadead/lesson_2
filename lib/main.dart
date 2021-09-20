import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_2/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

// TextEditingController nameController = TextEditingController();
// TextEditingController phoneController = TextEditingController();
// TextEditingController passController = TextEditingController();
// TextEditingController passRepController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  bool changeButton = false;
  bool iAccept = false;
  String pass = '';
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String number = '';
  String email = '';

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            name: name,
            number: number,
            email: email,
          ),
        ),
      );

      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SignUp',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.indigo[800],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Create your account',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.indigo[800],
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoFormSection(
                    header: Text('Personal details'),
                    children: [
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                            placeholder: 'Enter name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Name cannot be empty";
                              }

                              return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                name = val;
                              });
                              print(name);
                            }),
                        prefix: Text('Name'),
                      ),
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                            keyboardType: TextInputType.number,
                            placeholder: 'Enter phone',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Phone cannot be empty";
                              }

                              return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                number = val;
                              });
                            }),
                        prefix: Text('Phone'),
                      ),
                    ],
                  ),
                  CupertinoFormSection(
                    header: Text('User detail'),
                    children: [
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                            placeholder: 'Enter email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email cannot be empty";
                              }

                              return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            }),
                        prefix: Text('Email'),
                      ),
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password length should be more than 6";
                            }

                            return null;
                          },
                        ),
                        prefix: Text('Password'),
                      ),
                      CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password length should be more than 6";
                            }

                            return null;
                          },
                        ),
                        prefix: Text('Confirm Password'),
                      ),
                    ],
                  ),
                  CupertinoFormSection(
                    header: Text('Term & Conditions'),
                    children: [
                      CupertinoFormRow(
                        child: CupertinoSwitch(
                          value: iAccept,
                          onChanged: (bool val) {
                            setState(() {
                              iAccept = !iAccept;
                            });
                          },
                        ),
                        prefix: Text("I accept"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Center(
                  //   child: ElevatedButton(
                  //     style:
                  //         ElevatedButton.styleFrom(primary: Colors.indigo[900]),
                  //     // ButtonStyle(
                  //     //   backgroundColor:
                  //     //       MaterialStateProperty.all(Colors.indigo[800]),
                  //     // ),
                  //     onPressed: () {
                  //       bool isTrue = checkvalid();
                  //       isTrue
                  //           ? Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => ProfileView(),
                  //               ),
                  //             )
                  //           : '';
                  //     },
                  //     child: Text('SignUp'),
                  //   ),
                  // ),

                  Center(
                    child: Material(
                      color: changeButton ? Colors.green : Colors.indigo[800],
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
