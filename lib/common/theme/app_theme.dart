import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:minishop/common/theme/theme_delegate.dart';

typedef AppThemeBuilder = Widget Function(ThemeData theme);

class AppTheme extends StatefulWidget {
  const AppTheme({
    Key? key,
    required this.themeDelegate,
    this.initThemeMode,
    this.initThemeIndex,
    required this.builder,
  }) : super(key: key);

  final ThemeDelegate themeDelegate;
  final ThemeMode? initThemeMode;
  final int? initThemeIndex;
  final AppThemeBuilder builder;

  static AppThemeState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppThemeState>();
  }

  @override
  State<AppTheme> createState() => AppThemeState();
}

class AppThemeState extends State<AppTheme> with WidgetsBindingObserver {
  int get themeIndex => _themeIndex;

  set themeIndex(int value) {
    _themeIndex = value;
    setState(() {});
  }

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
    setState(() {});
  }

  late int _themeIndex;
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeIndex = widget.themeDelegate.defaultThemeIndex;
    _themeMode = widget.initThemeMode ?? ThemeMode.system;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (mounted) setState(() {});
  }

  Brightness get _brightness {
    if (themeMode == ThemeMode.system) {
      return SchedulerBinding.instance.window.platformBrightness;
    }
    return themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(widget.themeDelegate.theme(themeIndex, _brightness));

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
