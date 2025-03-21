import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import 'package:super_fitness_app/core/utilities/style/app_icons.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/src/presentation/pages/exercise/exercise_details.dart';

import '../../../../core/common/common_imports.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg",
          fit: BoxFit.cover,
          width: context.width,
          height: 300.h,
        ),
        Positioned(
          top: 40,
          left: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
                padding: EdgeInsets.all(6),
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                ),
                child: SvgPicture.asset(
                  AppIcons.backIcon,
                )),
          ),
        ),
        Positioned(
          bottom: 2,
          child: SizedBox(width: context.width, child: ExerciseDetails()),
        )
      ],
    );
  }
}
