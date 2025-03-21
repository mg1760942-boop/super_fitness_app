import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness_app/config/routes/page_route_name.dart';
import 'package:super_fitness_app/core/extensions/extensions.dart';
import 'package:super_fitness_app/core/helpers/validations.dart';
import 'package:super_fitness_app/core/utilities/dialogs/awesome_dialoge.dart';
import 'package:super_fitness_app/core/utilities/style/app_icons.dart';
import 'package:super_fitness_app/core/utilities/style/app_images.dart';
import 'package:super_fitness_app/src/presentation/managers/login/login_viewmodel.dart';
import 'package:super_fitness_app/src/presentation/pages/login/widgets/auth_decission_row.dart';
import 'package:super_fitness_app/src/presentation/pages/login/widgets/or_row.dart';
import 'package:super_fitness_app/src/presentation/shared/base_scaffold.dart';
import 'package:super_fitness_app/src/presentation/shared/blured_container.dart';
import 'package:super_fitness_app/src/presentation/shared/custom_auth_button.dart';
import 'package:super_fitness_app/super_ditness_app.dart';

import '../../../../core/common/common_imports.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utilities/dialogs/loading_dialog.dart';
import '../../../../core/utilities/style/spacing.dart';
import '../../../data/api/core/errors/error_handler.dart';
import '../../shared/custom_auth_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = true;
  LoginViewmodel loginViewmodel = getIt<LoginViewmodel>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return BaseScaffold(
      backGroundPath: AppImages.backgroundScafSec,
      body: BlocProvider(
        create: (context) => loginViewmodel,
        child: SafeArea(
          child: BlocConsumer<LoginViewmodel, LoginState>(
            listener: (context, state) {
              switch (state) {
                case LoginLoadingState():
                  LoadingDialog.show(context);
                case LoginErrorState():
                  LoadingDialog.hide(context);
                  var errorMessage = ErrorHandler.fromException(
                          state.exception, context.localization)
                      .errorMessage;
                  showAwesomeDialog(context,
                      title: context.localization.error,
                      desc: errorMessage,
                      onOk: () {},
                      dialogType: DialogType.error);
                case LoginSuccessState():
                  LoadingDialog.hide(context);
                  Navigator.pushNamed(context, PageRoutesName.sectionScreen);

                default:
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                          width: 70,
                          height: 48,
                          child: Image.asset(AppImages.appLogo)),
                    ),
                    SizedBox(height: height * 0.15),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.localization.heyThere,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Baloo Thambi 2',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                          Text(
                            context.localization.welcomeBack,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Baloo Thambi 2',
                              fontWeight: FontWeight.w800,
                              height: 1.40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(8),
                    BluredContainer(
                        radius: BorderRadius.all(Radius.circular(50)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: loginViewmodel.formKey,
                            onChanged: () {
                              loginViewmodel.validateFields();
                            },
                            child: Column(
                              children: [
                                Text(context.localization.login,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Baloo Thambi 2',
                                      fontWeight: FontWeight.w800,
                                      height: 1.40,
                                    )),
                                verticalSpace(16),
                
                                CustomTextFormField(
                                  labelText: context.localization.email,
                                  hintText: context.localization.email,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: loginViewmodel.emailController,
                                  validator: (value) {
                                    return Validations.validateEmail(value);
                                  },
                                  prefixIcon: AppIcons.emailIcon,
                                ),
                
                                // Outline border with rounded corners
                
                                verticalSpace(16),
                                CustomTextFormField(
                                  isPasswordVisible: passwordVisible,
                                  showPassword: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                  hintText: context.localization.password,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: loginViewmodel.passwordController,
                                  labelText: context.localization.password,
                                  validator: (val) {
                                    return Validations.validatePassword(val);
                                  },
                                  prefixIcon: AppIcons.passwordIcon,
                                ),
                                verticalSpace(8),
                                InkWell(
                                  onTap: () {
                                    navKey.currentState!
                                        .pushNamed(PageRoutesName.forgetPassword);
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      context.localization.forgotPassword,
                                      style: TextStyle(
                                        color: Color(0xFFFF4100),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(
                                            0xFFFF4100), // Explicitly set underline color
                                        height: 1.40,
                                      ),
                                    ),
                                  ),
                                ),
                                verticalSpace(24),
                                OrRowWidget(),
                                verticalSpace(24),
                                CustomAuthButton(
                                  text: context.localization.login,
                                  onPressed: () {
                                    loginViewmodel.login();
                                  },
                                  color: Color(0xFFFF4100),
                                  textColor: Colors.white,
                                  radius: 20,
                                ),
                                verticalSpace(8),
                                AuthDecissionRow(
                                    text: context.localization.register,
                                    onPressed: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        PageRoutesName.register,
                                        (route) => false,
                                      );
                                    },
                                    prefixText: context
                                        .localization.dontHaveAnAccountRegister),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
