import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch_flutter_assessment/bloc/index.dart';
import 'package:munch_flutter_assessment/styles/index.dart';

class PinField extends StatefulWidget {
  const PinField({super.key});

  @override
  State<PinField> createState() => _PinFieldState();
}

class _PinFieldState extends State<PinField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 8,
        ),
        padding: const EdgeInsets.all(4),
        decoration: kInputFieldBoxDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomIcon(
                name: CustomIcons.iconPin,
                color: primaryColor,
                size: 30,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                child: const Text(
                  'Pin:',
                  style: kInput,
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(right: 8),
                child: BlocBuilder<UserBloc, UserState>(
                    builder: (userContext, userState) {
                  return BlocConsumer<PinBloc, PinState>(
                    listener: (pinContext, pinState) {
                      if (userState is UserSelectedState) {
                        if (pinState is PinCompleteState) {
                          String correctPin = userState.user.pin;
                          pinContext
                              .read<PinBloc>()
                              .add(PinValidateEvent(correctPin));
                        }
                      }
                    },
                    builder: (context, state) {
                      Color dotColour = primaryAccent;
                      if (state is PinValidState) {
                        dotColour = secondaryColor;
                      } else if (state is PinInvalidState) {
                        dotColour = errorColor;
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: state is PinEnteringState
                                    ? index < state.pin.length
                                        ? primaryColor
                                        : dotColour
                                    : dotColour,
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
