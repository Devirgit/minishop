import 'package:flutter/material.dart';
import 'package:minishop/common/theme/colors.dart';

abstract class ThemeDelegate {
  List<UIColorSheme> get supportedTheme;
  int get defaultThemeIndex;

  ThemeData theme(int index, Brightness brightness);
}

class AppThemeDelegate extends ThemeDelegate {
  @override
  List<UIColorSheme> get supportedTheme => [
        UIColorSheme(
          'orange',
          lightScheme: LightColor(),
        )
      ];

  @override
  int get defaultThemeIndex => 0;

  @override
  ThemeData theme(int index, Brightness brightness) {
    if (index < supportedTheme.length) {
      final colors = supportedTheme[index];
      if (brightness == Brightness.dark) {
        return colors.darkScheme?.theme() ?? colors.lightScheme.theme();
      }
      return colors.lightScheme.theme();
    } else {
      return supportedTheme[defaultThemeIndex].lightScheme.theme();
    }
  }
}
