import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';

import '../../../../core/common/common_imports.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg",
          fit: BoxFit.cover,
          width: context.width,
          height: 250.h,
        ),
        Positioned(
          top: 40,
          left: 20,
          child: IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.kWhiteBase,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
