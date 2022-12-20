import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospiron_reception/api_services/patient_list_service.dart';
import 'package:hospiron_reception/common_widgets/common_widget.dart';
import 'package:hospiron_reception/model/op_patient_model.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  PatientModel? patientList;
  bool loading = true;
  Future getPatientList() async {
    PatientModel? getData = await patientListig(context);

    setState(() {
      if (getData != null) {
        loading = false;
        patientList = getData;
        print(patientList);
      }
    });
  }

  _showPopupMenu() async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 400, 100, 400),
      items: [
        const PopupMenuItem(
          child: Text("Add to watchlist"),
        ),
      ],
      elevation: 8.0,
    );
  }

  @override
  void initState() {
    getPatientList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 3, color: Color(0xff0094FF)),
          ),
          color: Colors.white,
        ),
        child: loading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : ListView.separated(
                // shrinkWrap: true,

                padding: const EdgeInsets.all(5),
                itemBuilder: (context, index) {
                  return patientListSingleView(context, index);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Color(
                      0xff0094FF,
                    ),
                    thickness: 2,
                  );
                },
                itemCount: patientList!.patients.length));
  }

  Widget patientListSingleView(BuildContext context, index) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const PatientProfileScreen()),
        // );
      },
      onLongPress: _showPopupMenu,
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            patientName(context, index),
            const HorizontalSpacing(width: 2),
            address(index),
            const HorizontalSpacing(width: 2),
            department(index),
            const HorizontalSpacing(width: 2),
            visitStatus(),
            const HorizontalSpacing(width: 2),
            payment(index),
            const HorizontalSpacing(width: 2),
            popupfun(context),
          ],
        ),
      ),
    );
  }

  SizedBox patientName(BuildContext context, index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4.8,
      child: Center(
          child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: patientList!.patients[index].patientName + '\n',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontStyle: FontStyle.normal,
              ),
            ),
            TextSpan(
                text: patientList!.patients[index].patientAge +
                    " " +
                    patientList!.patients[index].patientGender,
                style: fstye),
          ],
        ),
        textScaleFactor: 1,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      )),
    );
  }

  SizedBox address(index) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            "+91 7937200432",
            style: fstye,
            textScaleFactor: 1,
          ),
          Text(
            patientList!.patients[index].patientAddress,
            style: fstye,
            textScaleFactor: 1,
          ),
        ],
      ),
    );
  }

  PopupMenuButton popupfun(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(Icons.menu),
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                value: 1,
              ),
              PopupMenuItem(
                child: Text(
                  "Info",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                value: 2,
              ),
              PopupMenuItem(
                child: Text(
                  "Refund",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                value: 3,
              ),
              PopupMenuItem(
                child: Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                value: 4,
              ),
            ]);
  }

  SizedBox department(index) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            patientList!.patients[index].departmentName,
            style: fstye,
            textScaleFactor: 1,
          ),
          Text(
            patientList!.patients[index].doctorName,
            style: fstye,
            textScaleFactor: 1,
          ),
        ],
      ),
    );
  }

  SizedBox payment(index) {
    return SizedBox(
      child: Center(
        child: Text(
          patientList!.patients[index].patientPayment,
          //  "Payment\nInsurance",
          style: fstye,
          textScaleFactor: 1,
        ),
      ),
    );
  }

  SizedBox visitStatus() {
    return SizedBox(
      child: Center(
        child: Text(
          "Visit\nStatus",
          style: fstye,
          textScaleFactor: 1,
        ),
      ),
    );
  }
}

final fstye = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  fontStyle: FontStyle.normal,
);
