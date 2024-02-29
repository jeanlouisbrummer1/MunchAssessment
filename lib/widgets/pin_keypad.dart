import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch_flutter_assessment/bloc/index.dart';
import 'package:munch_flutter_assessment/styles/index.dart';

enum ButtonTypeEnum {
  number,
  clear,
  backspace,
}

class PinKeypad extends StatelessWidget {
  PinKeypad({super.key});

  final List<List<String>> pinMap = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['clear', '0', '']
  ];

  @override
  Widget build(BuildContext context) {
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
      child: keyPadButtons(),
    );
  }

  Widget keyPadButtons() {
    return Column(
      children: List.generate(4, (rowIndex) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: rowIndex == 0 || rowIndex == 1 || rowIndex == 2
                  ? const Border(
                      bottom: BorderSide(
                        color: containerColour,
                        width: 1.0,
                      ),
                    )
                  : const Border(),
            ),
            child: Row(
              children: List.generate(3, (columnIndex) {
                String value = pinMap[rowIndex][columnIndex];
                ButtonTypeEnum buttonTypeEnum = ButtonTypeEnum.number;
                if (rowIndex == 3 && columnIndex == 0) {
                  buttonTypeEnum = ButtonTypeEnum.clear;
                } else if (rowIndex == 3 && columnIndex == 2) {
                  buttonTypeEnum = ButtonTypeEnum.backspace;
                }
                return BlocBuilder<UserBloc, UserState>(
                    builder: (userContext, userState) {
                  return BlocBuilder<PinBloc, PinState>(
                      builder: (pinContext, pinState) {
                    return Expanded(
                      child: InkWell(
                        onTap: () {
                          if (userState is UserInitialState) {
                            return;
                          }
                          String pin = '';
                          if (buttonTypeEnum != ButtonTypeEnum.clear) {
                            pin = pinState.props.join();
                            if (buttonTypeEnum == ButtonTypeEnum.number) {
                              pin = pin + value;
                            }
                            if (buttonTypeEnum == ButtonTypeEnum.backspace) {
                              pin = pin.isNotEmpty
                                  ? pin.substring(0, pin.length - 1)
                                  : '';
                            }
                          }
                          pinContext.read<PinBloc>().add(PinEnteredEvent(pin));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: columnIndex == 1
                                ? const Border(
                                    left: BorderSide(
                                      color: containerColour,
                                      width: 1.0,
                                    ),
                                    right: BorderSide(
                                      color: containerColour,
                                      width: 1.0,
                                    ),
                                  )
                                : const Border(),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: (buttonTypeEnum == ButtonTypeEnum.backspace)
                              ? CustomIcon(
                                  name: CustomIcons.iconBackspace,
                                  size: 22,
                                  color: (userState is UserSelectedState)
                                      ? textColour
                                      : disabledColour,
                                )
                              : Text(
                                  (buttonTypeEnum == ButtonTypeEnum.clear)
                                      ? 'Clear'
                                      : value,
                                  style: (userState is UserSelectedState)
                                      ? (buttonTypeEnum == ButtonTypeEnum.clear)
                                          ? kPinPadClear
                                          : kPinPad
                                      : kPinPadDisabled,
                                ),
                        ),
                      ),
                    );
                  });
                });
              }),
            ),
          ),
        );
      }),
    );
  }
}
