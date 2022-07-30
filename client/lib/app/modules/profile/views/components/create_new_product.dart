import 'package:flutter/material.dart';

class CreateNewProductScreen extends StatefulWidget {
  const CreateNewProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewProductScreen> createState() => _CreateNewProductScreenState();
}

class _CreateNewProductScreenState extends State<CreateNewProductScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Tittle'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 1')),
        ),
        const Step(
          title: Text('Description'),
          content: Text('Content for Step 2'),
        ),
        const Step(
          title: Text('Add Image'),
          content: Text('Content for Step 2'),
        ),
        const Step(
          title: Text('Choose Category'),
          content: Text('Content for Step 2'),
        ),
      ],
    );
  }
}
