// ignore_for_file: prefer_const_literals_to_create_immutables

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
  late int count;
  List<String> winprice = [
    '10',
    '5.0',
    'Better luck next time',
    '7',
    'Better luck next time',
    'Better luck next time',
    'Better luck next time',
    'Better luck next time',
    '3'
  ];
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // getUpdate();
    winprice.shuffle();

    getCredit();
  }

  var cred;

  getCredit() async {
    print('yyyy$cred');
    print('uuuu${widget.controller.googleAccount.value!.id}');
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.controller.googleAccount.value!.id)
        .snapshots()
        .listen((event) {
      print("higuybh${event.data()!['Credit']}");
      cred = event.data()!['Credit'];
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

  @override
  Widget build(BuildContext context) {
    // winprice.shuffle();
    print("ihjugv$winprice");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(" Scracth and win"),
            backgroundColor: Colors.redAccent,
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
                  Color(0xffC1D2671),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            // height: 70,
            // width: 70,
            padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0),
                  itemBuilder: (BuildContext context, int index) {
                    return showScratchCard(context, index);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(right: 90, top: 30),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Your winning amount: ', maxLines: 1,

                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: (() {
                        print("bgugugu");
                        // dialougeShow(context);/
                        showDialog(
                            context: context,
                            builder: (context) => dialougeShow(context));
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
      color: Color.fromARGB(255, 190, 103, 132),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 90,
        width: 90,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Scratcher(
          brushSize: 40,
          threshold: 25,

          color: const Color.fromARGB(255, 89, 159, 229),
          onThreshold: () {
            setState(() {
              _opacity = 1;
            });
          },
          onScratchEnd: () => getCredit(),
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
          onChange: (value) => print("Scratch progress: $value%"),
          // : (value) => print("object"),
          // onThreshold: () => print("Threshold reached"),
          child: SingleChildScrollView(
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
