import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospiron_reception/utils/constants.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.15,
      width: widget.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: hospironLogo(context, widget.width),
          ),
          Expanded(
            flex: 4,
            child: searchWidget(context, widget.width),
          ),
          Expanded(
            flex: 3,
            child: newButton(context),
          ),
          Expanded(
            flex: 3,
            child: locationDetail(),
          ),
          Expanded(
            flex: 1,
            child: profileImage(),
          ),
          Expanded(flex: 1, child: vertMore()),
        ],
      ),
    );
  }

  Widget vertMore() {
    return GestureDetector(
        child: Container(
      child: Icon(
        Icons.more_vert,
        size: 35,
      ),
    ));
  }

  Widget profileImage() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('assets/images/ic_admin.png',
                fit: BoxFit.contain, scale: 1.5),
          ),
          Text(
            "Admin",
            style: TextStyle(fontSize: 12, color: Colors.blue),
          )
        ],
      ),
    );
  }

  Widget locationDetail() {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "LORDS Hospital",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text("Trivandrm",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black45))),
              ],
            ),
          ],
        ));
  }

  Container newButton(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => const HomeScreen()),
          // );
        },
        child: Text(
          "+ New Patient",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontStyle: FontStyle.normal,
          ),
          textScaleFactor: 1,
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colorconstants.color0075FF)),
      ),
    );
  }
}

Widget searchWidget(context, width) {
  TextEditingController controller = TextEditingController();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      onChanged: (value) {},
      style: TextStyle(
        color: Colors.grey[600],
      ),
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  controller.clear();
                },
              )
            : const Icon(Icons.search),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        contentPadding:
            const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        hintText: 'Search',

        // fillColor: Colors.white24,
        hintStyle: TextStyle(color: Colors.grey[600]),
      ),
    ),
  );
}

Widget hospironLogo(BuildContext context, width) {
  return SizedBox(child: Image.asset("assets/images/hospiron_logo.png"));
}
