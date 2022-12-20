import 'package:flutter/material.dart';
import 'package:hospiron_reception/view/qr_screen/qr.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Colors.blue,
      ),
      child: Container(
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/ic_nav_search.png', scale: 1.8),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QRScreen()));
                  },
                  child:
                      Image.asset('assets/images/ic_nav_qr.png', scale: 1.8)),
              Image.asset('assets/images/ic_nav_person.png', scale: 1.8),
              Image.asset('assets/images/ic_nav_doller.png', scale: 1.8),
              Image.asset('assets/images/ic_nav_refresh.png', scale: 1.8),
              Image.asset('assets/images/ic_nav_headset.png', scale: 1.8),
            ],
          ),
        ),
      ),
    );
  }
}
