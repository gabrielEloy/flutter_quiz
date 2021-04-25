import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final int score;
  const ChartWidget({required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 70,
        width: 70,
        child: Stack(
          children: [
            Container(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: score/100,
                backgroundColor: AppColors.chartSecondary,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
            Center(
              child: Text(
                '$score%',
                style: AppTextStyles.heading,
              ),
            )
          ],
        ),
      ),
    );
  }
}
