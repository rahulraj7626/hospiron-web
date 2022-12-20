import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospiron_reception/api_services/login_service.dart';
import 'package:hospiron_reception/common_widgets/common_widget.dart';
import 'package:hospiron_reception/utils/constants.dart';
import 'package:hospiron_reception/view/home_screens/home_screen.dart';
import 'package:hospiron_reception/view/user_auth/forgot_password.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void valfn() {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const HomeScreen()),
    // );
    if (_formKey.currentState!.validate()) {
      loginService(context, emailController.text, passwordController.text);
    }
  }

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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            title(),
                            welcomeMessage(
                                "login with email and password form admin"),
                            VerticalSpacing(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            buildText(context, 'Email', emailController),
                            buildText(context, 'Password', passwordController),
                            VerticalSpacing(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            logInButton(context, valfn),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword()),
                                  );
                                },
                                child: fogotPassword(context)),
                          ],
                        ),
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
                    height: MediaQuery.of(context).size.height * 0.9,
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

  Widget title() {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        child: Text(
          "Login",
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

  Widget welcomeMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        child: Text(
          message,
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: Colorconstants.color696969),
          textScaleFactor: 1,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget buildText(BuildContext context, caption, controller) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.height * 0.02,
          right: MediaQuery.of(context).size.width * 0.02),
      child: TextFormField(
        controller: controller,
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            fontSize: 12,
            color: Colorconstants.color4A4A4A),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: caption,
          hintStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              fontSize: 12,
              color: Colorconstants.color4A4A4A),
        ),
      ),
    );
  }

  Padding fogotPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.height * 0.02,
          right: MediaQuery.of(context).size.width * 0.02),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          "Forgot password ?",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Colorconstants.color0075FF),
          textAlign: TextAlign.start,
          textScaleFactor: 1,
        ),
      ),
    );
  }

  Container logInButton(BuildContext context, onpress) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.height * 0.02,
          right: MediaQuery.of(context).size.width * 0.02),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onpress,
        child: Text(
          "Login",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontStyle: FontStyle.normal,
          ),
          // textScaleFactor: 1,
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
