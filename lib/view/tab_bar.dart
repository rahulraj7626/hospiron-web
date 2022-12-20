import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospiron_reception/common_widgets/common_widget.dart';
import 'package:badges/badges.dart';
import 'package:hospiron_reception/view/patient_list.dart';

class MaiTab extends StatefulWidget {
  const MaiTab({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  _MaiTabState createState() => _MaiTabState();
}

class _MaiTabState extends State<MaiTab> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: 4,
      vsync: this,
    );
    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(
            0xffB5DFFD,
          ),
        ),

        // height:
        // MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            DefaultTabController(
              length: 4,
              initialIndex: 0,
              child: TabBar(
                controller: _controller,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: [
                  Badge(
                    position: BadgePosition.center(),
                    badgeContent: Text(
                      "0",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          "Out patients",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                    ),
                  ),
                  Badge(
                    position: BadgePosition.center(),
                    badgeContent: Text(
                      "0",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          "Admissions",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                    ),
                  ),
                  Badge(
                    position: BadgePosition.center(),
                    badgeContent: Text(
                      "20",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          "Reviews",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                    ),
                  ),
                  Badge(
                    position: BadgePosition.center(),
                    badgeContent: Text(
                      "30",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          "Doctors",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                          ),
                          textScaleFactor: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: TabBarView(
                  controller: _controller,
                  children: [
                    PatientList(),
                    PatientList(),
                    PatientList(),
                    PatientList(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
