import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGridRejectRestaurantItem extends StatelessWidget {

  final String imagePath;
  final String text;

  CustomGridRejectRestaurantItem({required this.imagePath, required this.text});

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
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black54,
      ),
    );
  }
}
