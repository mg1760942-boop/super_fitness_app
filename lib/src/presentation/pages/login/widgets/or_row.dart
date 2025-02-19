import 'package:super_fitness_app/core/extensions/extensions.dart';

import '../../../../../core/common/common_imports.dart';

class OrRowWidget extends StatelessWidget {
  const OrRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container()),
        Expanded(
          flex: 2,
          child: Divider(
            color: Colors.white,
            thickness: 1.2,
            endIndent: 10,
          ),
        ),
        Text(
          context.localization.or,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFD3D3D3),
            fontSize: 14,
            fontFamily: 'Baloo Thambi 2',
            fontWeight: FontWeight.w400,
            height: 1.40,
          ),
        ),
        Expanded(
          flex: 2,
          child: Divider(
            color: Colors.white,
            thickness: 1.2,
            indent: 10,
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
