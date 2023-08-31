import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onTapIcon,
    required this.selectedColor,
    required this.unSelectedColor,
  });
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTapIcon;
  final Color selectedColor;
  final Color unSelectedColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icons.length,
          (index) => Expanded(
            child: IconButton(
              onPressed: () {
                if (selectedIndex != index) {
                  onTapIcon(index);
                }
              },
              padding: const EdgeInsets.all(0),
              iconSize: 25.r,
              icon: Icon(
                icons[index],
                color: index == selectedIndex ? selectedColor : unSelectedColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
