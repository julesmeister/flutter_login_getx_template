import 'package:flutter/material.dart';
import 'package:flutter_login_getx_template/utils/constants.dart';

class BorderIcon extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;
  final VoidCallback onTap;

  const BorderIcon(
      {Key key,
      @required this.child,
      this.padding,
      this.width,
      this.height,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: OutlineButton(
        onPressed: onTap,
        child: Center(child: child),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: COLOR_WHITE,
        borderSide: BorderSide(
          width: 2,
          color: COLOR_GREY.withAlpha(40),
        ),
      ),
    );
  }
}
