import '../../../core/common/common_imports.dart';
import '../../../core/utilities/style/images/cached_network_image _widget.dart';

class BaseGridview<T> extends StatelessWidget {
  const BaseGridview({
    super.key,
    required this.items,
    required this.titleBuilder,
    required this.imageUrlBuilder,
  });

  final List<T>? items;
  final String Function(T?) titleBuilder;
  final String Function(T?) imageUrlBuilder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: items?.length,
        itemBuilder: (_, index) {
          final item = items?[index];
          final title = titleBuilder(item);
          final imageUrl = imageUrlBuilder(item);

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                // Background Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImageWidget(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                // Opacity Layer
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // Text on top
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
            ),
          );
        },
      ),
    );
  }
}
