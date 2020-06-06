import 'package:flutter/material.dart';

class NavItemWidget extends StatelessWidget {
  final String text;
  final bool isActive;

  const NavItemWidget({Key key, @required this.text, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: isActive
                  ? Colors.blue
                  : Theme.of(context).textTheme.bodyText1.color),
        ),
      ),
    );
  }
}
