import 'package:flutter/material.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    this.label, {
    super.key,
    this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("Click1");
      },
      child: FocusableControlBuilder(
        onPressed: onPressed,
        builder: (_, control) {
          Color outlineColor =
              control.isFocused ? Colors.black : Colors.transparent;
          Color bgColor =
              control.isHovered ? Colors.blue.shade100 : Colors.grey.shade200;
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(color: outlineColor, width: 1),
            ),
            child: Text(label),
          );
        },
      ),
    );
  }
}
