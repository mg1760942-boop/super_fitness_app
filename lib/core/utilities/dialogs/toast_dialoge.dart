import 'package:fluttertoast/fluttertoast.dart';

import '../../common/common_imports.dart';
import '../style/app_colors.dart';

class ToastDialog  {

  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.kRed,
      textColor: AppColors.kWhiteBase,
      fontSize: 16.0,
    );
  }
}

