import 'package:cross_fit/features/crossfit_layout/presentation/manager/cross_fit_layout_cubit.dart';
import 'package:cross_fit/features/crossfit_layout/presentation/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_floating_action_button.dart';

class CrossFitLayout extends StatelessWidget {
  const CrossFitLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CrossFitLayoutCubit, CrossFitLayoutState>(
      builder: (context, state) {
        final cubit = CrossFitLayoutCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          bottomNavigationBar: const CustomNavigationBar(),
          body: cubit.screens[cubit.currentPage],
          floatingActionButton: const CustomFloatingActionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
