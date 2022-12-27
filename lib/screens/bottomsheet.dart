import 'package:flutter/material.dart';

showModasheet(BuildContext context) {
  return showModalBottomSheet(
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
