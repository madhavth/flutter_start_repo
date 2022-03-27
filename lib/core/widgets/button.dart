import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final String? title;
  final EdgeInsets? padding;
  final Decoration? decoration;
  final TextStyle? textStyle;

  const Button({
    Key? key,
    this.onPressed,
    this.title,
    this.padding,
    this.decoration,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: decoration ??
            BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).colorScheme.secondary,
            ),
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: textStyle ??
              TextStyle(
                color: Theme.of(context).textTheme.bodyText2!.color,
                fontSize: 18,
              ),
        ),
      ),
    );
  }
}
