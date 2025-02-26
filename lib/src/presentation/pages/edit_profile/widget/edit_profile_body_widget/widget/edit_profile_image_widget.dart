import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/utilities/style/images/cached_network_image _widget.dart';
import '../../../../../managers/edit_profle/edit_profile_cubit.dart';


class EditProfileImageWidget extends StatelessWidget {
  const EditProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileViewModel=context.read<EditProfileCubit>();
    return  false
        ? Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[500]!,
      child: Container(
        width: 102.5.w,
        height: 102.5.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[400],
        ),
      ),
    )
        : CachedNetworkImageWidget(
      imageUrl: editProfileViewModel.appUserEntity.photo.toString(),
      width: 102.5.w,
      height: 102.5.h,
      fit: BoxFit.cover,
    );

  }
}
