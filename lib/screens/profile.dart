import 'package:chit_game_android/authentication/google_auth.dart';
import 'package:chit_game_android/controller/login_controller.dart';
import 'package:chit_game_android/screens/MyBlinkingButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget {
  Profile({super.key});
  final controller = Get.put(LoginController());

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _googleSignin = GoogleSignIn();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCredit();
  }

  var cred;
  getCredit() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(widget.controller.googleAccount.value!.id)
        .snapshots()
        .listen((event) {
      print("higuybh${event.data()!['Credit']}");
      cred = event.data()!['Credit'];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lime,
      appBar: AppBar(
        title: const Center(child: Text('Welcome')),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                // transform: GradientRotation(15.0),
                colors: <Color>[
              Color(0xffC33764),
              Color(0xffC1D2671),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
                  widget.controller.googleAccount.value?.photoUrl ?? '')
              .image,
          radius: 70,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          widget.controller.googleAccount.value?.displayName ?? '',
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
          widget.controller.googleAccount.value?.email ?? '',
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
        // Container(
        //     height: 10,
        //     width: 30,
        //     child: Row(
        //       children: [
        //         Text('Your credit :'),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         const Text('data')
        //       ],
        //     )),

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
            widget.controller.logout(context);
            // if (googleAccount.value!.displayName == null) {
            //   Navigator.of(context)
            //       .push(MaterialPageRoute(builder: (context) => GoogleAuth()));
            // }
          },
        ),
        const SizedBox(
          height: 30,
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 55),
        //   child: Row(
        //     children: [
        //       Text(
        //         "Your available credit :",
        //         style: TextStyle(color: Colors.orange, fontSize: 25),
        //       ),
        //       Text(
        //         widget.controller.googleAccount.value?.email ?? '',
        //       ),
        //     ],
        //   ),
        // ),
        // buildCredit(widget.controller.googleAccount.value!.id),

        Text("Your available credit :$cred"),

        const SizedBox(
          height: 60,
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
