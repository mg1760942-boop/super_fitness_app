import '../../../core/common/common_imports.dart';

class BaseScaffold extends StatelessWidget {
  final String backGroundPath;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;

  const BaseScaffold(
      {super.key,
      required this.backGroundPath,
      this.body,
      this.appBar,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backGroundPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
