import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("QR Code"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          // height: MediaQuery.of(context).size.height * 0.6,
          // width: MediaQuery.of(context).size.width * 0.8,
          child: QrImage(
            data: "Rajeevan",
            version: QrVersions.auto,
            size: 300.0,
          ),

          // Icon(
          //   Icons.qr_code_scanner_outlined,
          //   size: 300,
          // ),
        ),
      ),
    );
  }
}
