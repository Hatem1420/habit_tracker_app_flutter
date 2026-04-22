import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ImageTypeSelect extends StatelessWidget {
  final Function(String?) pathCallBack;
  const ImageTypeSelect({super.key, required this.pathCallBack});

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    return Column(
      spacing: 5,
      crossAxisAlignment: .start,
      children: [
        ListTile(
          leading: Icon(Icons.image),
          title: Text('From Gallery'),
          onTap: () async {
            pathCallBack((await picker.pickImage(source: .gallery))?.path);
            context.pop();
          },
        ),
        Divider(thickness: 0),
        ListTile(
          leading: Icon(Icons.camera_alt),
          title: Text('From Camera'),
          onTap: () async {
            pathCallBack((await picker.pickImage(source: .camera))?.path);
            context.pop();
          },
        ),
      ],
    );
  }
}
