import 'package:flutter/material.dart';

const Color firstColor = Color(0xFF2e7d32);
const Color secondColor = Color(0xFFA5D6A7);
const Color thirdColor = Color(0xFFA5D6A7);
const Color backgroundColor = Color(0xFFFAFAFA);
const BoxDecoration loginFieldsBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(20.0),
  ),
  color: Colors.white70,
);

const BoxDecoration loginGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [firstColor, secondColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);