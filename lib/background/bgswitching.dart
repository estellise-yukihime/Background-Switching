import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

class BgSwitcher extends StatefulWidget {
  const BgSwitcher({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BgSwitcher();
  }
}

class _BgSwitcher extends State<BgSwitcher> {
  _BgSwitcher() {
    background = const Background(source: 'assets/images/bg_default.jpg');
  }

  _init(BuildContext context) async {
    if (sources.isEmpty) {
      var manifest = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
      var backgrounds = json.decode(manifest).keys.where((String key) {
        return key.startsWith('assets/backgrounds');
      });

      sources.addAll(backgrounds);

      if (index >= 0 && index < sources.length) {
        setState(() {
          background = Background(source: sources[index], key: ValueKey(++count));
        });
      }

      timer = Timer.periodic(const Duration(seconds: 3), switchingBg);
    }
  }

  Widget? background;
  Timer? timer;

  final List<String> sources = <String>[];

  int index = 0;
  int count = 0;

  void switchingBg(Timer timer) {
    index += 1;

    if (index >= sources.length) {
      index = 0;
    }

    if (index >= 0 && index < sources.length) {
      setState(() {
        background = Background(source: sources[index], key: ValueKey(++count));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _init(context);

    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: background,
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key, required this.source}) : super(key: key);

  final String source;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(source),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Switcher {}
