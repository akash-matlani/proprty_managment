import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proprty_managment/icons.dart';
import 'package:proprty_managment/widgets/my_information/custom_card_widget.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

const double width = 300.0;
const double height = 60.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class _ToggleButtonState extends State<ToggleButton> {
  late double xAlign;
  late Color loginColor;
  late Color signInColor;

  bool clicked = true;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Align to the top
        crossAxisAlignment: CrossAxisAlignment.start, // Center horizontally
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20, bottom: 10),
            child: Row(
              children: [
                Image.asset(AppIcons.documentsImage),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Required Documents",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xff315D80)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          alignment: Alignment(xAlign, 0),
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            width: width * 0.6,
                            height: height,
                            decoration: const BoxDecoration(
                              color: Color(0xFF3E6B8E),
                              borderRadius: BorderRadius.all(
                                Radius.circular(22.0),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              xAlign = loginAlign;
                              loginColor = selectedColor;
                              signInColor = normalColor;
                              personalInfo(); // Load personal info data
                            });
                          },
                          child: Align(
                            alignment: const Alignment(-1, 0),
                            child: Container(
                              width: width * 0.5,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text('Personal',
                                  style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w700,
                                    color: loginColor,
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              xAlign = signInAlign;
                              signInColor = selectedColor;
                              loginColor = normalColor;
                              corporateInfo();
                            });
                          },
                          child: Align(
                            alignment: const Alignment(1, 0),
                            child: Container(
                              width: width * 0.5,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text('Corporate',
                                  style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: signInColor,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          if (clicked) personalInfo() else corporateInfo()
        ],
      ),
    );
  }

  Widget personalInfo() {
    clicked = true;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomCardWidget(
            title: "Government ID 1",
            buttonLabel: "Verified",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFF91B290),
            // Light green background color
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Government ID 2",
            buttonLabel: "Upload",
            buttonIcon: Icons.upload,
            buttonColor: const Color(0xFFe54b60),
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Credit Report",
            buttonLabel: "Verified",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFF91B290),
            // Light green background color
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Employment Letter",
            buttonLabel: "Pending Verification",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFFf1d15b),
            width: MediaQuery.of(context).size.width * 0.15,
            // Light green background color
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Pay stub - 1",
            buttonLabel: "Verified",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFF91B290),
            // Light green background color
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Pay stub - 2",
            buttonLabel: "Verified",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFF91B290),
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Pay stub - 3",
            buttonLabel: "Verified",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFF91B290),
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Bank Statement - 1",
            buttonLabel: "Pending Verification",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFFf1d15b),
            width: MediaQuery.of(context).size.width * 0.15,
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Bank Statement - 2",
            buttonLabel: "Pending Verification",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFFf1d15b),
            width: MediaQuery.of(context).size.width * 0.15,
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Bank Statement - 3",
            buttonLabel: "Upload",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFF91B290),
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Vehicle Ownership",
            buttonLabel: "Upload",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFF91B290),
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget corporateInfo() {
    clicked = false;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomCardWidget(
            title: "Articles of Incorporation",
            buttonLabel: "Verified",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFF91B290),
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "HST Number",
            buttonLabel: "Upload",
            buttonIcon: Icons.upload,
            buttonColor: const Color(0xFFe54b60),
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Financial Statement - 1",
            buttonLabel: "Verified",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFF91B290),
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Financial Statement - 2",
            buttonLabel: "Pending Verification",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFFf1d15b),
            width: MediaQuery.of(context).size.width * 0.15,
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Bank Statement - 1",
            buttonLabel: "Pending Verification",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFFf1d15b),
            width: MediaQuery.of(context).size.width * 0.15,
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Bank Statement - 2",
            buttonLabel: "Pending Verification",
            buttonIcon: Icons.picture_as_pdf,
            buttonColor: const Color(0xFFf1d15b),
            width: MediaQuery.of(context).size.width * 0.15,
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
          CustomCardWidget(
            title: "Bank Statement - 3",
            buttonLabel: "Upload",
            buttonIcon: Icons.upload,
            buttonColor: const Color(0xFFe54b60),
            onTap: () {
              if (kDebugMode) {
                selectedFile();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    personalInfo();
  }

  selectedFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      if (kDebugMode) {
        print(file.path);
      }
    } else {
      // User canceled the picker
    }
  }
}
