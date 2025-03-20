import '../../../../../../core/common/common_imports.dart';
import 'item_popular_widget.dart';

class PopularListWidget extends StatelessWidget {
  const PopularListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 179.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
        return ItemPopularWidget();
      },
      itemCount: 4,
      ),
    );
  }
}
