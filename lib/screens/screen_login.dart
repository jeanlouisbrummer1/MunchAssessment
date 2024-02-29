import 'package:flutter/material.dart';
import 'package:munch_flutter_assessment/styles/index.dart';
import 'package:munch_flutter_assessment/widgets/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sectionTitle(),
          sectionHeading(),
          sectionFields(),
          sectionPinKeypad(),
        ],
      ),
    );
  }

  Widget sectionTitle() {
    return const TitleBar();
  }

  Widget sectionHeading() {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        left: 16,
        right: 32,
        bottom: 24,
      ),
      child: const Text(
        'Hi there lets get you logged in.',
        style: kHeading,
      ),
    );
  }

  Widget sectionFields() {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 24,
      ),
      child: const Column(
        children: [
          UserField(),
          PinField(),
        ],
      ),
    );
  }

  Widget sectionPinKeypad() {
    return Expanded(
      child: PinKeypad(),
    );
  }
}
