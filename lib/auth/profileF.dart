import 'package:chit_game_android/authentication/google_auth.dart';
import 'package:chit_game_android/controller/login_controller.dart';
import 'package:chit_game_android/screens/MyBlinkingButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileF extends StatefulWidget {
  ProfileF({super.key});
  final controller = Get.put(LoginController());

  @override
  State<ProfileF> createState() => _ProfileFState();
}

class _ProfileFState extends State<ProfileF> {
  // @override
  // void initState() {
  //   super.initState();
  //   getCredit();
  // }

  // var cred;
  // getCredit() async {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(widget.controller.userData!['id'])
  //       .snapshots()
  //       .listen((event) {
  //     // ignore: avoid_print
  //     print("higuybh${event.data()!['Credit']}");
  //     cred = event.data()!['Credit'];
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lime,
      appBar: AppBar(
          title: const Center(child: Text('Welcome')),
          backgroundColor: Colors.pink),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/Blue Wallpaper.png',
          ),
        )),
        child: Center(child: SingleChildScrollView(child: buildprofileview())),
      ),
      // body: Center(child: buildprofileview()),
    );
  }

  Column buildprofileview() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(
            widget.controller.userData!['photo'],
          ).image,
          radius: 70,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          widget.controller.userData!['userName'],
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          // Get.textTheme.bodyText1,
          textScaleFactor: 1.7,
          selectionColor: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.controller.userData!['email'],
          style: const TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          // Get.textTheme.bodyText1,
          textScaleFactor: 1.7,
          selectionColor: Colors.white,
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 8,
        ),

        // ignore: prefer_const_constructors
        SizedBox(
          height: 8,
        ),
        ActionChip(
          backgroundColor: const Color.fromARGB(255, 153, 47, 39),
          avatar: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          label: const Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            print('zzzzzzzz');
            widget.controller.logoutt(context);
            // if (googleAccount.value!.displayName == null) {
            //   Navigator.of(context)
            //       .push(MaterialPageRoute(builder: (context) => GoogleAuth()));
            // }
          },
        ),
        const SizedBox(
          height: 8,
        ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Center(
        //           child: Text('Your credit : $cred',
        //               // ignore: prefer_const_constructors
        //               style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 20))),
        //     ],
        //   ),
        // ),
        // Text("Your available credit :$cred"),

        const SizedBox(
          height: 40,
        ),
        Container(
          height: 60,
          width: 300,
          child: MyBlinkingButton(),
        )
      ],
    );
  }
}
 //why facebook automatic login after logout?