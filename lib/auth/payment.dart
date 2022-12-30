import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentClass extends StatefulWidget {
  const PaymentClass({super.key});

  @override
  State<PaymentClass> createState() => _PaymentClassState();
}

class _PaymentClassState extends State<PaymentClass> {
  final _razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('kemmkemk'),
    );
  }
}
