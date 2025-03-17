import '../../../core/common/common_imports.dart';
import '../../../core/utilities/style/images/cached_network_image _widget.dart';

class ItemImageExploreWidget extends StatelessWidget {
  final int index;
  final int width;
  final int height;
  final String imageUrl;
  final String title;
  final double position;
  const ItemImageExploreWidget({super.key, required this.index, required this.width, required this.height, required this.imageUrl, required this.title, required this.position});

  @override
  Widget build(BuildContext context) {
    return     Container(
      width: width.h,
      height: height.h,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          CachedNetworkImageWidget(
            width: width.h,
            height: width.h,
            imageUrl: imageUrl,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 0,
            top: position,
            child: Container(
              width: width.h,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Color(0x7F242424)),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                 // height: 1.20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
