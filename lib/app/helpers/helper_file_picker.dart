import 'dart:convert';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../core/app_log.dart';

/*
 * PickerHelper
 * Created by AditP at (c) May 2019, LLC. All rights reserved.
 */
mixin PickerHelper {
  static Future<void> image({required Function(String base64Img) callback}) async {
    /// IOS
    if (Platform.isIOS) {
      await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 20).then((xFile) async {
        if (xFile != null) {
          final cropped = await _cropperConfiguration(File(xFile.path));
          final bytes = File(cropped!.path).readAsBytesSync();
          final img64 = base64Encode(bytes);
          callback.call(img64);
        }
      }).catchError((error) {
        logW('$error');
      });
    } else {
      /// ANDROID
      await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 20).then((xFile) async {
        if (xFile != null) {
          final bytes = File(xFile.path).readAsBytesSync();
          final img64 = base64Encode(bytes);
          callback.call(img64);
        }
      }).catchError((error) {
        logW('$error');
      });
    }
  }

  // —————————————————————————————————————————————————————————————————————————————
  // # private function
  // —————————————————————————————————————————————————————————————————————————————
  static Future<CroppedFile?> _cropperConfiguration(File imgFile) async {
    return ImageCropper().cropImage(
      sourcePath: imgFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(toolbarTitle: 'Edit'),
        IOSUiSettings(title: 'Edit'),
      ],
    );
  }

  // static Future<double> _getFileSize(String filepath) async {
  //   final file = File(filepath);
  //   final bytes = await file.length();
  //   final sizeInMb = bytes / (1024 * 1024);
  //   logW('sizeInMb: $sizeInMb');
  //   return sizeInMb;
  // }
}
