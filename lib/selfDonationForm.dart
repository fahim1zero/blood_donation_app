// ignore_for_file: file_names, deprecated_member_use, sized_box_for_whitespace
// ignore_for_file: prefer_const_constructors,
// ignore_for_file: constant_identifier_names,
// ignore_for_file: prefer_final_fields,
// ignore_for_file: unused_field,
// ignore_for_file: prefer_typing_uninitialized_variables,
// ignore_for_file: unnecessary_null_comparison,
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:blood_donation_app/components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SelfDonateForm extends StatefulWidget {
  const SelfDonateForm({Key? key}) : super(key: key);

  @override
  State<SelfDonateForm> createState() => _SelfDonateFormState();
}

class _SelfDonateFormState extends State<SelfDonateForm> {
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var locationController = TextEditingController();
  var phoneController = TextEditingController();
  var bloodGroupController = TextEditingController();
  var dateController = TextEditingController();
  var genderController = TextEditingController();
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Self Donaation form'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding,
          ),
          child: selfDonateForm(),
        ),
      ),
    );
  }

  Form selfDonateForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Patient Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: nameController,
            validator: (value) {
              if (value!.length >= 4) {
                return null;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 10),
          Container(
            height: 45,
            // color: Colors.amber,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Blood group'),
                  Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Location',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: locationController,
            validator: (value) {
              if (value!.length >= 4) {
                return null;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Date',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: dateController,
            validator: (value) {
              if (RegExp(
                      r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$|(?:(?:1[6-9]|[2-9]\d)?\d{2})(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\5(?:0?[1-9]|1\d|2[0-8])$|^(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(\/|-|\.)0?2\6(29)$|^(?:(?:1[6-9]|[2-9]\d)?\d{2})(?:(?:(\/|-|\.)(?:0?[1,3-9]|1[0-2])\8(?:29|30))|(?:(\/|-|\.)(?:0?[13578]|1[02])\9(?:31)))$")
                  .hasMatch(value!)) {
                return null;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Mobile No.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: phoneController,
            validator: (value) {
              if (value!.length == 11 &&
                  RegExp(r"^([01]|\+88)?\d{11}").hasMatch(value)) {
                return null;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                gapPadding: 20,
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: messageController,
          ),
          SizedBox(height: 10),
          Spacer(),
          FlatButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
              } else {
                Fluttertoast.showToast(msg: 'result', timeInSecForIosWeb: 1);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text('Donate Blood'),
              ],
            ),
            color: lPrimaryColor,
            height: 45,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}
