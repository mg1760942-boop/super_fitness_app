import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/src/domain/entities/workouts/muscle_entity.dart';
import 'package:super_fitness_app/src/presentation/managers/workouts/workouts_screen_view_model.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_colors.dart';

class WorkoutsGripViewItem extends StatelessWidget {
  final MusclesEntity musclesEntity;

  const WorkoutsGripViewItem({super.key, required this.musclesEntity});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<WorkoutsScreenViewModel>();
    return FadeIn(
      child: Container(
        margin: REdgeInsets.only(right: 18,bottom: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CachedNetworkImage(
                imageUrl: musclesEntity.image??"",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                color: Colors.black.withOpacity(0.5),
                child: Text(
                  musclesEntity.name??"",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font16w700.copyWith(
                    color: AppColors.kWhiteBase,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
