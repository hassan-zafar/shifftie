import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Routes/routes.dart';
import 'package:shifftie/Theme/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200.0),
          child: AppBar(
            flexibleSpace: Column(
              children: <Widget>[
                const Spacer(),
                FadedScaleAnimation(
                   child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.webp'),
                    radius: 40,
                  ),
                ),
                Text(
                  '\n' + locale.changeProfilePic!,
                  style: TextStyle(color: disabledTextColor),
                ),
                const SizedBox(height: 64),
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  locale.save!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: mainColor),
                ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelColor: mainColor,
                  unselectedLabelColor: secondaryColor,
                  labelStyle: Theme.of(context).textTheme.headline6,
                  indicator: BoxDecoration(color: transparentColor),
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(text: locale.profileInfo),
                    Tab(text: locale.accountInfo),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            FadedSlideAnimation(
              child: buildProfileInfo(locale),
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
            FadedSlideAnimation(
              child: buildAccountInfo(locale),
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            )
          ],
        ),
      ),
    );
  }

  Widget buildProfileInfo(var locale) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 36.0),
        EntryField(
          label: locale.bio,
          initialValue: AppLocalizations.of(context)!.comment5,
        ),
        EntryField(
          label: locale.instagramID,
          initialValue: "@samanthasmith",
        ),
        EntryField(
          label: locale.facebookID,
          initialValue: "@samanth.asmith1",
        ),
        EntryField(
          label: locale.twitterID,
          initialValue: "@samanth.asmith1",
        ),
      ],
    );
  }

  Widget buildAccountInfo(var locale) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 36.0),
        EntryField(
          label: locale.fullName,
          initialValue: "Samantha Smith",
        ),
        EntryField(
          label: locale.email,
          initialValue: "samanthasmith@mail.com",
        ),
        EntryField(
          label: locale.email,
          initialValue: "+1 987 654 3210",
        ),
        const Spacer(),
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          leading: Image.asset(
            'assets/icons/ic_verified.png',
            scale: 3,
          ),
          title: Text(
            locale.getVerified,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: disabledTextColor, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: secondaryColor,
            size: 16,
          ),
          onTap: () =>
              Navigator.popAndPushNamed(context, PageRoutes.verifiedBadgePage),
        )
      ],
    );
  }
}
