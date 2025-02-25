import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/utilities/style/app_text_styles.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/utilities/style/app_images.dart';
import '../../shared/blured_container.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

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
              // Screen Title
              Center(
                child: Text(
                  context.localization.security,
                  style: AppTextStyles.font26BoldWhite,
                ),
              ),
              const SizedBox(height: 30),

              // Blurred Container with Security Details
              BluredContainer(
                radius: BorderRadius.circular(20),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Container wraps its content
                  children: [
                    Text(
                      context.localization.protectingYourSecurity,
                      style: AppTextStyles.font22BoldWhite,
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: Icon(Icons.lock_outline, color: Colors.white),
                      title: Text(
                        context.localization.endToEndEncryption,
                        style: AppTextStyles.font14RegularWhite,
                      ),
                      subtitle: Text(
                        context.localization.yourDataIsEncrypted,
                        style: AppTextStyles.font14RegularWhite,
                      ),
                    ),
                    const Divider(color: Colors.white24),
                    ListTile(
                      leading:
                          Icon(Icons.security_outlined, color: Colors.white),
                      title: Text(context.localization.multiLayerProtection,
                          style: AppTextStyles.font16RegularWhite),
                      subtitle: Text(
                        context.localization.advancedMeasures,
                        style: AppTextStyles.font14RegularWhite,
                      ),
                    ),
                    const Divider(color: Colors.white24),
                    ListTile(
                      leading: Icon(Icons.update_outlined, color: Colors.white),
                      title: Text(
                        context.localization.continuousUpdates,
                        style: AppTextStyles.font16RegularWhite,
                      ),
                      subtitle: Text(
                        context.localization.regularUpdates,
                        style: AppTextStyles.font14RegularWhite,
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
