import 'package:flutter/material.dart';

class NoSearchResult extends StatelessWidget {
  const NoSearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        "assets/images/14_No Search Results.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
