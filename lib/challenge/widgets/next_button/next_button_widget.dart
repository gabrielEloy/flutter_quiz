import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  const NextButton({
    required this.label, 
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
    });


  NextButton.green({required String label, required VoidCallback onTap}):  
  this.backgroundColor = AppColors.darkGreen, 
  this.fontColor= AppColors.white, 
  this.borderColor= AppColors.green, 
  this.onTap = onTap,
  this.label = label;
  
  NextButton.white({required String label, required VoidCallback onTap}):  
  this.backgroundColor = AppColors.white, 
  this.fontColor= AppColors.grey, 
  this.borderColor= AppColors.lightGrey, 
  this.onTap = onTap,
  this.label = label;
  
  NextButton.purple({required String label, required VoidCallback onTap}):  
  this.backgroundColor = AppColors.purple, 
  this.fontColor= AppColors.white, 
  this.borderColor= AppColors.purple, 
  this.onTap = onTap,
  this.label = label;

  NextButton.transparent({required String label, required VoidCallback onTap}):  
  this.backgroundColor = AppColors.purple, 
  this.fontColor= AppColors.grey, 
  this.borderColor= AppColors.green, 
  this.onTap = onTap,
  this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              side: MaterialStateProperty.all(BorderSide(color: borderColor))
                ),
              
          onPressed: onTap,
          child: Text(
            label,
            style: GoogleFonts.notoSans(
                color: fontColor,
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
        ));
  }
}
