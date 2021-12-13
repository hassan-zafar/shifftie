import 'package:flutter/material.dart';
import 'package:shifftie/Components/continue_button.dart';
import 'package:shifftie/Locale/locale.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:shifftie/Theme/style.dart';

class BadgeRequest extends StatelessWidget {
  const BadgeRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(locale.verifiedBadgeRequest!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              locale.provide!,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20.0),
          ListTile(
            title: Text(
              locale.clickCurrent! + '\n',
              style: const TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              locale.clickNow!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: mainColor),
            ),
            trailing: Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: radius,
                color: lightTextColor,
              ),
              child: Icon(
                Icons.camera_alt,
                size: 20.0,
                color: mainColor,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          ListTile(
            title: Text(
              locale.uploadGovt! + '\n',
              style: const TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              locale.uploadNow!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: mainColor),
            ),
            trailing: Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: radius,
                color: lightTextColor,
              ),
              child: Icon(
                Icons.file_upload,
                size: 20.0,
                color: mainColor,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              text: locale.requestFor,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Text(
            '\n' + locale.itWillTake! + '\n\n',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
