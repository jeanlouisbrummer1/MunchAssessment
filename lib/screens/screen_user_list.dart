import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munch_flutter_assessment/bloc/index.dart';
import 'package:munch_flutter_assessment/models/index.dart';
import 'package:munch_flutter_assessment/styles/index.dart';
import 'package:munch_flutter_assessment/widgets/index.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<User> users = userList;
    users.sort((a, b) => a.firstName.compareTo(b.firstName));
    List<String> groupedUserKeys = [];
    Map<String, List<User>> groupedUserList = {};
    for (var user in users) {
      String firstLetter = user.firstName[0].toUpperCase();
      if (!groupedUserList.containsKey(firstLetter)) {
        groupedUserKeys.add(firstLetter);
        groupedUserList[firstLetter] = [];
      }
      groupedUserList[firstLetter]!.add(user);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select an Employee'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        decoration: const BoxDecoration(
          color: containerColour,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: ListView.builder(
          itemCount: groupedUserKeys.length,
          itemBuilder: (context, index) {
            String groupKey = groupedUserKeys[index];
            return GroupUser(
              groupKey: groupKey,
              users: groupedUserList[groupKey]!,
            );
          },
        ),
      ),
    );
  }
}

class GroupUser extends StatelessWidget {
  String groupKey;
  List<User> users;

  GroupUser({
    Key? key,
    required this.groupKey,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              groupKey,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: groupingColour,
              ),
            ),
          ),
          Column(
            children: users.map(
              (user) {
                String firstName = user.firstName;
                String lastName = user.lastName;
                String initials =
                    firstName.substring(0, 1) + lastName.substring(0, 1);
                return ListTile(
                  title: Row(
                    children: [
                      Avatar(
                        initials: initials,
                        backgroundColour: user.backgroundColour,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Text(
                          '${user.firstName} ${user.lastName}',
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    context.read<UserBloc>().add(UserSelectEvent(user));
                    Navigator.pop(context, user);
                  },
                );
              },
            ).toList(),
          ),
        ],
      );
    });
  }
}
