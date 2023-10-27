import 'package:flutter/material.dart';

const AlignmentDirectional defaultaligment = AlignmentDirectional(3, -0.3);
Align CircularAligment({AlignmentDirectional aligment = defaultaligment}) {
  return Align(
    alignment: aligment,
    child: Container(
      height: 300,
      width: 300,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
    ),
  );
}

Align RectangularAligment() {
  return Align(
    alignment: const AlignmentDirectional(0, -1.2),
    child: Container(
      height: 300,
      width: 300,
      decoration:
          BoxDecoration(shape: BoxShape.rectangle, color: Colors.yellow[800]),
    ),
  );
}
