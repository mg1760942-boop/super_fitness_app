import '../../../../../core/common/common_imports.dart';

class TitleSubWidget extends StatelessWidget {
  const TitleSubWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      this.isPhysicalActivity = false});
  final String title;
  final String subtitle;
  final bool isPhysicalActivity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Baloo Thambi 2',
              fontWeight: FontWeight.w800,
              height: 1.40,
            ),
          ),
          const SizedBox(height: 8),
          // --- Subtitle
          Text(
            subtitle,
            style: !isPhysicalActivity
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Baloo Thambi 2',
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                  )
                : TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Baloo Thambi 2',
                    fontWeight: FontWeight.w800,
                    height: 1.40,
                  ),
          ),
        ],
      ),
    );
  }
}
