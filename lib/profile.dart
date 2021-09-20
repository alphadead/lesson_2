import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
      {Key? key, required this.name, required this.number, required this.email})
      : super(key: key);
  final String name;
  final String number;
  final String email;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

int c = 0;

class _ProfilePageState extends State<ProfilePage> {
  Color col = Colors.black;
  Color colbut = Colors.orange;
  Color colfav = Colors.black;
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Portfolio App',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              toast();
            },
            icon: Icon(Icons.chevron_left_rounded),
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  tapped = !tapped;
                  // if (c == 0) {
                  //   colfav = Colors.black;
                  // } else if (c == 1) {
                  //   colfav = Colors.pink;
                  // } else if (c == 2) {
                  //   colfav = Colors.green;
                  // } else {
                  //   colfav = Colors.black;
                  //   c = 0;
                  // }
                  // c++;
                });
              },
              icon: Icon(
                Icons.favorite,
                color: tapped ? Colors.pink : Colors.black,
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios)),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/Ad.jpeg'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 2, 10, 0),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.number,
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        width: 1,
                        height: 20,
                        color: Colors.grey,
                      ),
                      Text(
                        widget.email,
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'India',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
                Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Colors.grey,
                ),
                Container(
                  height: 80,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.message),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        width: 1,
                        height: 80,
                        color: Colors.grey,
                      ),
                      Icon(Icons.message),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        width: 1,
                        height: 80,
                        color: Colors.grey,
                      ),
                      Icon(Icons.message),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        width: 1,
                        height: 80,
                        color: Colors.grey,
                      ),
                      Icon(Icons.message),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    'Erat rebum voluptua erat clita et duo sea sit clita erat. Invidunt no eos et sed invidunt aliquyam ut, vero invidunt accusam diam diam elitr. Ipsum stet sadipscing et gubergren. Tempor ea lorem lorem sanctus gubergren,',
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Colors.grey,
                ),
                Container(
                  height: 80,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.message),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        width: 1,
                        height: 80,
                        color: Colors.grey,
                      ),
                      Icon(Icons.message),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Roles',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    'Erat rebum voluptua erat clita et duo sea sit clita erat. Invidunt no eos et sed invidunt aliquyam ut, vero ',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 1,
                  width: double.maxFinite,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Roles',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    'Erat rebum voluptua erat clita et duo sea sit clita erat. Invidunt no eos et sed invidunt aliquyam ut, vero ',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      colbut = Colors.blue;
                    });
                  },
                  onDoubleTap: () {
                    setState(() {
                      colbut = Colors.green;
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: colbut,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          text('Poke Me'),
                        ],
                      )),
                ),
                SizedBox(
                  height: 150,
                )

                // Padding(
                //   padding: EdgeInsets.only(top: 0, left: 40, right: 40),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       columnDeco(),
                //       columnDeco(),
                //       columnDeco(),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }

  toast() {
    return Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        msg: "You cannot go back\nYou are now captured!",
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 20.0);
  }

  text(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black),
    );
  }

  columnDeco() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(55),
              color: Colors.orange[100]),
          child: Icon(Icons.access_alarm),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Poke Me",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
