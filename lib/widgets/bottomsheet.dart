import 'package:flutter/material.dart';

Future bottomSheet({context}) {
  return showModalBottomSheet(
    builder: (BuildContext context) => Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[],
      ),
    ),
    context: context,
  );
}
