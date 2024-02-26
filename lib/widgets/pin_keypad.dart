import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch_flutter_assessment/bloc/index.dart';
import 'package:munch_flutter_assessment/styles/index.dart';

class PinKeypad extends StatelessWidget {
  const PinKeypad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (userContext, userState) {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        decoration: const BoxDecoration(
          color: whiteColour,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  buildNumberButton('1', userState),
                  horizontalDivider(),
                  buildNumberButton('2', userState),
                  horizontalDivider(),
                  buildNumberButton('3', userState),
                ],
              ),
            ),
            verticalDivider(),
            Expanded(
              child: Row(
                children: [
                  buildNumberButton('4', userState),
                  horizontalDivider(),
                  buildNumberButton('5', userState),
                  horizontalDivider(),
                  buildNumberButton('6', userState),
                ],
              ),
            ),
            verticalDivider(),
            Expanded(
              child: Row(
                children: [
                  buildNumberButton('7', userState),
                  horizontalDivider(),
                  buildNumberButton('8', userState),
                  horizontalDivider(),
                  buildNumberButton('9', userState),
                ],
              ),
            ),
            verticalDivider(),
            Expanded(
              child: Row(
                children: [
                  buildClearButton(userState),
                  horizontalDivider(),
                  buildNumberButton('0', userState),
                  horizontalDivider(),
                  buildBackspaceButton(userState),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildNumberButton(
    String number,
    UserState state,
  ) {
    return BlocBuilder<PinBloc, PinState>(builder: (pinContext, pinState) {
      return buildButton(
        child: Text(
          number,
          style: (state is UserSelectedState) ? kPinPad : kPinPadDisabled,
        ),
        onTap: (state is UserSelectedState)
            ? () {
                String pin = pinState.props.join();
                pinContext.read<PinBloc>().add(PinEnteredEvent(pin + number));
              }
            : () {},
      );
    });
  }

  Widget buildBackspaceButton(UserState state) {
    return BlocBuilder<PinBloc, PinState>(builder: (pinContext, pinState) {
      return buildButton(
        child: Icon(
          Icons.backspace_outlined,
          size: 18,
          color: (state is UserSelectedState) ? textColour : disabledColour,
        ),
        onTap: (state is UserSelectedState)
            ? () {
                String pin = pinState.props.join();
                pin = pin.isNotEmpty ? pin.substring(0, pin.length - 1) : '';
                pinContext.read<PinBloc>().add(PinEnteredEvent(pin));
              }
            : () {},
      );
    });
  }

  Widget buildClearButton(UserState state) {
    return BlocBuilder<PinBloc, PinState>(builder: (pinContext, pinState) {
      return buildButton(
        child: Text(
          'Clear',
          style: (state is UserSelectedState) ? kPinPadClear : kPinPadDisabled,
        ),
        onTap: (state is UserSelectedState)
            ? () {
                pinContext.read<PinBloc>().add(PinEnteredEvent(''));
              }
            : () {},
      );
    });
  }

  Widget buildButton({
    required void Function()? onTap,
    required Widget child,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }

  Widget horizontalDivider() {
    return Container(
      width: 1,
      color: containerColour,
    );
  }

  Widget verticalDivider() {
    return Container(
      height: 1,
      color: containerColour,
    );
  }
}
