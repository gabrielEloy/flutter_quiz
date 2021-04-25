import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/progress_indicator/models/answer_model.dart';
import 'package:devquiz/shared/progress_indicator/models/question_model.dart';
import 'package:devquiz/shared/progress_indicator/models/quiz_model.dart';
import 'package:devquiz/shared/progress_indicator/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;
  
  //USER
  //QUIZZES
  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  Future<bool> getUser() async {
    await Future.delayed(Duration(seconds: 1));
    user = await repository.getUser();
    return true;
  }

  Future<bool> getQuizes() async {
    await Future.delayed(Duration(seconds: 1));
    quizzes = await repository.getQuizzes();
    return true;
  }


  void getInitialData() async{
    state = HomeState.loading;
    await this.getUser();
    await this.getQuizes();
    state = HomeState.success;
  }
}
