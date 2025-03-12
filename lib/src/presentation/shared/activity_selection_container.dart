import 'package:super_fitness_app/src/presentation/shared/radio_tile_item.dart';

import '../../../core/common/common_imports.dart';
import '../../../core/utilities/style/spacing.dart';
import 'blured_container.dart';
import 'custom_auth_button.dart';

class ActivitySelectionContainer extends StatelessWidget {
  final List<String> activity ;
  final String selectedItem;
  final Function(String) onChanged;
  final void Function(String value) onSelected;
  final void Function()? onPressedButton;

  const ActivitySelectionContainer({super.key, required this.activity, required this.selectedItem, required this.onChanged, required this.onSelected, this.onPressedButton});

  @override
  Widget build(BuildContext context) {
    return   BluredContainer(
      radius: BorderRadius.circular(50),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        children: [
          ...activity.map((e) {
            return RadioTileItem(
              goal:e,
              selectedGoal:selectedItem,
              onSelected: (){
                onSelected( e);
              },
              onChanged: onChanged,
            );
          },)    ,

          verticalSpace(24),
          CustomAuthButton(
              text: 'Done',
              onPressed: onPressedButton,
              color: Color(0xFFFF4100),
              radius: 50),
        ],
      ),
    );

  }
}
