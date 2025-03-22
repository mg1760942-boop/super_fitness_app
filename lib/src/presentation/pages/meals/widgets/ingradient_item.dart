import '../../../../../core/common/common_imports.dart';

class IngredientItem extends StatelessWidget {
  final String ingredient;
  final String measure;

  const IngredientItem({
    Key? key,
    required this.ingredient,
    required this.measure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF2C2C2C)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              ingredient,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.40,
              ),
            ),
          ),
          Text(
            measure,
            style: const TextStyle(
              color: Color(0xFFFF4100),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.40,
            ),
          ),
        ],
      ),
    );
  }
}
