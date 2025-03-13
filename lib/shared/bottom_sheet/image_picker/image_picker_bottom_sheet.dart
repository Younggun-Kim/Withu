import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:withu/core/utils/library/image_picker/image_picker_utils.dart';
import 'package:withu/shared/bottom_sheet/base/base_bottom_sheet.dart';
import 'package:withu/shared/widgets/base_button/base_button.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  const ImagePickerBottomSheet({super.key, required this.onTap});

  final Function(XFile) onTap;

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: <Widget>[
          BaseButton.enabled(
            context: context,
            text: '카메라에서 가져오기',
            onTap: () async {
              final file = await ImagePickerUtils().getPhotoFromCamera();

              if (file != null) {
                onTap(file);
              }
            },
          ),
          const SizedBox(height: 20),
          BaseButton.enabled(
            context: context,
            text: '앨범에서 가져오기',
            onTap: () async {
              final file = await ImagePickerUtils().getPhotoFromAlbum();

              if (file != null) {
                onTap(file);
              }
            },
          ),
        ],
      ),
    );
  }

  /// 바텀 시트 보기.
  static Future show({
    required BuildContext context,
    required Function(XFile) onTap,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ImagePickerBottomSheet(
          onTap: (XFile file) {
            onTap(file);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
