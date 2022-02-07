import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/utilities/custom_toast.dart';
import 'package:video_player/video_player.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({Key? key}) : super(key: key);

  @override
  _AddVideoState createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  File? file;
  bool _isVideoSelected = false;

  Future selectFile() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.video);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() {
      file = File(path);
      _isVideoSelected = true;
    });
    VideoPlayerController fileVideocontroller =
        VideoPlayerController.file(file!)..initialize();
    CustomToast.successToast(message: "Video Selected Successfully");
    debugPrint("========" + fileVideocontroller.value.duration.toString());
    if(_isVideoSelected) {
      Navigator.pushNamed(
                        context, PageRoutes.postInfoPage,arguments:file );
    }
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FadedSlideAnimation(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/video 2.png',
              fit: BoxFit.fill,
              height: ht,
              width: wt,
            ),
            Positioned(
              top: 28,
              left: 4,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: secondaryColor,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              width: wt,
              bottom: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.camera_front,
                    color: secondaryColor,
                  ),
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: videoCall,
                      child: Icon(
                        Icons.videocam,
                        color: secondaryColor,
                        size: 30,
                      ),
                    ),
                    onTap: () => ,
                  ),
                  Icon(
                    Icons.flash_off,
                    color: secondaryColor,
                  ),
                ],
              ),
            ),
            Positioned(
              width: wt,
              bottom: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: secondaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.swipeUpForGallery!,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
