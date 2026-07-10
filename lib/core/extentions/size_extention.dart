import 'package:flutter/material.dart';

///Basic size extentions for avoid repeatation of widgets and codes
///Freely use size.height , width, square
extension SizedBoxHelper on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());

  SizedBox get square => SizedBox(width: toDouble(), height: toDouble());
}
