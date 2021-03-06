//
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_import, deprecated_member_use, unused_field, prefer_final_fields, non_constant_identifier_names

import 'package:blood_donation_app/components.dart';
import 'package:blood_donation_app/requestForm.dart';
import 'package:blood_donation_app/selfDonationForm.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size sSize = MediaQuery.of(context).size;

  final List<PageRoute> _pageRoute = <PageRoute>[
    MaterialPageRoute(builder: (context) => BloodRequestForm()),
    MaterialPageRoute(builder: (context) => SelfDonateForm()),
  ];

  int _donationCounter = 1;
  int _lastDonate = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> bloodType = <String>[
    'Request Blood',
    'Donate Blood',
  ];
  final List<String> allDivition = <String>[
    'Barishal',
    'Chattogram',
    'Dhaka',
    'Khulna',
    'Rajshahi',
    'Rangpur',
    'Mymensingh',
    'Sylhet',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildAppBar(),
      body: homeBody(),
    );
  }

  SafeArea homeBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sSize.height * 0.25,
              child: Stack(
                children: [
                  Container(
                    height: sSize.height * 0.25 - 25,
                    width: sSize.width,
                    decoration: BoxDecoration(
                      color: lPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                'User Name',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Last Donate: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'Total Donate: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                color: Colors.black,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 5,
                            color: lPrimaryColor.withOpacity(0.25),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 5),
                  Text(
                    'Find Nearby Blood Bank',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 45,
              width: sSize.width,
              child: ListView.builder(
                itemCount: allDivition.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 20,
                      ),
                      child: Center(
                        child: Text(
                          allDivition[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(height: 20),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            //   child: Row(
            //     children: [
            //       // Expanded(child: Divider()),
            //       // SizedBox(width: 5),
            //       Text(
            //         'Request Blood',
            //         style: TextStyle(
            //           fontSize: 20,
            //         ),
            //       ),
            //       SizedBox(width: 5),
            //       Expanded(child: Divider()),
            //     ],
            //   ),
            // ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              child: Container(
                height: sSize.width / 2 - 22,
                // color: Colors.amber,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: bloodType.length,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            _pageRoute[index],
                          );
                        });
                      },
                      child: Container(
                        // height: 100, width: 100,
                        decoration: BoxDecoration(
                          color: lPrimaryColor,
                          shape: BoxShape.circle,
                          border: Border(
                            bottom: BorderSide(width: 5),
                            left: BorderSide(width: 5),
                            right: BorderSide(width: 5),
                            top: BorderSide(width: 5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            bloodType[index],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              // color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      // title: Text(
      //   'Blood Donar Family',
      //   style: TextStyle(
      //     fontSize: 25,
      //   ),
      // ),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
      ),
      elevation: 0,
    );
  }
}
