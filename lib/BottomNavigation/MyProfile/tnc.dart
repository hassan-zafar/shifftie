import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:shifftie/Locale/locale.dart';

class TnC extends StatelessWidget {
  const TnC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.tnc!),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin magna velit, posuere eu consequat id, fermentum in ex. Phasellus imperdiet, ante sit amet rhoncus mattis, quam dolor venenatis felis, vitae mollis sapien lorem a justo. Vestibulum ut nunc et tortor porta blandit. Sed tincidunt urna eu urna bibendum iaculis. Duis porttitor ac dui ac mattis. Aenean eu nulla ut dolor accumsan tincidunt.\n\nAliquam viverra mattis arcu. Nulla facilisi. Ut in sapien et risus ullamcorper vestibulum ut eget leo. Nunc et tortor sodales, venenatis erat in, posuere tellus. Nunc quis pulvinar diam, quis lacinia diam. Vestibulum condimentum blandit hendrerit. Mauris finibus posuere arcu, ut convallis metus porta quis. Maecenas blandit nisi nulla, et mollis risus porttitor vel.\n\n'),
              Text(
                locale.termsOfUse!,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Text(
                  '\n\nDonec sem tellus, hendrerit et sagittis in, vulputate id sapien. Morbi pharetra euismod tellus. Sed semper augue quis nunc rhoncus, sit amet auctor ligula euismod. Morbi lacinia ante at odio dictum porta.\n\nInteger suscipit sem augue, eu congue ipsum commodo vel. Donec aliquam nunc ut velit bibendum aliquet. Mauris congue, nisl vitae consectetur sagittis, ligula magna placerat sapien, in scelerisque leo quam vel nisl.\n\nUt dapibus, magna auctor auctor rhoncus, odio lacus sollicitudin lacus, sed vehicula nulla nunc nec diam. Cras ut lorem venenatis, tempus eros a, consequat leo. Proin malesuada, ligula nec ornare rhoncus, augue libero semper magna, id interdum mauris orci id magna. Vestibulum eget tincidunt mauris. Nullam placerat risus quis vehicula scelerisque. Mauris vel fringilla velit. Maecenas feugiat lectus eu odio pellentesque ultricies. Nulla facilisi.')
            ],
          ),
        ),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
