import 'dart:ui';

import '../../../core/common/common_imports.dart';

class BluredContainer extends StatelessWidget {
  const BluredContainer(
      {super.key, required this.child, this.padding, this.radius,this.margin});

  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius? radius;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: radius ?? BorderRadius.zero,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: AnimatedContainer(
            padding: padding,
            margin: margin,
            color: const Color(0x19242424),
            duration: Duration(milliseconds: 3000),
            child: child,
          )),
    );
  }
}
