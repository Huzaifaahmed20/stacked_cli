import 'package:flutter/material.dart';
import 'HomeViewModel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text('Home'),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}