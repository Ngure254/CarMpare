import 'package:flutter/material.dart';

class Orline extends StatelessWidget {
  const Orline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: const Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
      const Text("OR"),
      Expanded(
        child:  Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            // ignore: prefer_const_constructors
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
    ]);
  }
}
