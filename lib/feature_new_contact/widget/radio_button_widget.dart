import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioButtonWidget extends StatefulWidget {
  final int value; // Unique value for each radio
  final int groupValue; // Current selected value
  final String title;
  final ValueChanged<int> onChanged; // Callback to parent

   RadioButtonWidget({
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
  });

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      child: Focus(
        onFocusChange: (focus) {
          setState(() {
            isFocused = focus;
          });
        },
        child: RadioListTile<int>(
          value: widget.value,
          groupValue: widget.groupValue,
          title: Text(
            widget.title,
            style: TextStyle(
              color: isFocused ? Colors.orangeAccent : Colors.black,
              fontWeight: isFocused ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          activeColor:
          isFocused ? Colors.orangeAccent : Colors.deepOrange, // focus color
          onChanged: (value) {
            if (value != null) widget.onChanged(value);
          },
        ),
      ),
    );
  }
}
