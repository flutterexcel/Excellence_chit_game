import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scratcher/widgets.dart';

import '../controller/login_controller.dart';

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
    '15',
    '20',
    'Better luck next time',
    'Better luck next time',
    'Better luck next time',
    '5'
  ];
  //  @override
  // void initState() {
  //   super.initState();
  //   getUpdate();
  // }
  var cred;
  // getUpdate() async {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(widget.controller.googleAccount.value!.id);
  //       // .update({"Credit": cred - 5});
  // }

  @override
  Widget build(BuildContext context) {
    winprice.shuffle();
    print("ihjugv$winprice");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 20,
          ),
          title: Center(child: const Text("Scratch and Win")),
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    // transform: GradientRotation(15.0),
                    colors: <Color>[
                  Color(0xffC33764),
                  Color(0xffC1D2671),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            // height: 70,
            // width: 70,
            padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
            child: InkWell(
              onTap: () {
                // getUpdate();
                final docUser = FirebaseFirestore.instance
                    .collection("users")
                    .doc(widget.controller.googleAccount.value!.id);
                docUser.update({'Credit': '${cred - 5}'});
                print("rtyt$docUser");
                print("www$cred");
                if (cred == 0) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Text('hello'),
                            Text('hello'),
                            Text('hello'),
                            Text('hello'),
                          ],
                        );
                      });
                }
              },
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0),
                itemBuilder: (BuildContext context, int index) {
                  return showScratchCard(context, index);
                  // return Card(
                  //     color: Colors.orange,
                  //     child: Center(
                  //       child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: const <Widget>[
                  //             Expanded(
                  //                 child: Icon(Icons.arrow_back,
                  //                     size: 50.0, color: Colors.black)),
                  //             Text("You won "),
                  //           ]),
                  //     ));
                },
              ),
            )),
      ),
    );
  }

  showScratchCard(BuildContext context, int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      borderOnForeground: true,
      shadowColor: Colors.black,
      elevation: 20,
      color: const Color.fromARGB(255, 222, 117, 152),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 90,
        width: 90,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Scratcher(
          brushSize: 50,
          threshold: 50,
          color: const Color.fromARGB(255, 89, 159, 229),
          onChange: (value) => print("Scratch progress: $value%"),
          onThreshold: () => print("Threshold reached"),
          child: SingleChildScrollView(
            child: Container(
              height: 90,
              width: 90,
              // ignore: prefer_const_constructors
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   // height: MediaQuery.of(context).size.height * 0.18,
                  //   // width: MediaQuery.of(context).size.width * 0.5,
                  //   height: 25,
                  //   width: 25,
                  //   // child: Image.asset(
                  //   //   "assets/cele.png",
                  //   // ),
                  //   child: Text("hello"),
                  // ),
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

                  Center(child: Text(winprice[index])
                      // Text(
                      //   "\$10",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w400,
                      //       fontSize: 15,
                      //       color: Colors.black),
                      // ),
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
