import 'package:chit_game_android/authentication/google_auth.dart';
import 'package:chit_game_android/authentication/splashScreen.dart';
import 'package:chit_game_android/screens/profile.dart';
import 'package:chit_game_android/screens/scratchcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../controller/razorpay.dart';

showModasheet(
  BuildContext context,
) {
  bool valuefirst = false;
  bool valuesecond = false;
  // final int crd;
  num crd = 0;

  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Wrap(children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                // decoration:
                //     // ignore: prefer_const_constructors
                //     BoxDecoration(
                //   // ignore: prefer_const_constructors
                //   borderRadius: BorderRadius.only(
                //     topRight: const Radius.circular(50),
                //     topLeft: const Radius.circular(50),
                //     // ignore: prefer_const_constructors
                //   ),
                // ),
                height: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        // InkWell(
                        //   onTap: () {
                        //     // Navigator.pushReplacement(
                        //     //   context,
                        //     //   MaterialPageRoute(
                        //     //       builder: (context) => ScratchPage()),
                        //     // );
                        //   },
                        //   child: const Icon(
                        //     Icons.arrow_back_ios,
                        //     size: 18,
                        //   ),
                        // ),
                        // ignore: prefer_const_constructors
                        // Text(
                        //   'Back',
                        //   style: const TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 80,
                        ),
                        const Text(
                          'GET PREMIUM ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.green),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: (() {
                        crd = 100;
                        setState(
                          () {
                            valuesecond = false;
                            valuefirst = !valuefirst;
                          },
                        );
                      }),
                      child: Container(
                        height: 60,
                        width: 320,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blueAccent, width: 3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              value: valuefirst,
                              onChanged: (Value) {
                                // valuesecond = false;
                                print('hi');
                                setState(
                                  () {
                                    valuesecond = false;
                                    valuefirst = !valuefirst;
                                  },
                                );
                              },
                            ),
                            // Checkbox(
                            //     value: false,
                            //     onChanged: ((value) {
                            //       value = true;
                            //     })),

                            // Radio(
                            //     value: 0,
                            //     groupValue: tt,
                            //     onChanged: ((value) {
                            //       rd = 1;
                            //     })),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 5),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      '100 Credit',
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 6, top: 0),
                                    child: const Text('Rs 100 one-time'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25, top: 5),
                              child: Column(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text('credit'),
                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        width: 5,
                                      ),
                                      // ignore: prefer_const_constructors
                                      Text(
                                        '5',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                      const Text(' /scratch')
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        crd = 150;
                        setState(
                          () {
                            valuefirst = false;
                            valuesecond = !valuesecond;
                          },
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 320,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blueAccent, width: 3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              value: valuesecond,
                              onChanged: (Value) {
                                print('hi');
                                // valuefirst = false;
                                setState(
                                  () {
                                    valuefirst = false;
                                    valuesecond = !valuesecond;
                                  },
                                );
                              },
                            ),
                            // Radio(
                            //     value: false,
                            //     groupValue: rd,
                            //     onChanged: ((value) {
                            //       // setState(() {
                            //       //   rd = !rd;
                            //       // });
                            //     })),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 5),
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      '150 Credit',
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: const Text('Rs 150 one-time'),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25, top: 5),
                              child: Column(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text('credit'),
                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        width: 5,
                                      ),
                                      // ignore: prefer_const_constructors
                                      Text(
                                        '5',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                      const Text(' /scratch')
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 50,
                    ),

                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => RazorPay(crd: crd)));
                        },
                        // ignore: prefer_const_constructors, sort_child_properties_last
                        child: Center(child: Text(" Go To Payment")),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                      ),
                    )

                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Container(
                    //     height: 60,
                    //     width: 300,

                    //     // ignore: prefer_const_constructors
                    //     decoration: BoxDecoration(
                    //       color: Colors.blue,
                    //       borderRadius: const BorderRadius.all(Radius.circular(30)),
                    //     ),
                    //     // ignore: prefer_const_constructors
                    //     child: Center(
                    //       // ignore: prefer_const_constructors
                    //       child: const Text(
                    //         'Go To Payment',
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // ignore: prefer_const_constructors
                  ],
                ),
              ),
            ),
          ]);
        });
      });
}

dialougeShow(BuildContext context) {
  bool valuefirst = false;
  bool valuesecond = false;
  num crd = 0;
  return StatefulBuilder(builder: ((context, setState) {
    print("hsjdkfkd");
    return AlertDialog(
      // title: Text("ugu"),
      content: Container(
        width: 600,
        // decoration:
        //     // ignore: prefer_const_constructors
        //     BoxDecoration(
        //   // ignore: prefer_const_constructors
        //   borderRadius: BorderRadius.only(
        //     topRight: const Radius.circular(50),
        //     topLeft: const Radius.circular(50),
        //     // ignore: prefer_const_constructors
        //   ),
        // ),
        height: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                // InkWell(
                //   onTap: () {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(builder: (context) => ScratchPage()),
                //     );
                //   },
                //   child: const Icon(
                //     Icons.arrow_back_ios,
                //     size: 13,
                //   ),
                // ),
                // ignore: prefer_const_constructors
                // Text(
                //   'Back',
                //   style: const TextStyle(
                //       fontWeight: FontWeight.bold, fontSize: 12),
                // ),
                // ignore: prefer_const_constructors
                SizedBox(
                  width: 25,
                ),
                const Text(
                  'Buy With Winning Amount',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                crd = 100;
                setState(
                  () {
                    valuesecond = false;
                    valuefirst = !valuefirst;
                  },
                );
              },
              child: Container(
                height: 60,
                width: 250,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                      value: valuefirst,
                      onChanged: (Value) {
                        // valuesecond = false;
                        print('hi');
                        setState(
                          () {
                            valuesecond = false;
                            valuefirst = !valuefirst;
                          },
                        );
                      },
                    ),
                    // Checkbox(
                    //     value: false,
                    //     onChanged: ((value) {
                    //       value = true;
                    //     })),

                    // Radio(
                    //     value: 0,
                    //     groupValue: tt,
                    //     onChanged: ((value) {
                    //       rd = 1;
                    //     })),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                            ),
                            // ignore: prefer_const_constructors
                            child: Text(
                              '100 Credit',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 5,
                          ),
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 0),
                            child: const Text('Rs 100 one-time'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Column(
                        children: [],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                crd = 150;
                setState(
                  () {
                    valuefirst = false;
                    valuesecond = !valuesecond;
                  },
                );
              },
              child: Container(
                height: 60,
                width: 250,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                      value: valuesecond,
                      onChanged: (Value) {
                        print('hi');
                        // valuefirst = false;
                        setState(
                          () {
                            valuefirst = false;
                            valuesecond = !valuesecond;
                          },
                        );
                      },
                    ),
                    // Radio(
                    //     value: false,
                    //     groupValue: rd,
                    //     onChanged: ((value) {
                    //       // setState(() {
                    //       //   rd = !rd;
                    //       // });
                    //     })),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.only(top: 3, left: 0),
                            // ignore: prefer_const_constructors
                            child: Text(
                              '150 Credit',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 5,
                          ),
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: const Text('Rs 150 one-time'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Column(
                        children: [],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 50,
            ),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  paymentSuccessed(context, crd);
                  print('ttrtr$crd');
                },
                // ignore: prefer_const_constructors, sort_child_properties_last
                child: Center(child: Text(" Go To Payment")),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
              ),
            )

            // ElevatedButton(
            //   onPressed: () {},
            //   child: Container(
            //     height: 60,
            //     width: 300,

            //     // ignore: prefer_const_constructors
            //     decoration: BoxDecoration(
            //       color: Colors.blue,
            //       borderRadius: const BorderRadius.all(Radius.circular(30)),
            //     ),
            //     // ignore: prefer_const_constructors
            //     child: Center(
            //       // ignore: prefer_const_constructors
            //       child: const Text(
            //         'Go To Payment',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ),
            // ),
            // ignore: prefer_const_constructors
          ],
        ),
      ),
    );
  }));
}

final controller = Get.put(LoginController());

var cred;

getCredit() async {
  print('yyyy$cred');
  print('uuuu${controller.googleAccount.value!.id}');
  FirebaseFirestore.instance
      .collection("users")
      .doc(controller.googleAccount.value!.id)
      .snapshots()
      .listen((event) {
    print("higuybh${event.data()!['Credit']}");
    cred = event.data()!['Credit'];
    print('yyyy$cred');
    // setState(() {});
  });
}

getUpdate(crd) async {
  print('vvvv${crd.runtimeType} cred${cred.runtimeType}');

  FirebaseFirestore.instance
      .collection("users")
      .doc(controller.googleAccount.value!.id)
      .update({"Credit": cred + crd});
}

paymentSuccessed(BuildContext context, crd) {
  getCredit();
  getUpdate(crd);
  return StatefulBuilder(builder: ((context, setState) {
    return AlertDialog(
        // title: Text("ugu"),
        content: Container(
      height: 300,
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables, prefer_const_constructors
        children: [
          // ignore: prefer_const_constructors
          Center(
              // ignore: prefer_const_constructors
              child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: const Text(
              'sucessfully',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )),
          const Icon(
            Icons.check_box,
            size: 30,
          )
        ],
      ),
    ));
  }));
}
