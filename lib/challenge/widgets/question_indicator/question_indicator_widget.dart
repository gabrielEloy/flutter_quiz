import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  const QuestionIndicator({
    required this.currentPage,
    required this.pageCount
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Questão $currentPage", style: AppTextStyles.body),
              Text("de $pageCount", style: AppTextStyles.body)
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: currentPage/pageCount),
        ],
      ),
    );
  }
}
