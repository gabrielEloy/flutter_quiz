import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/progress_indicator/models/quiz_model.dart';
import 'package:devquiz/shared/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String answeredQuestions;
  final double completed;
  final VoidCallback onTap;
  const QuizCard({
    required this.title,
    required this.answeredQuestions,
    required this.completed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.fromBorderSide(
                BorderSide(color: AppColors.border),
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(AppImages.blocks),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(title, style: AppTextStyles.heading15),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child:
                          Text(answeredQuestions, style: AppTextStyles.body11),
                      flex: 2),
                  Expanded(
                      child: ProgressIndicatorWidget(value: completed), flex: 4)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
