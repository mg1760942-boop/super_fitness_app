import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_images.dart';
import '../../shared/blured_container.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

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
                  context.localization.privacyPolicy,
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
                      context.localization.yourPrivacyMatters,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading:
                          Icon(Icons.privacy_tip_outlined, color: Colors.white),
                      title: Text(
                        context.localization.weAreCommitted,
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ),
                    const Divider(color: Colors.white24),
                    ListTile(
                      leading: Icon(Icons.policy_outlined, color: Colors.white),
                      title: Text(
                        context.localization.reviewOurPrivacy,
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ),
                    const Divider(color: Colors.white24),
                    ListTile(
                      leading:
                          Icon(Icons.security_outlined, color: Colors.white),
                      title: Text(
                        context.localization.yourDataSecurity,
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
