import '../../../../../core/common/common_imports.dart';
import '../../../../../core/utilities/style/images/cached_network_image _widget.dart';

class RecommendationCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RecommendationCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImageWidget(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
          ),
        ),
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
