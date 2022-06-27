import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color enabledColor;
  final Color disabledColor;
  final Color textColor;
  final String text;
  final Function()? onPressed;

  const RoundedButton(
      {Key? key,
      required this.enabledColor,
      required this.disabledColor,
      required this.textColor,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                text,
                style: Themes.mainTheme(context).textTheme.subtitle1,
              ),
            ),
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((state) {
                return state.contains(MaterialState.disabled)
                    ? disabledColor
                    : enabledColor;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              )))),
    );
  }
}