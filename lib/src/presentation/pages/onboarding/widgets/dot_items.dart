import 'package:flutter/material.dart';

class DotItems extends StatelessWidget {
  const DotItems({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: isActive ? 24 : 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFF4100) : const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
