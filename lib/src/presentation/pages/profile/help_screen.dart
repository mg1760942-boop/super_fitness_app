import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_images.dart';
import '../../shared/blured_container.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      backGroundPath: AppImages.baseBackGround,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  context.localization.helpSupport,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              BluredContainer(
                radius: BorderRadius.circular(20),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Ensure it wraps content
                  children: [
                    Text(
                      context.localization.howCanWeAssist,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: Icon(Icons.mail_outline, color: Colors.white),
                      title: Text(
                        '${context.localization.emailWithColon}support@example.com',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ),
                    const Divider(color: Colors.white24),
                    ListTile(
                      leading: Icon(Icons.phone_outlined, color: Colors.white),
                      title: Text(
                        '${context.localization.phoneWithColon}123-456-7890',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ),
                    const Divider(color: Colors.white24),
                    ListTile(
                      leading:
                          Icon(Icons.access_time_outlined, color: Colors.white),
                      title: Text(
                        context.localization.availableToAssistYou,
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
