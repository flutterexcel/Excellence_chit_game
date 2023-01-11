// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field, use_full_hex_values_for_flutter_colors, duplicate_ignore, duplicate_import

// import 'dart:html';

import 'package:chit_game_android/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';
import '../controller/login_controller.dart';
import 'bottomsheet.dart';
import 'package:audioplayers/audioplayers.dart';
import 'profile.dart';

class ScratchPage extends StatefulWidget {
  ScratchPage({super.key});
  final controller = Get.put(LoginController());
  // final controllerr = ConfettiController();

  @override
  State<ScratchPage> createState() => _ScratchPageState();
}

class _ScratchPageState extends State<ScratchPage> {
  late ConfettiController _topController;

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
  List<bool> isfinished = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  void initState() {
    _topController = ConfettiController(duration: const Duration(seconds: 2));

    super.initState();
    // getUpdate();
    winprice.shuffle();
    getCredit();
    getWin();
  }

  @override
  void dispose() {
    // dispose the controller
    _topController.dispose();
    super.dispose();
  }

  num winp = 0;

  int win = 0;
  getWin() async {
    // ignore: avoid_print
    print('pppp${controller.userData!['id']}');
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.controller.userData!['id'])
        .snapshots()
        .listen((event) {
      // ignore: avoid_print
      print("chchc${event.data()!['Winingprice']}");
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
    print('uuuu${widget.controller.userData!['id']}');
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.controller.userData!['id'])
        .snapshots()
        .listen((event) {
      // ignore: avoid_print
      print("uybh${event.data()!['Credit']}");
      cred = event.data()!['Credit'];
      // ignore: avoid_print
      print('yyyy$cred');
      setState(() {});
    });
  }

  getUpdate() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.controller.userData!['id'])
        .update({"Credit": cred - 5});
  }

  getWinUpdate(index) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.controller.userData!['id'])
        .update({"Winingprice": win + int.parse(winprice[index])});
  }

  // getWinPriceUpdate(index) async {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(widget.controller.googleAccount.value!.id)
  //       .update({"Winingprice": win + int.parse(winprice[index])});
  // }

  @override
  Widget build(BuildContext context) {
    // winprice.shuffle();
    // ignore: avoid_print
    print("ihjugv$winprice");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Profile()))),
            title: const Center(child: Text("Scracth and win")),
            backgroundColor: Colors.pink,
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
                  widget.controller.logoutt(context);
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Profile()),
                  //     (Route<dynamic> route) => false);
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
                image: DecorationImage(
              fit: BoxFit.cover,
              // ignore: prefer_const_constructors
              image: AssetImage(
                'assets/images/Blue Wallpaper.png',
              ),
            )
                // ignore: prefer_const_constructors
                // gradient: LinearGradient(
                //     // transform: GradientRotation(15.0),
                //     colors: <Color>[
                //   // ignore: prefer_const_constructors
                //   Color(0xffC33764),
                //   const Color(0xffC1D2671),
                // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)

                ),
            // height: 70,
            // width: 70,
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
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
                      if (rt <= 150) {
                        showDialog(
                            context: context,
                            builder: ((context) => lowpayment(context)));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => dialougeShow(context));
                      }
                    }),
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'Buy Credit From Winning Price',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: const Color.fromARGB(88, 240, 108, 14)),
                  ),
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
      elevation: 30,
      color: const Color.fromARGB(255, 190, 103, 132),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(50)),
      child: Card(
        // height: 90,
        // width: 90,
        clipBehavior: Clip.antiAlias,
        borderOnForeground: true,
        shadowColor: Colors.black,
        elevation: 30,
        // ignore: prefer_const_constructors
        color: Color.fromARGB(255, 4, 227, 93),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(70)),
        child: Scratcher(
          // enabled: true,
          brushSize: 80,
          threshold: 90,
          accuracy: ScratchAccuracy.low,

          color: const Color.fromARGB(255, 89, 159, 229),
          onThreshold: () {
            setState(() {
              _opacity = 1;
              // ignore: avoid_print
              print('aaaaaaa$_opacity');
            });
          },
          // onScratchEnd: () =>  getUpdate() && getWinUpdate(index),
          onScratchEnd: () {
            count++;
            if (isfinished[index] == true) {
              // ignore: avoid_print
              print('t');
            } else {
              // ignore: avoid_print
              print('yy');
              getCredit();
              if (cred > 0) {
                getUpdate();
              }
              // getWinUpdate(index);
              isfinished[index] = true;
              if (isfinished[index] == true && cred != 0) {
                getWinUpdate(index);
                if (winprice[index] != 'Better luck next time') {
                  // ignore: unused_local_variable, avoid_print
                  print('hdbgfdj');
                  final audioPlayer = AudioPlayer();
                  audioPlayer.play(AssetSource('2PBE8A4-huge-win.mp3'));
                }
              }
              // ignore: avoid_print
              print('oo$isfinished');
              var ct = 0;
              for (int i = 0; i < isfinished.length; i++) {
                if (isfinished[i]) {
                  ct++;
                  // break;
                }
              }
              if (winprice[index] != 'Better luck next time' &&
                  isfinished[index] == true) {
                _topController.play();
              }

              if (ct == 12) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ScratchPage()));
              }
            }
            // getCredit();
            // getWinUpdate(index);
            // setState(() {});
          },

          onScratchStart: (() {
            if (cred == 0) {
              showModasheet(context);
            }
            // else {
            //   getUpdate();
            // }
          }),

          // onChange: (value) => print("Scratch progress: $value%"),
          // onChange: ((value) {
          //   print("gugygg$value");
          //   if (value > 50) {
          //     getWinUpdate(index);
          //   }
          // }),
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
                  // for (int i = 0; i < winprice.length; i++)
                  (winprice[index] != 'Better luck next time')
                      ? Padding(
                          padding:
                              const EdgeInsets.only(top: 25, left: 4, right: 4),
                          child: Center(
                            child: Stack(children: [
                              Text(
                                "You won    Rs ${winprice[index]}",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  // letterSpacing: 1,
                                  // color: Color.fromARGB(255, 52, 89, 9),
                                  color: Color.fromARGB(255, 7, 7, 241),
                                ),
                              ),
                              (isfinished[index] == true)
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: ConfettiWidget(
                                        confettiController: _topController,
                                        blastDirectionality:
                                            BlastDirectionality.explosive,
                                        maxBlastForce: 5,
                                        minBlastForce: 1,
                                        emissionFrequency: 0.01,
                                        // 10 paticles will pop-up at a time
                                        numberOfParticles: 100,
                                        // particles will come down
                                        gravity: .3,
                                        // start again as soon as the
                                        // animation is finished
                                        // shouldLoop: true,
                                        // assign colors of any choice
                                        colors: const [
                                          Colors.green,
                                          Colors.yellow,
                                          Colors.pink,
                                          Colors.orange,
                                          Colors.blue
                                        ],
                                      ),
                                    )
                                  : SizedBox()
                            ]),

                            // child: Text(
                            //   "You won    Rs ${winprice[index]}",
                            //   textAlign: TextAlign.center,
                            //   maxLines: 2,
                            //   style: const TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 16,
                            //     // letterSpacing: 1,
                            //     // color: Color.fromARGB(255, 52, 89, 9),
                            //     color: Color.fromARGB(255, 7, 7, 241),
                            //   ),
                            // ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // ignore: prefer_const_constructors
                            Padding(
                              padding: const EdgeInsets.only(top: 27),
                              // ignore: prefer_const_constructors
                              child: Text(
                                'Better luck next time',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    // ignore: prefer_const_constructors
                                    // color: Color.fromARGB(255, 7, 7, 241),
                                    color: const Color.fromARGB(255, 184, 2, 2),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // Center(child: Text(winprice[index])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
