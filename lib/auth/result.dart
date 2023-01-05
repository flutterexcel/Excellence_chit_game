import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  Result(this.userData, {super.key});
  Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(userData['name']),
              // CircleAvatar(
              //   backgroundImage: NetworkImage(userData['url'], scale: 1),
              //   radius: 50,
              // ),
              Text(userData['email']),
              ElevatedButton(
                  onPressed: () {
                    logout();
                  },
                  child: Text('logout'))
            ],
          ),
        ));
  }

  logout() async {
    await FacebookAuth.instance.logOut();
    // _accessToken = null;
    // userData = null;
    // setState(() {});
  }
}
