import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch_flutter_assessment/bloc/index.dart';
import 'package:munch_flutter_assessment/styles/index.dart';

class UserField extends StatelessWidget {
  const UserField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectUser(context),
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
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomIcon(
                name: CustomIcons.iconUser,
                color: primaryColor,
                size: 30,
              ),
            ),
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  print('BLOC BUILDER: ${state}');
                  String selectedUser = 'Select an Employee';
                  if (state is UserSelectedState) {
                    selectedUser =
                        '${state.user.firstName} ${state.user.lastName}';
                  }
                  return Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      selectedUser,
                      style: kInput,
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: CustomIcon(
                name: CustomIcons.iconArrow,
                color: primaryColor,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectUser(BuildContext context) async {
    await Navigator.pushNamed(
      context,
      '/userList',
    );
  }
}
