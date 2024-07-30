import 'package:cross_fit/core/utils/parsing_extension.dart';
import 'package:cross_fit/features/register/utils/register_utils.dart';
import 'package:cross_fit/features/register/presentation/pages/page_views/inbody_info_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../core/components/toast_message.dart';
import '../../../../core/routes/app_router.dart';
import '../../data/repositories/register_repository.dart';
import '../../utils/gender_model.dart';
import '../../utils/goal_model.dart';
import '../pages/page_views/choose_gender_view.dart';
import '../pages/page_views/training_goal_view.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final IRegisterRepository registerRepository;
  RegisterCubit({required this.registerRepository}) : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  final RoundedLoadingButtonController registerBtnController =
      RoundedLoadingButtonController();
  //TODO REGISTER FUNCTION
  void navigateToRegisterDetails(
      {required context, required RegisterCubit registerCubit}) async {
    if (RegisterForms.validateRegisterForm()) {
      if (await registerRepository
              .isEmailTaken(RegisterTextControllers.emailController.text) ==
          false) {
        registerBtnController.success();
        await Future.delayed(const Duration(seconds: 1), () {});
        Navigator.pushNamed(context, Routes.registerDetailsRoute,
            arguments: registerCubit);
        await resetRegisterBtn();
      } else {
        showToast('Email is not valid');
        registerBtnController.error();
        await resetRegisterBtn();
      }
    } else {
      registerBtnController.error();
      await resetRegisterBtn();
    }
  }

  Future<void> resetRegisterBtn() => Future.delayed(
        const Duration(milliseconds: 500),
        () {
          registerBtnController.reset();
        },
      );

  //TODO REGISTER DETAILS FUNCTIONS
  final PageController pageController = PageController();

  List<Widget> registerDetailsViews = const [
    ChooseGenderView(),
    TrainingGoalView(),
    InBodyInfoView(),
  ];

  void nextPage(context) async {
    if (currentPage == registerDetailsViews.length - 1) {
      if (RegisterForms.validateRegisterDetailsForm()) {
        confirmRegister(context);
      }
    } else {
      await pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
      emit(ChangePage());
    }
  }

  void confirmRegister(BuildContext context) async {
    context.loaderOverlay.show();

    final response = await registerRepository.registerWithEmailAndPassword(
      email: RegisterTextControllers.emailController.text,
      password: RegisterTextControllers.passwordController.text,
      age: RegisterTextControllers.ageController.text.toInt(),
      height: RegisterTextControllers.heightController.text.toDouble(),
      weight: RegisterTextControllers.heightController.text.toDouble(),
      gender: selectedGenderTitle,
      percentBodyFat:
          RegisterTextControllers.percentBodyFatController.text.toDouble(),
      muscleMass: RegisterTextControllers.muscleMassController.text.toDouble(),
      name: RegisterTextControllers.nameController.text,
      trainingGoal: selectedTrainingGoalTitle,
      bmi: RegisterTextControllers.bmiController.text.toDouble(),
      fatMass: RegisterTextControllers.fatMassController.text.toDouble(),
    );

    response.fold((l) {
      context.loaderOverlay.hide();
      showToast(l.message);
    }, (r) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.loadingHomeRoute, (route) => false);
      context.loaderOverlay.hide();
    });
  }

  int currentPage = 0;

  void changePage(int index) {
    currentPage = index;
  }

  void previousPage() async {
    await pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    emit(ChangePage());
  }

  //TODO SELECT TRAINING GOAL FUNCTIONS
  int selectedTrainingGoal = 0;
  String get selectedTrainingGoalTitle =>
      goals[selectedTrainingGoal].title.toString();
  void selectTrainingGoal(int index) {
    selectedTrainingGoal = index;
    emit(RegisterTrainingGoalSelected());
  }

  //TODO SELECT GENDER FUNCTIONS
  int selectedGender = 0;
  String get selectedGenderTitle => genders[selectedGender].title.toString();
  void selectGender(int index) {
    selectedGender = index;
    emit(RegisterGenderSelected());
  }
}
