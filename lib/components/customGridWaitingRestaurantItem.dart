import 'package:admin/components/CustomIconButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGridWaitingRestaurantItem extends StatelessWidget {

  final String imagePath;
  final String text;
  final VoidCallback acceptOnPressed;
  final VoidCallback rejectOnPressed;

  CustomGridWaitingRestaurantItem({required this.imagePath, required this.text, required this.acceptOnPressed, required this.rejectOnPressed});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
      footer: GridTileBar(
        title: Text(
          text,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black54,
        leading: CustomIconButton(
          icon: Icons.check,
          color: Colors.white,
          size: 18.0,
          onPressed: () {
            acceptOnPressed();
          },
        ),
        trailing: CustomIconButton(
          icon: Icons.clear,
          color: Colors.white,
          size: 18.0,
          onPressed: () {
            rejectOnPressed();
          },
        ),
      ),
    );
  }
}