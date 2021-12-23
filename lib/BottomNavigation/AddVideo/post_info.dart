import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shifftie/Components/continue_button.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Components/post_thumb_list.dart';
import 'package:shifftie/Constants/constants.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Services/firebase_api.dart';
import 'package:shifftie/Services/global_method.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/utilities/custom_toast.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class PostInfo extends StatefulWidget {
  const PostInfo({Key? key}) : super(key: key);

  @override
  _PostInfoState createState() => _PostInfoState();
}

class _PostInfoState extends State<PostInfo> {
  var icon = Icons.check_box_outline_blank;
  bool isSwitched1 = false;
  bool isSwitched2 = false;

  final List<PostThumbList> thumbLists = [
    PostThumbList(dance),
  ];
  static List<String> dance = [
    'assets/thumbnails/dance/Layer 951.png',
    'assets/thumbnails/dance/Layer 952.png',
    'assets/thumbnails/dance/Layer 953.png',
    'assets/thumbnails/dance/Layer 954.png',
    'assets/thumbnails/dance/Layer 951.png',
    'assets/thumbnails/dance/Layer 952.png',
    'assets/thumbnails/dance/Layer 953.png',
    'assets/thumbnails/dance/Layer 954.png',
  ];
  final _formKey = GlobalKey<FormState>();
  UploadTask? task;
  File? file;

  var _productTitle = '';
  String _productVideoUrl = '';
  var _productCategory = '';
  var _subHeading = '';

  var _categoryDescription = '';
  var _productDescription = '';
  var _videoLength = '';
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _categoryDescriptionController =
      TextEditingController();
  String? _categoryValue;
  final GlobalMethods _globalMethods = GlobalMethods();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  File? _pickedImage;
  bool _isLoading = false;
  bool _isVideoSelected = false;

  late String url;
  var uuid = const Uuid();
  showAlertDialog(BuildContext context, String title, String body) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
  }

  Future uploadFile() async {
    if (file == null) return;
    final fileName = _productTitle;
    final destination = 'videos/$_productCategory/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      _productVideoUrl = urlDownload;
    });
    CustomToast.successToast(message: "Video Uploaded SuccessFully");
    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );

  void _trySubmit() async {
    print("here");
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      print(_productTitle);
      print(_productCategory);
      print(_categoryDescription);
      print(_productDescription);
      print(_videoLength);
      // Use those values to send our request ...
    }
    if (isValid) {
      _formKey.currentState!.save();
      try {
        if (_pickedImage == null) {
          _globalMethods.authErrorHandle('Please pick an image', context);
        } else if (_productVideoUrl == null) {
          _globalMethods.authErrorHandle('Please pick a video', context);
        } else {
          setState(() {
            _isLoading = true;
          });
          final ref = FirebaseStorage.instance
              .ref()
              .child('postImages')
              .child(_productTitle + '.jpg');
          await ref.putFile(_pickedImage!);
          url = await ref.getDownloadURL();

          await uploadFile();
          final _uid = currentUser!.id;
          final productId = uuid.v4();
          await FirebaseFirestore.instance
              .collection('shiftties')
              .doc(productId)
              .set({
            'postId': productId,
            'postTitle': _productTitle,
            'videoUrl': _productVideoUrl,
            'posttImageUrl': url,
            'postCategory': _productCategory,
            'subHeading': _subHeading,
            'categoryDescription': _categoryDescription,
            'postDescription': _productDescription,
            'videoLength': _videoLength,
            'userId': _uid,
            'userName': currentUser!.name,
            'createdAt': Timestamp.now(),
          });
          Navigator.canPop(context) ? Navigator.pop(context) : null;
        }
      } catch (error) {
        _globalMethods.authErrorHandle(error.toString(), context);
        print('error occured ${error.toString()}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 40,
    );
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    // widget.imagePickFn(pickedImageFile);
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    final pickedImageFile = pickedImage == null ? null : File(pickedImage.path);

    setState(() {
      _pickedImage = pickedImageFile!;
    });
    // widget.imagePickFn(pickedImageFile);
  }

  void _removeImage() {
    setState(() {
      // _pickedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.post!),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      'assets/thumbnails/dance/Layer 952.png',
                      height: 120,
                      width: 80,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EntryField(
                          // prefix: FadedScaleAnimation(
                          //   child: const CircleAvatar(
                          //     backgroundImage:
                          //         AssetImage('assets/images/user.webp'),
                          //   ),
                          // ),
                          label: '    ' +
                              AppLocalizations.of(context)!.describeVideo!,
                        ),
                      ),
                    ),
                  ],
                ),
                const EntryField(
                  textCapitalization: TextCapitalization.words,
                  label: 'Shifttie Title',
                  keyboardType: TextInputType.emailAddress,
                ),
                const EntryField(
                  textCapitalization: TextCapitalization.words,
                  label: 'Short Description',
                  keyboardType: TextInputType.emailAddress,
                ),
                const EntryField(
                  textCapitalization: TextCapitalization.words,
                  label: 'Poll Question',
                  padding: EdgeInsets.all(4),
                  keyboardType: TextInputType.emailAddress,
                ),
                const EntryField(
                  textCapitalization: TextCapitalization.words,
                  label: 'Poll Answer',
                  keyboardType: TextInputType.emailAddress,
                ),
                const EntryField(
                  textCapitalization: TextCapitalization.words,
                  label: 'Poll Answer',
                  keyboardType: TextInputType.emailAddress,
                ),
                Text(
                  AppLocalizations.of(context)!.selectCover! + '\n',
                  style: TextStyle(color: secondaryColor, fontSize: 18),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: thumbLists.length,
                    itemBuilder: (context, index) {
                      return thumbLists[index];
                    }),
                const SizedBox(height: 12.0),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.commentOff!,
                    style: TextStyle(color: secondaryColor),
                  ),
                  trailing: Switch(
                    value: isSwitched1,
                    onChanged: (value) {
                      setState(() {
                        isSwitched1 = value;
                        //print(isSwitched1);
                      });
                    },
                    inactiveThumbColor: disabledTextColor,
                    inactiveTrackColor: darkColor,
                    activeTrackColor: darkColor,
                    activeColor: mainColor,
                  ),
                ),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.saveToGallery!,
                    style: TextStyle(color: secondaryColor),
                  ),
                  trailing: Switch(
                    value: isSwitched2,
                    onChanged: (value) {
                      setState(() {
                        isSwitched2 = value;
                        //print(isSwitched2);
                      });
                    },
                    inactiveThumbColor: disabledTextColor,
                    inactiveTrackColor: darkColor,
                    activeTrackColor: darkColor,
                    activeColor: mainColor,
                  ),
                ),
                CustomButton(
                  text: AppLocalizations.of(context)!.postVideo,
                  onPressed: () {
                    Phoenix.rebirth(context);
                  },
                )
              ],
            ),
          ),
        ),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
