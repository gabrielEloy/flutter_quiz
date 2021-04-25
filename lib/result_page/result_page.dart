import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int rightAnswers;
  const ResultPage({required this.title, 
  required this.rightAnswers,
  required this.length});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Image.asset(AppImages.trophy),
        Column(
          children: [
            Center(child: Text('Parabéns!', style: AppTextStyles.heading40)),
            SizedBox(height: 16),
            Text.rich(
              TextSpan(
                  text: 'Você concluiu',
                  style: AppTextStyles.body,
                  children: [
                    TextSpan(style: AppTextStyles.bodyBold, text: '\n$title'),
                    TextSpan(
                        style: AppTextStyles.body,
                        text: '\nCom $rightAnswers de $length acertos')
                  ]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: NextButton.purple(label: 'Compartilhar', onTap: () {
                    Share.share('Resultado do quiz: eu acertei $rightAnswers de $length perguntas!');
                  }),
                )),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64),
                    child: NextButton.white(
                        label: 'Voltar ao início',
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    ));
  }
}
