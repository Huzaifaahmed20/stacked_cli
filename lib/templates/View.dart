const VIEW_TEMPLATE = """import 'package:flutter/material.dart';
import '{{CLASS_NAME}}ViewModel.dart';
import 'package:stacked/stacked.dart';

class {{CLASS_NAME}}View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<{{CLASS_NAME}}ViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text('{{CLASS_NAME}}'),
          ),
        );
      },
      viewModelBuilder: () => {{CLASS_NAME}}ViewModel(),
    );
  }
}""";
