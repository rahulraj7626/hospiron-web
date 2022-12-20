import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 20,
      child: Image.asset(
        "assets/images/ic_back.png",
        height: 25,
        width: 20,
        fit: BoxFit.contain,
      ),
    );
  }
}

class AuthentcationScreenHeader extends StatelessWidget {
  const AuthentcationScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        hospironLogo(context),
       // backButton(context),
      ],
    );
  }

  Widget backButton(BuildContext context) {
    return Positioned(
      left: 10,
      top: 60,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          child: Image.asset(
            "assets/images/ic_back.png",
            height: 25,
            width: 20,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Padding hospironLogo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.5,
        child: Image.asset(
          "assets/images/hospiron_logo.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
   
}
