import 'package:flutter/material.dart';

class DismissibleToastWidget extends StatelessWidget {
  const DismissibleToastWidget({
    @required this.widget,
    @required this.gravity,
    Key key,
  }) : super(key: key);

  final Widget widget;
  final int gravity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: gravity == 2 ? 50 : null,
      bottom: gravity == 0 ? 50 : null,
      child: Material(
        color: Colors.transparent,
        child: widget,
      ),
    );
  }
}
