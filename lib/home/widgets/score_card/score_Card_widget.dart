import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/widgets/round_chart/round_chart.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final int score;
  const ScoreCard({required this.score});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15)
        ) ,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:24.0),
          child: Row(
            children: [
              Expanded(
                  child: Center(
                    child: ChartWidget(score: score)
                  ),
                  flex: 1
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('Vamos começar', style: AppTextStyles.heading,),
                    Text('Complete os desafios e avance em conhecimento', style: AppTextStyles.body),
                  ]),
                ),
                flex: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
