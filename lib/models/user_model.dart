import 'package:flutter/material.dart';
import 'package:munch_flutter_assessment/styles/index.dart';

class User {
  final String firstName;
  final String lastName;
  final Color backgroundColour;
  final String pin;

  User({
    required this.firstName,
    required this.lastName,
    required this.backgroundColour,
    required this.pin,
  });
}

final List<User> userList = [
  User(
    firstName: 'Alan',
    lastName: 'Parker',
    backgroundColour: primaryColor,
    pin:'1111',
  ),
  User(
    firstName: 'Amy',
    lastName: 'May',
    backgroundColour: secondaryColor,
    pin:'2222',
  ),
  User(
    firstName: 'Ashton',
    lastName: 'Smith',
    backgroundColour: tertiaryColor,
    pin:'3333',
  ),
  User(
    firstName: 'Billy',
    lastName: 'Grimm',
    backgroundColour: warningColor,
    pin:'4444',
  ),
  User(
    firstName: 'Bob',
    lastName: 'Barker',
    backgroundColour: errorColor,
    pin:'5555',
  ),
  User(
    firstName: 'Calvin',
    lastName: 'Cole',
    backgroundColour: errorColor,
    pin:'6666',
  ),
  User(
    firstName: 'Chrissy',
    lastName: 'Houston',
    backgroundColour: errorColor,
    pin:'7777',
  ),
  User(
    firstName: 'Christian',
    lastName: 'Davids',
    backgroundColour: errorColor,
    pin:'8888',
  ),
  User(
    firstName: 'Colt',
    lastName: 'Cannon',
    backgroundColour: errorColor,
    pin:'9999',
  ),
];
