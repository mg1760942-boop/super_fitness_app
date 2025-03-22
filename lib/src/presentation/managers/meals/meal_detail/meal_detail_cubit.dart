import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'meal_detail_state.dart';

class MealDetailCubit extends Cubit<MealDetailState> {
  MealDetailCubit() : super(MealDetailInitial());
}
