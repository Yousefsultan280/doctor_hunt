import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/utils/app_colors.dart';

final List<String> doctorImages = [
  Assets.images.doc5.path,
  Assets.images.doc4.path,
  Assets.images.doc3.path,

];


final List<Color> categeoryColors = const [
  Color(0xff4D59D9),
  Color(0xff1BB894),
  Color(0xffFFB257),
  Color(0xffFF5156)
];

final List<IconData> categeoryIcons = const [
  Icons.medication,
  Icons.coronavirus_outlined,
  Icons.visibility,
  Icons.health_and_safety_outlined
];

final List<String> popularDoctors =  [
  Assets.images.doc1.path,
  Assets.images.doc2.path,
];

final List<Map<String, String>> featureDoctors =  [
  {
    'name': 'Dr. Crick',
    'rating': '3.7',
    'price': '\$ 25.00/ hours',
    'image':
    Assets.images.doc1.path,
  },
  {
    'name': 'Dr. Strain',
    'rating': '3.0',
    'price': '\$ 22.00/ hours',
    'image':
    Assets.images.doc2.path,
  },
  {
    'name': 'Dr. Lachinet',
    'rating': '2.9',
    'price': '\$ 29.00/ hours',
    'image':
    Assets.images.doc1.path,  },
  {
    'name': 'Dr. Strain',
    'rating': '3.0',
    'price': '\$ 22.00/ hours',
    'image':
    Assets.images.doc2.path,  },
];
