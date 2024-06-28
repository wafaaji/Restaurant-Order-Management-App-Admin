import 'package:admin/components/customContainer.dart';
import 'package:flutter/material.dart';

class CustomGridProfile extends StatelessWidget {

  final String name;
  final String email;
  final String phone;
  final String location;

  CustomGridProfile({required this.name, required this.email, required this.phone, required this.location});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            CustomContainer(
              margin: EdgeInsets.only(top: 0.0),
              iconData: Icons.person,
              text: name,
            ),
            CustomContainer(
              margin: EdgeInsets.only(top: 0.0),
              iconData: Icons.alternate_email,
              text: email,
            ),
            CustomContainer(
              margin: EdgeInsets.only(top: 0.0),
              iconData: Icons.phone,
              text: phone,
            ),
            CustomContainer(
              margin: EdgeInsets.only(top: 0.0),
              iconData: Icons.location_on_outlined,
              text: location,
            ),
          ],
        ),
      ),
    );
  }
}
