// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class RazoPay extends StatefulWidget {
//   const RazoPay({super.key});

//   @override
//   State<RazoPay> createState() => _RazoPayState();
// }

// class _RazoPayState extends State<RazoPay> {
//   static const platform = MethodChannel("razorpay_flutter");

//   var _razorpay = Razorpay();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Buy Now"),
//         ),
//         body: Center(
//             child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//                 onPressed: onPressed, child: const Text("Go for payment"))
//           ],
//         )),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//     _razorpay.open(options);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear(); // Removes all listeners
//   }

//   var options = {
//     'key': '<YOUR_KEY_ID>',
//     'amount': 50000, //in the smallest currency sub-unit.
//     'name': 'Acme Corp.',
//     'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
//     'description': 'Fine T-Shirt',
//     'timeout': 60, // in seconds
//     'prefill': {'contact': '9123456789', 'email': 'gaurav.kumar@example.com'}
//   };

// // try{
// //   _razorpay.open(options);
// // }catch(e){
// //   debugPrint(e);
// // }
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     // Do something when payment succeeds
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     // Do something when payment fails
//   }

// ignore_for_file: unused_import, prefer_const_constructors

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     // Do something when an external wallet is selected
//   }
// }
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../screens/scratchcard.dart';
import '../service/services.dart';
import 'login_controller.dart';

// class RazoPay extends StatelessWidget {
//   num crd;
//   RazoPay({required this.crd});
//   final controller = Get.put(LoginController());

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: RazorPay(title: 'Payment'),
//     );
//   }
// }

// ignore: must_be_immutable
class RazorPay extends StatefulWidget {
  num crd;
  RazorPay({super.key, required this.crd});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  State<RazorPay> createState() => _RazorPayState();
}

class _RazorPayState extends State<RazorPay> {
  final controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    // getUpdate();

    getCredit();
  }

  // ignore: prefer_typing_uninitialized_variables
  var cred;

  getCredit() async {
    // ignore: avoid_print
    print('yyyy$cred');
    // ignore: avoid_print
    print('uuuu${controller.googleAccount.value!.id}');
    FirebaseFirestore.instance
        .collection("users")
        .doc(controller.googleAccount.value!.id)
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
    // ignore: avoid_print
    print('vvvv${widget.crd.runtimeType} cred${cred.runtimeType}');

    FirebaseFirestore.instance
        .collection("users")
        .doc(controller.googleAccount.value!.id)
        .update({"Credit": cred + widget.crd});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              'Go for payment',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          backgroundColor: Colors.pink),
      body: Container(
        // ignore: prefer_const_constructors, duplicate_ignore
        decoration: BoxDecoration(
            image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/Blue Wallpaper.png',
          ),
        )
            // ignore: prefer_const_constructors
            // gradient: LinearGradient(
            //     // transform: GradientRotation(15.0),
            //     // ignore: prefer_const_literals_to_create_immutables
            //     colors: <Color>[
            //   const Color(0xffC33764),
            //   // ignore: use_full_hex_values_for_flutter_colors
            //   const Color(0xffC1D2671),
            // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),

            ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () async {
                    RemoteService().getPosts();
                    var params = {
                      "amount": 50000,
                      "currency": "INR",
                      "receipt": "rcptid_11"
                    };

                    var response = await http.post(
                        Uri.parse("https://api.razorpay.com/v1/orders"),
                        body: json.encode(params),
                        headers: {
                          "content-type": "application/json",
                          'Authorization':
                              "Basic cnpwX3Rlc3RfSmZtTGJyRkxjTnFKdXE6V3hlSjJsRzFwQjRveHBFeDYwRDR5N1RZ"
                        });

                    // ignore: avoid_print
                    print('ddd${response.body}');

                    Razorpay razorpay = Razorpay();
                    var options = {
                      'key': 'rzp_test_JfmLbrFLcNqJuq',
                      'amount': 10,
                      'name': 'Chit_game Corp.',
                      'description': 'Get credit',
                      'order_id': jsonDecode(response.body)['id'],
                      'retry': {'enabled': true, 'max_count': 1},
                      'send_sms_hash': true,
                      'prefill': {
                        'contact': '8888888888',
                        'email': 'test@razorpay.com'
                      },
                      'external': {
                        'wallets': ['paytm']
                      }
                    };
                    // ignore: avoid_print
                    print('uuu$options');
                    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                        handlePaymentErrorResponse);
                    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                        handlePaymentSuccessResponse);
                    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                        handleExternalWalletSelected);
                    razorpay.open(options);
                  },
                  child: const Text("Pay with Razorpay")),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    // ignore: unnecessary_null_comparison
    if ({response.paymentId} != null) {
      getUpdate();
    }
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {
        Navigator.pop(context);
        // Navigator.pop(context);
        // Navigator.pop(context);

        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => ScratchPage()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
