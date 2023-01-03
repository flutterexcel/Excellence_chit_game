// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field, use_full_hex_values_for_flutter_colors

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';
import '../controller/login_controller.dart';
import 'bottomsheet.dart';

class ScratchPage extends StatefulWidget {
  ScratchPage({super.key});
  final controller = Get.put(LoginController());

  @override
  State<ScratchPage> createState() => _ScratchPageState();
}

class _ScratchPageState extends State<ScratchPage> {
  int count = 0;
  List<dynamic> winprice = [
    '10',
    '5',
    'Better luck next time',
    '7',
    'Better luck next time',
    'Better luck next time',
    'Better luck next time',
    'Better luck next time',
    '3',
    'Better luck next time',
    'Better luck next time',
    'Better luck next time',
  ];
  // int count=0;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // getUpdate();
    winprice.shuffle();

    getCredit();
    getWin();
  }

  num winp = 0;

  late int win;
  getWin() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.controller.googleAccount.value!.id)
        .snapshots()
        .listen((event) {
      // ignore: avoid_print
      print("higuybh${event.data()!['Winingprice']}");
      win = event.data()!['Winingprice'];
      setState(() {});
    });
  }

  // ignore: prefer_typing_uninitialized_variables
  var cred;

  getCredit() async {
    // ignore: avoid_print
    print('yyyy$cred');
    // ignore: avoid_print
    print('uuuu${widget.controller.googleAccount.value!.id}');
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.controller.googleAccount.value!.id)
        .snapshots()
        .listen((event) {
      // ignore: avoid_print
      print("higuybh${event.data()!['Credit']}");
      cred = event.data()!['Credit'];
      // ignore: avoid_print
      print('yyyy$cred');
      setState(() {});
    });
  }

  getUpdate() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.controller.googleAccount.value!.id)
        .update({"Credit": cred - 5});
  }

  getWinUpdate(index) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.controller.googleAccount.value!.id)
        .update({"Winingprice": win + int.parse(winprice[index])});
  }

  @override
  Widget build(BuildContext context) {
    // winprice.shuffle();
    // ignore: avoid_print
    print("ihjugv$winprice");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(" Scracth and win"),
            backgroundColor: Colors.deepPurple,
            actions: [
              PopupMenuButton(
                  // add icon, by default "3 dot" icon
                  // icon: Icon(Icons.book)
                  itemBuilder: (context) {
                return [
                  // ignore: prefer_const_constructors
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        // ignore: prefer_const_constructorsn
                        // ignore: prefer_const_constructors
                        Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        const Text("Logout"),
                      ],
                    ),
                  ),
                ];
              }, onSelected: (value) {
                if (value == 1) {
                  widget.controller.logout(context);
                }
              }),
            ],

            // ignore: prefer_const_constructors
            // title: Padding(
            //   padding: const EdgeInsets.only(right: 40),
            //   child: const Center(child: Text("Scratch and Win")),
          ),
          backgroundColor: Colors.deepPurple,
          body: Container(
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
                // ignore: prefer_const_constructors
                gradient: LinearGradient(
                    // transform: GradientRotation(15.0),
                    colors: <Color>[
                  // ignore: prefer_const_constructors
                  Color(0xffC33764),
                  const Color(0xffC1D2671),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            // height: 70,
            // width: 70,
            padding: const EdgeInsets.only(top: 35, right: 20, left: 20),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (BuildContext context, int index) {
                    return showScratchCard(context, index);
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(right: 85, top: 10),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Your winning amount: $win', maxLines: 1,

                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(right: 155, top: 15),
                  child: Text(
                    'Your credit: $cred',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: (() {
                        getWin();
                        // ignore: avoid_print
                        print("bgugugu");
                        // dialougeShow(context);/
                        var rt = win;
                        if (rt <= 100) {
                          showDialog(
                              context: context,
                              builder: ((context) => lowpayment(context)));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => dialougeShow(context));
                        }
                      }),
                      child: const Text(
                        'Buy Credit From Winning Price',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          )),
    );
  }

  showScratchCard(BuildContext context, int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      borderOnForeground: true,
      shadowColor: Colors.black,
      elevation: 20,
      color: const Color.fromARGB(255, 190, 103, 132),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 90,
        width: 90,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Scratcher(
          brushSize: 80,
          threshold: 25,
          accuracy: ScratchAccuracy.low,

          color: const Color.fromARGB(255, 89, 159, 229),
          onThreshold: () {
            setState(() {
              _opacity = 1;
            });
          },
          // onScratchEnd: () => getCredit() && getWinUpdate(),
          onScratchEnd: () {
            count++;
            getCredit();
            // getWinUpdate(index);
            setState(() {});
          },
          // onScratchUpdate: () {
          //   getWinUpdate(index);
          // },
          onScratchStart: (() {
            if (cred == 0) {
              showModasheet(context);

              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return AlertDialog(
              //         title: Text("purchase"),
              //       );
              //     });
            } else {
              getUpdate();
            }
          }),

          // onScratchStart: cred != 0
          //     ? () {
          //         getUpdate();
          //       }
          //     : () {
          //         print('object');
          //       },
          // onChange: (value) => print("Scratch progress: $value%"),
          onChange: ((value) {
            // ignore: avoid_print
            print("gugygg$value");
            if (value > 50) {
              getWinUpdate(index);
            }
          }),
          // : (value) => print("object"),
          // onThreshold: () => print("Threshold reached"),
          child: SingleChildScrollView(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 90,
              width: 90,
              // ignore: prefer_const_constructors
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 25, left: 4),
                    child: Center(
                      child: Text(
                        "You won",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            letterSpacing: 1,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(child: Text(winprice[index])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
