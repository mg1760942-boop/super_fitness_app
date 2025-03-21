import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/core/utilities/style/images/cached_network_image%20_widget.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../managers/explore/explore_cubit.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var exploreViewModel = context.read<ExploreCubit>();
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w,),
      child: Column(
        children: [
          ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                exploreViewModel.userEntity?.firstName ?? "User",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.40,
                ),
              ),
              subtitle: Text(
                "Good Morning",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Baloo Thambi 2',
                  fontWeight: FontWeight.w500,
                  height: 1.40,
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: CachedNetworkImageWidget(
                    imageUrl: exploreViewModel.userEntity?.photo ?? "", width: 36.w, height: 36.h),
              )),
        ],
      ),
    );
  }
}
