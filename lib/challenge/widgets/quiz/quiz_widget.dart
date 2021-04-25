import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/progress_indicator/models/answer_model.dart';
import 'package:devquiz/shared/progress_indicator/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback handleNextPage;
  const QuizWidget({required this.handleNextPage, required this.question});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;
  AnswerModel answers(int index) => widget.question.answers[index];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(height: 44,),
        Text(widget.question.title, style: AppTextStyles.heading),
        SizedBox(height: 24,),
        for (var i = 0; i < widget.question.answers.length; i++)
        AnswerWidget(
          answer: answers(i), 
          isSelected: i == selectedIndex,
          disabled: selectedIndex != -1,
          onTap: ()async{
            setState(() {
              selectedIndex = i;
            });
            await Future.delayed(Duration(milliseconds: 500));
            widget.handleNextPage();
          },
          )
      ],),
    );
  }
}