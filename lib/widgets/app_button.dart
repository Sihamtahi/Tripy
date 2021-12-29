
import 'package:cubit_application/misc/colors.dart';
import 'package:flutter/cupertino.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;

    AppButtons({Key? key, required this.size, required this.color, required this.backgroundColor, required this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
           color: borderColor,
          width: 1.0
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
    );
  }
}
