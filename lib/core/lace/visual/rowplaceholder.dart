import 'package:flutter/cupertino.dart';

class RowPlaceholder extends StatelessWidget {
  TextStyle? textStyle;
  final String placeholder;
  final String variable;

  RowPlaceholder(
      {this.textStyle, required this.placeholder, required this.variable});

  @override
  Widget build(BuildContext context) {
    textStyle ??= const TextStyle(
        color: Color(0xFF414141),
        fontWeight: FontWeight.bold,
      );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          placeholder,
          style: const TextStyle(
            color: Color(0xFF414141),
          ),
          textScaleFactor: 1.3,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          variable,
          style: const TextStyle(
            color: Color(0xFF414141),
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.4,
        ),
      ],
    );
  }
}
