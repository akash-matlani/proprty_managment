import 'package:flutter/material.dart';
import 'package:proprty_managment/icons.dart';
import 'package:proprty_managment/widgets/my_information/custom_text_field_widget.dart';
import 'package:proprty_managment/widgets/my_information/tab_widget.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  final borderSide = const BorderSide(color: Colors.white, width: 2);

  final List<String> imageUrls = [
    'https://via.placeholder.com/600x400.png?text=Image+1',
    'https://via.placeholder.com/600x400.png?text=Image+2',
    'https://via.placeholder.com/600x400.png?text=Image+3',
    'https://via.placeholder.com/600x400.png?text=Image+4',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color(0xFFF0F4F8),
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Row(
                children: [
                  Image.asset(AppIcons.appBarImage),
                  const Spacer(),
                  const Text("My Information",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          color: Color(0xffEEF4FF))),
                  const Spacer(),
                  const Icon(
                    Icons.notification_add,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            //appBar: CustomAppBar(),
            body: Container(
              margin: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // Background Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            AppIcons.backgroundImage,
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 16,
                          right: 16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(imageUrls.length, (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        imageUrls[index],
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 2,
                                      right: 2,
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    // Name and Nickname Container
                    Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                      transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        color: const Color(0xff315D804D),
                        border: Border(
                          left: borderSide,
                          right: borderSide,
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 8.0, top: 10),
                              child: Text('Mae Coleman',
                                  style: TextStyle(
                                    fontFamily: 'Helvetica', // or 'CustomFont'
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ))),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Nickname',
                                style: TextStyle(
                                    fontFamily: 'Helvetica', // or 'CustomFont'
                                    color: Color(0xff6B5E7B))),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shadowColor: const Color(0xff315D80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Similar to rounded corners in the image
                      ),
                      child: Card(
                        elevation: 10,
                        color: const Color(0xffedf2fa),
                        shadowColor: Colors.blue.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Similar to rounded corners in the image
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 20, bottom: 10),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Image.asset(AppIcons.documentsImage),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text("My Information",
                                          style: TextStyle(
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20.0,
                                              color: Color(0xFF315D80))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            basicInfoExpansionTile(),
                            const SizedBox(
                              height: 10,
                            ),
                            employmentExpansionTile(),
                            const SizedBox(
                              height: 10,
                            ),
                            currentAddressExpansionTile(),
                            const SizedBox(
                              height: 10,
                            ),
                            referenceExpansionTile(),
                            const SizedBox(
                              height: 10,
                            ),
                            emergencyContactExpansionTile(),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                        elevation: 10,
                        shadowColor: const Color(0xff315D80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Similar to rounded corners in the image
                        ),
                        child: Card(
                          elevation: 20,
                          color: const Color(0xffedf2fa),
                          shadowColor: Colors.blue.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Similar to rounded corners in the image
                          ),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.70,
                              width: MediaQuery.of(context).size.width,
                              child: const ToggleButton()),
                        ))
                  ],
                ),
              ),
            )));
  }

  Widget basicInfoExpansionTile() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: RoundedExpansionTile(
        tileColor: const Color(0xFFC9D7E5),
        trailing: const Icon(Icons.arrow_drop_down),
        leading: Container(
          height: 20,
          width: 10,
          decoration: const BoxDecoration(
            color: Color(0xffF1D15B),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Text("Basic Information",
                style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: Color(0xFF315D80))),
            const Spacer(),
            Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xFF94b4d0),
                  // Background color for the container
                  borderRadius: BorderRadius.circular(20),
                  // Rounded corners with a radius of 20
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(
                          0.5), // Shadow color/ Horizontal and Vertical offset of the shadow
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.edit,
                  size: 12,
                  color: Colors.white,
                )),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Row(
              children: [
                const Text("First Name Legal*",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                        color: Color(0xFF315D80))),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.17,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Enter your name',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Row(
              children: [
                const Text("Last Name Legal*",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                        color: Color(0xFF315D80))),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.17,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Enter your Last Name',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Row(
              children: [
                const Text("Gender",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                        color: Color(0xFF315D80))),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.17,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Select your Gender',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Row(
              children: [
                const Text("Phone Number*",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                        color: Color(0xFF315D80))),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.17,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Enter your Number',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Row(
              children: [
                const Text("Email",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                        color: Color(0xFF315D80))),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.17,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Enter your Email',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Row(
              children: [
                const Text("Credit Score",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                        color: Color(0xFF315D80))),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.17,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Enter your Credit Score',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Row(
              children: [
                const Text("Government ID",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                        color: Color(0xFF315D80))),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.17,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Enter your Government ID',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: const Text("Social Insurance Number",
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                ),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.17,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: ' Social Insurance Number',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF315D80)),
                child: TextButton(
                    onPressed: () {},
                    child: const Text("Save",
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Colors.white)))),
          )
        ],
      ),
    );
  }

  Widget employmentExpansionTile() {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: RoundedExpansionTile(
          tileColor: const Color(0xFFC9D7E5),
          trailing: const Icon(Icons.arrow_drop_down),
          leading: Container(
            height: 18,
            width: 10,
            decoration: const BoxDecoration(
              color: Color(0xff9BB997),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              const Text("Employment",
                  style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                      color: Color(0xFF315D80))),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF94b4d0),
                    // Background color for the container
                    borderRadius: BorderRadius.circular(20),
                    // Rounded corners with a radius of 20
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(
                            0.5), // Shadow color/ Horizontal and Vertical offset of the shadow
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 12,
                    color: Colors.white,
                  )),
            ],
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("occupation*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Your Occupation',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Annual income*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Annual Income',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Employer",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Employer',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Position*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Position',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Manager’s Name",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Manager’s Name',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Manager’s PH No",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Manager’s PH No',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Manager’s Email",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Manager’s Email',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF315D80)),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Colors.white),
                      ))),
            )
          ],
        ));
  }

  Widget currentAddressExpansionTile() {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: RoundedExpansionTile(
          tileColor: const Color(0xFFC9D7E5),
          trailing: const Icon(Icons.arrow_drop_down),
          leading: Container(
            height: 18,
            width: 10,
            decoration: const BoxDecoration(
              color: Color(0xffC06A87),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              const Text(
                "Current Address",
                style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: Color(0xFF315D80)),
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF94b4d0),
                    // Background color for the container
                    borderRadius: BorderRadius.circular(20),
                    // Rounded corners with a radius of 20
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(
                            0.5), // Shadow color/ Horizontal and Vertical offset of the shadow
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 12,
                    color: Colors.white,
                  )),
            ],
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text(
                    "Status",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                        color: Color(0xFF315D80)),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Status',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Address",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Address',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("City",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter City',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Postal Code",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Postal Code',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Country",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Code',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Province",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Province',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Bedrooms",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Bedrooms',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Bathrooms",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Bathrooms',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Monthly Rent",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Monthly Rent',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Utilities",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Utilities',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Occupying Since",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Occupying Since',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Landlord name",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Landlord Name',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Phone Number",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Phone Number',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Row(
                children: [
                  const Text("Email Address",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Email Address',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF315D80)),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text("Save",
                          style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                              color: Colors.white)))),
            )
            //
          ],
        ));
  }

  Widget referenceExpansionTile() {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: RoundedExpansionTile(
          tileColor: const Color(0xFFC9D7E5),
          trailing: const Icon(Icons.arrow_drop_down),
          leading: Container(
            height: 18,
            width: 10,
            decoration: const BoxDecoration(
              color: Color(0xffFFB6A3),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              const Text(
                "References",
                style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: Color(0xFF315D80)),
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF94b4d0),
                    // Background color for the container
                    borderRadius: BorderRadius.circular(20),
                    // Rounded corners with a radius of 20
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(
                            0.5), // Shadow color/ Horizontal and Vertical offset of the shadow
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 12,
                    color: Colors.white,
                  )),
            ],
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("Relationship",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Enter Relationship',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                  children: [
                    const Text("Relationship Length",
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Color(0xFF315D80))),
                    const Spacer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.17,
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: CustomTextField(
                        controller: TextEditingController(),
                        hintText: 'Relationship Length',
                      ),
                    )
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("First Name*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'First Name',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("Last Name*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Last Name',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("Phone No*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Phone Number',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("Email*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Email',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF315D80)),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Colors.white),
                      ))),
            )
          ],
        ));
  }

  Widget emergencyContactExpansionTile() {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: RoundedExpansionTile(
          tileColor: const Color(0xFFC9D7E5),
          trailing: const Icon(Icons.arrow_drop_down),
          leading: Container(
            height: 18,
            width: 10,
            decoration: const BoxDecoration(
              color: Color(0xffEA4B62),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              const Text(
                "Emergency Contact",
                style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: Color(0xFF315D80)),
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF94b4d0),
                    // Background color for the container
                    borderRadius: BorderRadius.circular(20),
                    // Rounded corners with a radius of 20
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(
                            0.5), // Shadow color/ Horizontal and Vertical offset of the shadow
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 12,
                    color: Colors.white,
                  )),
            ],
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("Relationship",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Relationship',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("Relationship Length",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Relationship Length',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("First Name*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'First Name',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("Last Name*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Last Name',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("Phone No*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Phone No',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  const Text("Email*",
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Color(0xFF315D80))),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.17,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Email',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF315D80)),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Colors.white),
                      ))),
            )
          ],
        ));
  }
}
