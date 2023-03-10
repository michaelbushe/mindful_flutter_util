// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bus/flutter_bus.dart';
import 'package:mindful_flutter_util/mindful_flutter_util.dart';

/// A wrapper for a MaterialApp that themes it and changes the theme whenever
/// a ThemedChangedEvent is fired on the EventBus.
class ThemedApp extends StatefulWidget {
  ThemedApp({
    super.key,
    required this.lightTheme,
    required this.darkTheme,
    required this.title,
    required this.useDynamicColor,
    required this.child,
  });

  final String title;
  final bool useDynamicColor;
  final Widget child;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  @override
  State<StatefulWidget> createState() {
    return ThemedAppState();
  }
}

class ThemedAppState extends State<ThemedApp> {
  ThemedAppState() {}

  late ThemeData latestLightTheme;
  late ThemeData latestDarkTheme;

  @override
  void initState() {
    latestLightTheme = widget.lightTheme;
    latestDarkTheme = widget.darkTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBusBuilder<ThemeChangedEvent>(
        on: (ThemeChangedEvent themeChangedEvent) {
          setState(() {
            latestLightTheme = themeChangedEvent.lightTheme;
            latestDarkTheme = themeChangedEvent.darkTheme;
          });
        },
        child: createThemedMaterialApp(widget.child));
  }

  MaterialApp createThemedMaterialApp(Widget home) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const AppScrollBehavior(),
      title: widget.title,
      theme: latestLightTheme,
      darkTheme: latestDarkTheme,
      //themeMode: themeController.themeMode,
      home: home,
    );
  }
}
