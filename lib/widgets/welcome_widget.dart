import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style.dart';

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Hallo Learner!", style: TitleTextStyle),
        SvgPicture.asset("assets/images/main.svg", height: size.height * 0.5)
      ],
    ));
  }
}
