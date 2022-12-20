import 'package:flutter/material.dart';
import 'package:hospiron_reception/utils/constants.dart';
import 'package:hospiron_reception/view/appbar.dart';
import 'package:hospiron_reception/view/nav_bar.dart';
import 'package:hospiron_reception/view/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colorconstants.bgcolor),
          height: _height,
          width: _width,
          child: Column(
            children: [
              AppbarWidget(
                height: _height,
                width: _width,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: NavBar(
                        height: _height,
                        width: _width,
                      )),
                  Expanded(
                      flex: 14,
                      child: MaiTab(
                        height: _height,
                        width: _width,
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
