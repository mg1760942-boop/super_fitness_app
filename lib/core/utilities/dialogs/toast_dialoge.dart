import 'package:fluttertoast/fluttertoast.dart';

import '../../common/common_imports.dart';
import '../style/app_colors.dart';

class ToastDialog  {

  static void show(String message , [Color color = AppColors.kRed]) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: AppColors.kWhiteBase,
      fontSize: 16.0,
    );
  }
}

