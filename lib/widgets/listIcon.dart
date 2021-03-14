import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListIcon extends StatelessWidget {

  const ListIcon({
    Key key,
    this.size,
    this.textColor = const Color(0xFF757575),
    this.style = FlutterLogoStyle.markOnly,
    this.duration = const Duration(milliseconds: 750),
    this.curve = Curves.fastOutSlowIn,
  }) : assert(textColor != null),
        assert(style != null),
        assert(duration != null),
        assert(curve != null),
        super(key: key);


  final double size;
  final Color textColor;
  final FlutterLogoStyle style;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double iconSize = size ?? iconTheme.size;
    return AnimatedContainer(
      width: iconSize,
      height: iconSize,
      duration: duration,
      curve: curve,
      decoration: FlutterLogoDecoration(
        style: style,
        textColor: textColor,
      ),
    );
  }
}
