import 'package:super_fitness_app/core/utilities/style/app_images.dart';

class CategoryModel {
  final int id;
  final String name;
  final String imge;

  CategoryModel({required this.id, required this.name, required this.imge});


  static List<CategoryModel> categories = [
    CategoryModel(id: 1, name: 'Gym', imge: AppImages.gym),
    CategoryModel(id: 2, name: 'Fitness', imge: AppImages.fitness),
    CategoryModel(id: 3, name: 'Yoga', imge: AppImages.yoga),
    CategoryModel(id: 4, name: 'Aerobics', imge:AppImages.aerocics),
    CategoryModel(id: 5, name: 'Trainer', imge: AppImages.trainer)
  ];
}