

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:freeclimbers_employee/blocs/member_cubit/member_cubit.dart';
import 'package:freeclimbers_employee/blocs/theme_bloc/theme_bloc.dart';
import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/utils/toasts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const int _maxImageSizeInBytes = 100000;

Future<void> showPhotoActionSheet(BuildContext context) async{
  int choice = 0;
  bool hasRemoveImageButton = context.read<MemberCubit>().state.profileImage == null;

  final actions = [
    hasRemoveImageButton ? Container() : BottomSheetAction(
      onPressed: (_) {
        choice = 1;
        Navigator.pop(context);
      },
      title: Text(AppLocalizations.of(context)!.remove_photo, style: TextStyle(color: KColors.fieldBorderError),),
    ),
    BottomSheetAction(
      onPressed: (_) {
        choice = 2;
        Navigator.pop(context);
      },
      title: Text(AppLocalizations.of(context)!.use_camera),
    ),
    BottomSheetAction(
      onPressed: (_) {
        choice = 3;
        Navigator.pop(context);
      },
      title: Text(AppLocalizations.of(context)!.select_photo),
    ),
  ];
  await showAdaptiveActionSheet<void>(
    context: context,
    actions: actions.whereType<BottomSheetAction>().toList(),
    cancelAction: CancelAction(
      onPressed: (_) {
        Navigator.pop(context);
      },
      title: Text(AppLocalizations.of(context)!.cancel),
    ),
  );

  String? photoPath;
  switch(choice){
    case 0:
      break;
    case 1:
      context.read<MemberCubit>().removeLogo();
      break;
    case 2:
      final pickedImg = await ImagePicker().pickImage(source: ImageSource.camera,);
      if(pickedImg == null){
        return;
      }
      photoPath = pickedImg.path;
      break;
    case 3:
      final pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery,);
      if(pickedImg == null){
        return;
      }
      photoPath = pickedImg.path;
      break;
  }

  if(photoPath == null){
    return;
  }

  final croppedImg = await ImageCropper().cropImage(sourcePath: photoPath, maxWidth: 128, compressQuality: 80, maxHeight: 128, compressFormat: ImageCompressFormat.png,
  aspectRatioPresets: [CropAspectRatioPreset.square], uiSettings: [AndroidUiSettings(hideBottomControls: true), IOSUiSettings(hidesNavigationBar: true)]);
  if(croppedImg == null){
    return;
  }
  croppedImg.readAsBytes().then((img){
    if(img.lengthInBytes > _maxImageSizeInBytes){
      AppToast.instance.showError(context, AppLocalizations.of(context)!.max_image_size_is(_maxImageSizeInBytes ~/ 1000));
      return;
    }
    context.read<MemberCubit>().changeLogoUrl(imgBytes: img);
  });
}

Future<Locale?> showLocaleActionSheet(BuildContext context) async{
  Locale? selectedLocale;
  await showAdaptiveActionSheet<void>(
    context: context,
    brightness: context.read<ThemeBloc>().state.brightness,
    actions: [
      BottomSheetAction(title: Text(AppLocalizations.of(context)!.english), onPressed: (_){
        selectedLocale = Locale('en');
        Navigator.pop(context);
      }),
      BottomSheetAction(title: Text(AppLocalizations.of(context)!.german), onPressed: (_){
        selectedLocale = Locale('de');
        Navigator.pop(context);
      })
    ],
    cancelAction: CancelAction(
      onPressed: (_) {
        Navigator.pop(context);
      },
      title: Text(AppLocalizations.of(context)!.cancel,),
    ),
  );
  return selectedLocale;
}