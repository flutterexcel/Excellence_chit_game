import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentClass extends StatefulWidget {
  const PaymentClass({super.key});

  @override
  State<PaymentClass> createState() => _PaymentClassState();
}

class _PaymentClassState extends State<PaymentClass> {
  // ignore: unused_field
  final _razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Text('kemmkemk'),
    );
  }
}
