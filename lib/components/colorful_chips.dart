import 'package:flutter/material.dart';

class ColorfulChip extends StatelessWidget {
  final String label;

  const ColorfulChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Color(((label.hashCode) & 0xFFFFFF) | 0xFF000000);
    return Chip(
      label: Text(label),
      backgroundColor: color,
      labelStyle: TextStyle(
        color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

class ColorfulActionChip extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ColorfulActionChip({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Color(
        ((label.hashCode - 5 /* randomness - */) & 0xFFFFFF) | 0xFF000000);
    return ActionChip(
      label: Text(label),
      backgroundColor: color,
      labelStyle: TextStyle(
        color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onPressed,
    );
  }
}
