import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_fitness_app/core/utilities/style/app_colors.dart';
import '../../../../../../../core/common/common_imports.dart';
import '../../../../../../../core/utilities/style/app_images.dart';
import '../../../../../../../core/utilities/style/images/cached_network_image _widget.dart';
import '../../../../../managers/edit_profle/edit_profile_cubit.dart';
import '../../../../../managers/edit_profle/edit_profle_action.dart';

class EditProfileImageWidget extends StatefulWidget {
  const EditProfileImageWidget({super.key});

  @override
  State<EditProfileImageWidget> createState() => _EditProfileImageWidgetState();
}

class _EditProfileImageWidgetState extends State<EditProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    var editProfileViewModel = context.read<EditProfileCubit>();
    return Stack(
      alignment: Alignment.center,
      children: [
        BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            if (editProfileViewModel.isShowSuccessImage &&
                editProfileViewModel.image != null) {
              return Image.file(
                editProfileViewModel.image!,
                width: 102.5.w,
                height: 102.5.h,
                fit: BoxFit.cover,
              );
            } else if (editProfileViewModel.appUserEntity.photo != null) {
              return CachedNetworkImageWidget(
                  imageUrl: editProfileViewModel.appUserEntity.photo.toString(),
                  width: 102.5.w,
                  height: 102.5.h,
                  fit: BoxFit.cover);
            } else {
              return Shimmer.fromColors(
                baseColor: Colors.grey[700]!,
                highlightColor: Colors.grey[500]!,
                child: Container(
                  width: 102.5.w,
                  height: 102.5.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[400],
                  ),
                ),
              );
            }
          },
        ),
        Container(
          width: 38.w,
          height: 18.75.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.mainColor,
              width: 0.2,
            ),
          ),
          child: IconButton(
            onPressed: () async {
              showImagePickerDialog(context, (image) {
                editProfileViewModel.image = image;
                editProfileViewModel
                    .doAction(UpdateProfileButtonAction(image: image));
              });
            },
            icon: Icon(
              Icons.edit,
              color: AppColors.mainColor,
              size: 14.sp,
            ),
          ),
        )
      ],
    );
  }

  void showImagePickerDialog(
      BuildContext context, Function(File) onImagePicked) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 200.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backgroundScaf),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Image",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Divider(color: Colors.white24, thickness: 1),
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.blueAccent),
                title: Text("Take from Camera",
                    style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    onImagePicked(File(pickedFile.path));
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.image, color: Colors.greenAccent),
                title: Text("Choose from Gallery",
                    style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    onImagePicked(File(pickedFile.path));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
