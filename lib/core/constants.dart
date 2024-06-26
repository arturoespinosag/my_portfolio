import 'package:flutter/material.dart';

const kMetallicTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  shadows: [
    BoxShadow(
      offset: Offset(1, 1),
      blurRadius: 2,
    ),
  ],
  fontWeight: FontWeight.bold,
);

const normalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.normal,
);

const loremIpsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do'
    ' eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut'
    ' enim ad minim veniam, quis nostrud exercitation ullamco laboris '
    'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
    'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla'
    ' pariatur. Excepteur sint occaecat cupidatat non proident, sunt in'
    ' culpa qui officia deserunt mollit anim id est laborum.';

const months = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

const monthsNumbers = <String>[
  '01',
  '02',
  '03',
  '04',
  '05',
  '06',
  '07',
  '08',
  '09',
  '10',
  '11',
  '12',
];
