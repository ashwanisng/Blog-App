import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoSearchFound extends StatelessWidget {
  const NoSearchFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Center(
            child: SvgPicture.asset("assets/images/search.svg", height: 300)),
        Center(
          child: Text(
            "No results found!",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Env.colors.primaryIndigo,
              fontFamily: "Poppins",
            ),
          ),
        ),
      ],
    );
  }
}
