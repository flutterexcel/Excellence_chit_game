import 'package:chit_game_android/authentication/google_auth.dart';
import 'package:chit_game_android/authentication/splashScreen.dart';
import 'package:chit_game_android/screens/profile.dart';
import 'package:chit_game_android/screens/scratchcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showModasheet(BuildContext context) {
  bool rd = false;
  bool tt = true;
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (context) {
        return Padding(
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
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScratchPage()),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      'Back',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 30,
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
                Container(
                  height: 60,
                  width: 320,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: rd,
                          onChanged: ((value) {
                            // setState(() {
                            //   rd = !rd;
                            // });
                          })),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          // Text(
                          //   '100 Credit',
                          //   style: TextStyle(fontSize: 20),
                          // ),
                          // // ignore: prefer_const_constructors
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Text('rupee 100 one-time')
                        ],
                      )
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 320,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 3),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: rd,
                          onChanged: ((value) {
                            // setState(() {
                            //   rd = !rd;
                            // });
                          })),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            '100 Credit',
                            style: TextStyle(fontSize: 20),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 5,
                          ),
                          Text('rupee 100 one-time')
                        ],
                      )
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 70,
                ),

                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {},
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
      });
}
