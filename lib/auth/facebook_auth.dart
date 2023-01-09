// import 'package:chit_game_android/auth/result.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'result.dart';

// class FaceBookAuth extends StatelessWidget {
//   const FaceBookAuth({super.key});

//   Future facebookLogin(BuildContext context) async {
//     print("FaceBook");
//     try {
//       final result =
//           await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
//       print("ghghgh");
//       if (result.status == LoginStatus.success) {
//         final userData = await FacebookAuth.i.getUserData();
//         print("hello");
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Result(userData)),
//         );

//         print(userData['name']);
//         print('AAAAAAA');
//       }
//       print("agsgsg");
//     } catch (error) {
//       print(error);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Login with Facebook'),
//           onPressed: () {
//             facebookLogin(context);
//           },
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: avoid_unnecessary_containers, unused_import, use_build_context_synchronously

import 'package:chit_game_android/auth/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthh extends StatefulWidget {
  const FacebookAuthh({Key? key}) : super(key: key);
  @override
  State<FacebookAuthh> createState() => _FacebookAuthhState();
}

class _FacebookAuthhState extends State<FacebookAuthh> {
  Map<String, dynamic>? _userData;
  // ignore: unused_field
  AccessToken? _accessToken;
  bool _checking = true;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _checkIfisLoggedIn();
  }

  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      _checking = false;
    });
    if (accessToken != null) {
      // ignore: avoid_print
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    } else {
      loginn(context);
    }
  }

  loginn(context) async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      // ignore: avoid_print
      print(result.status);
      // ignore: avoid_print
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logout() async {
    // ignore: unused_local_variable, non_constant_identifier_names

    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(_userData);
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Text('Facebook Auth Project')),
        body: _checking
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _userData != null
                      ? Text('name: ${_userData!['name']}')
                      : Container(),
                  _userData != null
                      ? Text('email: ${_userData!['email']}')
                      : Container(),
                  _userData != null
                      ? Container(
                          child: Image.network(
                              _userData!['picture']['data']['url']),
                        )
                      : Container(),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(
                      onPressed:
                          _userData != null ? _logout() : loginn(context),
                      child: Text(_userData != null ? 'Logout' : 'Login'))
                  // ActionChip(
                  //   backgroundColor: const Color.fromARGB(255, 153, 47, 39),
                  //   avatar: const Icon(
                  //     Icons.logout,
                  //     color: Colors.white,
                  //   ),
                  //   label: const Text(
                  //     'Logout',
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   onPressed: () {
                  //     // widget.controller.logout(context);
                  //     _logout();
                  //     // if (googleAccount.value!.displayName == null) {
                  //     //   Navigator.of(context)
                  //     //       .push(MaterialPageRoute(builder: (context) => GoogleAuth()));
                  //     // }
                  //   },
                  // ),
                  // CupertinoButton(
                  //     // color: Colors.blue,
                  //     child: Text(
                  //       _userData != null ? 'LOGOUT' : 'LOGIN',
                  //       // style: TextStyle(color: Colors.white),
                  //     ),
                  //     onPressed: _userData != null ? _logout : loginn)
                ],
              )),
      ),
    );
  }
}
