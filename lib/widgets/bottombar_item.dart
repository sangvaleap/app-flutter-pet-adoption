import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/theme/color.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(
    this.icon, {
    this.onTap,
    this.color = Colors.black,
    this.activeColor = AppColor.primary,
    this.isActive = false,
    this.isNotified = false,
  });

  final String icon;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isActive
                    ? AppColor.primary.withOpacity(.1)
                    : Colors.transparent,
              ),
              child: SvgPicture.asset(
                icon,
                color: isActive ? activeColor : color,
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
