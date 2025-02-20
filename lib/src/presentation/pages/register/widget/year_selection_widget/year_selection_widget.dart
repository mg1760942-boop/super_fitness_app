import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/src/presentation/managers/register/register_viewmodel.dart';

import '../../../../../../core/common/common_imports.dart';
import '../../../../../../core/utilities/style/app_fonts.dart';
import '../../../../../../core/utilities/style/spacing.dart';
import '../../../../shared/blured_container.dart';
import '../../../../shared/custom_auth_button.dart';
import '../../../../shared/horizontal_number_picker_widget.dart';
import '../../widgets/circular_indicator_widget.dart';

class YearSelectionWidget extends StatefulWidget {
  const YearSelectionWidget({super.key});

  @override
  State<YearSelectionWidget> createState() => _YearSelectionWidgetState();
}

class _YearSelectionWidgetState extends State<YearSelectionWidget> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    var registerViewModel=context.watch<RegisterViewModel>();
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "HOW OLD ARE YOU?",
                style: AppFonts.font20KWightWeightW800Font,
              ),
              verticalSpace(16),
              Text(
                "this helps us create Your personalized plan",
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
                onChanged: (value) {
                  setState(() {
                    registerViewModel.selectedYear=value;
                  });
                },
                selectedIndex: registerViewModel.selectedYear,max: 100,titleText: "Year",),
              verticalSpace(25),
              CustomAuthButton(
                text: "Next",
                onPressed: () => registerViewModel.goToOWeightScreenNext(),
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
