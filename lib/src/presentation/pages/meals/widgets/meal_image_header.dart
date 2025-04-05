import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/app_icons.dart';
import '../../../../../core/utilities/style/images/cached_network_image _widget.dart';
import '../../../../../super_ditness_app.dart';

class MealImageHeader extends StatelessWidget {
  final double height;
  final String mealThumb;
  final String mealName;
  final String mealArea;

  const MealImageHeader({
    Key? key,
    required this.height,
    required this.mealThumb,
    required this.mealName,
    required this.mealArea,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        height: height,
        color: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImageWidget(
              imageUrl: mealThumb,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.50, 0.03),
                  end: const Alignment(0.50, 0.93),
                  colors: [
                    Colors.black.withOpacity(0),
                    const Color(0xFF242424)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: CircleAvatar(
                backgroundColor: const Color(0xFFFF4100),
                radius: 12,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    AppIcons.backIcon,
                    color: Colors.white,
                    width: 10,
                    height: 10,
                  ),
                  onPressed: () {
                    navKey.currentState!.pop();
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    mealArea,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
