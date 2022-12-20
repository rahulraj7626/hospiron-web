import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospiron_reception/common_widgets/common_widget.dart';
import 'package:hospiron_reception/utils/constants.dart';
import 'package:hospiron_reception/view/home_screens/home_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  alignment: Alignment.center,
                  //  margin: const EdgeInsets.all(30),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.1,
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    height: MediaQuery.of(context).size.height * 0.9,
                    // width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colorconstants.colorC4C4C4)),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          title(context),
                          VerticalSpacing(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          contactColumn(context),
                          VerticalSpacing(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/bg.png')),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 100,
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: MediaQuery.of(context).size.height * 0.1,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: const [AuthentcationScreenHeader()],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget title(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.height * 0.02,
          right: MediaQuery.of(context).size.width * 0.02),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        child: Text(
          "Forget Password",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 22,
              color: Colorconstants.color0075FF),
          textScaleFactor: 1,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget contactColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.01,
        top: MediaQuery.of(context).size.height * 0.01,
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.01,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colorconstants.colorB5DFFD,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colorconstants.color575757)),
              const Flexible(
                child: Text(
                  'Only admin can change receptionist account Password',
                  textAlign: TextAlign.left,
                  maxLines: null,
                ),
              ),
            ],
          ),
          VerticalSpacing(height: MediaQuery.of(context).size.height * 0.01),
          contactAdmin(context),
          VerticalSpacing(height: MediaQuery.of(context).size.height * 0.03),
        ],
      ),
    );
  }

  Container contactAdmin(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.height * 0.02,
          right: MediaQuery.of(context).size.width * 0.02),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: Text(
          "Report admin",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontStyle: FontStyle.normal,
          ),
          textScaleFactor: 1,
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colorconstants.color3547E9)),
      ),
    );
  }
}
