import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController passRepController = TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  bool changeButton = false;
  bool iAccept = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                        controller: nameController,
                        onChanged: (val) {
                          setState(() {
                            nameController.text = val;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }

                          return null;
                        },
                      ),
                      prefix: Text('Name'),
                    ),
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        keyboardType: TextInputType.number,
                        placeholder: 'Enter phone',
                        controller: phoneController,
                        onChanged: (val) {
                          phoneController.text = val;
                        },
                      ),
                      prefix: Text('Phone'),
                    ),
                  ],
                ),
                CupertinoFormSection(
                  header: Text('User detail'),
                  children: [
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        onFieldSubmitted: (val) {
                          if (val == '') return;
                        },
                        keyboardType: TextInputType.emailAddress,
                        placeholder: 'Enter email',
                      ),
                      prefix: Text('Email'),
                    ),
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        obscureText: true,
                        controller: passController,
                        onChanged: (val) {
                          passController.text = val;
                        },
                      ),
                      prefix: Text('Password'),
                    ),
                    CupertinoFormRow(
                      child: CupertinoTextFormFieldRow(
                        obscureText: true,
                        controller: passRepController,
                        onChanged: (val) {
                          passRepController.text = val;
                        },
                      ),
                      prefix: Text('Confirm Password'),
                    )
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
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          changeButton = true;
                        });
                      },
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
    );
  }

  bool checkvalid() {
    bool isValid = true;
    if (phoneController.text == '') {
      isValid = false;
    } else if (nameController.text == '') {
      isValid = false;
    } else if (passController.text == '') {
      isValid = false;
    } else if (passRepController.text == '' ||
        passRepController.text != passController.text) {
      isValid = false;
    } else if (iAccept == false) {
      isValid = false;
    }

    return isValid;
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(child: Text('Hie')),
    );
  }
}
