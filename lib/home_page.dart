// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:blood_donation_app/components.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size sSize = MediaQuery.of(context).size;

  final List<String> bloodGroup = <String>[
    'A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'Ab-',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
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
                                'Multajim Bin Kamal Fahim',
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
                      margin: EdgeInsets.symmetric(horizontal: mDefaultPadding),
                      padding: EdgeInsets.symmetric(horizontal: mDefaultPadding),
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 20,
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
              padding: EdgeInsets.symmetric(horizontal: mDefaultPadding),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 5),
                  Text(
                    'Finde Nearby Donars',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mDefaultPadding,
                vertical: mDefaultPadding,
              ),
              child: Container(
                height: sSize.height * 0.5,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: bloodGroup.length,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // height: 100, width: 100,
                      decoration: BoxDecoration(
                        color: lPrimaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          bloodGroup[index],
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),
          ]),
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
