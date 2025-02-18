import '../../../../../core/common/common_imports.dart';

class AuthDecissionRow extends StatelessWidget {
  const AuthDecissionRow(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.prefixText});
  final String? text;
  final void Function()? onPressed;
  final String prefixText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: prefixText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Baloo Thambi 2',
                fontWeight: FontWeight.w400,
                height: 1.40,
              ),
            ),
            TextSpan(
              text: text,
              style: TextStyle(
                color: Color(0xFFFF6A00),
                fontSize: 14,
                fontFamily: 'Baloo Thambi 2',
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline,
                decorationColor:
                    Color(0xFFFF6A00), // Explicitly set underline color
                height: 1.40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
