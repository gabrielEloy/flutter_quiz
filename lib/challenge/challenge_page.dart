import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/progress_indicator/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  ChallengePage({required this.questions});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void handleNextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(86),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(),
                  ValueListenableBuilder(
                      valueListenable: controller.currentPageNotifier,
                      builder: (context, value, _) => QuestionIndicator(
                            currentPage: controller.currentPage,
                            pageCount: widget.questions.length,
                          ))
                ],
              ),
            )),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: widget.questions
              .map((q) =>
                  QuizWidget(question: q, handleNextPage: handleNextPage))
              .toList(),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ValueListenableBuilder(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (controller.currentPageNotifier.value !=
                            widget.questions.length)
                        Expanded(
                            child: NextButton.white(
                                onTap: () {
                                  handleNextPage();
                                },
                                label: 'Pular')),
                        if (controller.currentPageNotifier.value ==
                            widget.questions.length)
                          SizedBox(
                            width: 20,
                          ),
                        if (controller.currentPageNotifier.value ==
                            widget.questions.length)
                          Expanded(
                              child: NextButton.green(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  label: 'Finalizar')),
                      ],
                    )),
          ),
        ),
      ),
    );
  }
}
