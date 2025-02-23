import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/src/presentation/managers/register/register_viewmodel.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../shared/blured_container.dart';
import '../../../../shared/custom_auth_button.dart';
import '../../../../shared/horizontal_number_picker_widget.dart';
import '../../widgets/circular_indicator_widget.dart';

class HeightSelectionWidget extends StatefulWidget {
  const HeightSelectionWidget({super.key});

  @override
  State<HeightSelectionWidget> createState() => _HeightSelectionWidgetState();
}

class _HeightSelectionWidgetState extends State<HeightSelectionWidget> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    var registerViewModel = context.read<RegisterViewModel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "what is your weight ?".toUpperCase(),
                style: AppFonts.font20KWightWeightW800Font,
              ),
              verticalSpace(16),
              Text(
                "This helps us create Your personalized plan ".toUpperCase(),
                style: AppFonts.font16KWightWeightW400Font,
              ),
            ],
          ),
        ),
        BluredContainer(
          radius: BorderRadius.all(Radius.circular(50)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HorizontalNumberPickerWidget(
                onChanged: (p0) {
                  setState(() {
                    registerViewModel.selectedHeight = p0;
                  });
                },
                selectedIndex: registerViewModel.selectedHeight,
                max: 300,
                titleText: "CM",
              ),
              verticalSpace(25),
              CustomAuthButton(
                text: "Next",
                onPressed: () => registerViewModel.goToGoalScreenNext(),
                color: Color(0xFFFF4100),
                textColor: Colors.white,
                radius: 20,
              ),
              verticalSpace(19),
            ],
          ),
        )
      ],
    );
  }
}
