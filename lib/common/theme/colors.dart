import 'package:flutter/material.dart';

class UIColorSheme {
  const UIColorSheme(this.name, {this.darkScheme, required this.lightScheme});

  final String name;
  final UIColor? darkScheme;
  final UIColor lightScheme;
}

abstract class UIColor {
  ThemeData theme();
}

class LightColor extends UIColor {
  Color primaryColor = const Color(0xFFF5F5F5);
  Color accentColor = const Color(0xFFFF6E4E);
  Color fontColor = const Color(0xFF010035);
  Color accentFontColor = const Color(0xFFFFFFFF);
  Color bottomBarColor = const Color(0xFF010035);
  Color dividerColor = const Color(0xFF404068);
  Color actionCardColor = const Color(0xFF282843);
  Color cardColor = const Color(0xFFFFFFFF);
  Color priceOldColor = const Color(0xFFCCCCCC);
  Color capacityColor = const Color(0xFF8D8D8D);
  Color comboBoxActionColor = const Color(0xFFB3B3B3);
  Color comboBoxBorderColor = const Color(0xFFDCDCDC);
  Color favoritColor = const Color(0xFFFFB800);
  Color iconCategoryColor = const Color(0xFFB3B3C3);
  Color productParamsColor = const Color(0xFFB7B7B7);
  Color tabFontColor = const Color(0xFF808080);
  Color trashColor = const Color(0xFF36364D);
  Color banerColor = const Color(0xFF101010);
  Color cartImageColor = const Color(0xFFC4C4C4);

  @override
  ThemeData theme() => ThemeData.light().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: bottomBarColor,
            elevation: 0,
            selectedItemColor: accentFontColor,
            unselectedItemColor: accentFontColor),
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: primaryColor,
            foregroundColor: fontColor,
            actionsIconTheme: IconThemeData(color: accentColor)),
        textTheme: fallbackTextTheme,
        scaffoldBackgroundColor: primaryColor,
        tabBarTheme: TabBarTheme(
            labelPadding: const EdgeInsets.only(top: 15),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: accentColor)),
            labelColor: fontColor,
            labelStyle: TextStyle(
                color: fontColor, fontWeight: FontWeight.w700, fontSize: 20),
            unselectedLabelStyle: TextStyle(
                color: tabFontColor,
                fontWeight: FontWeight.w400,
                fontSize: 20)),
        extensions: [
          AppColors(
            actionCardColor: actionCardColor,
            banerColor: banerColor,
            capacityColor: capacityColor,
            comboBoxActionColor: comboBoxActionColor,
            comboBoxBorderColor: comboBoxBorderColor,
            favoritColor: favoritColor,
            iconCategoryColor: iconCategoryColor,
            productParamsColor: productParamsColor,
            tabFontColor: tabFontColor,
            trashColor: trashColor,
            cardColor: cardColor,
            priceOldColor: priceOldColor,
            accentColor: accentColor,
            fontColor: fontColor,
            bottomBarColor: bottomBarColor,
            dividerColor: dividerColor,
            cartImageColor: cartImageColor,
          )
        ],
      );

  TextStyle get fallbackTextStyle => TextStyle(
        fontFamily: 'MarkPro',
        fontFamilyFallback: const ['NotoEmoji'],
        color: fontColor,
      );

  TextTheme get fallbackTextTheme => TextTheme(
        bodyText1: fallbackTextStyle,
        bodyText2: fallbackTextStyle,
        button: fallbackTextStyle,
        caption: fallbackTextStyle,
        overline: fallbackTextStyle,
        headline1: fallbackTextStyle,
        headline2: fallbackTextStyle,
        headline3: fallbackTextStyle,
        headline4: fallbackTextStyle,
        headline5: fallbackTextStyle,
        headline6: fallbackTextStyle,
        subtitle1: fallbackTextStyle,
        subtitle2: fallbackTextStyle,
      );
}

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.actionCardColor,
    required this.capacityColor,
    required this.comboBoxActionColor,
    required this.comboBoxBorderColor,
    required this.favoritColor,
    required this.iconCategoryColor,
    required this.productParamsColor,
    required this.tabFontColor,
    required this.trashColor,
    required this.banerColor,
    required this.cardColor,
    required this.priceOldColor,
    required this.accentColor,
    required this.fontColor,
    required this.bottomBarColor,
    required this.dividerColor,
    required this.cartImageColor,
  });

  final Color actionCardColor;
  final Color capacityColor;
  final Color comboBoxActionColor;
  final Color comboBoxBorderColor;
  final Color favoritColor;
  final Color iconCategoryColor;
  final Color productParamsColor;
  final Color tabFontColor;
  final Color trashColor;
  final Color banerColor;
  final Color cardColor;
  final Color priceOldColor;
  final Color accentColor;
  final Color fontColor;
  final Color bottomBarColor;
  final Color dividerColor;
  final Color cartImageColor;

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      cartImageColor:
          Color.lerp(cartImageColor, other.cartImageColor, t) ?? cartImageColor,
      dividerColor:
          Color.lerp(dividerColor, other.dividerColor, t) ?? dividerColor,
      bottomBarColor:
          Color.lerp(bottomBarColor, other.bottomBarColor, t) ?? bottomBarColor,
      accentColor: Color.lerp(accentColor, other.accentColor, t) ?? accentColor,
      fontColor: Color.lerp(fontColor, other.fontColor, t) ?? fontColor,
      priceOldColor:
          Color.lerp(priceOldColor, other.priceOldColor, t) ?? priceOldColor,
      cardColor: Color.lerp(cardColor, other.cardColor, t) ?? cardColor,
      actionCardColor: Color.lerp(actionCardColor, other.actionCardColor, t) ??
          actionCardColor,
      capacityColor:
          Color.lerp(capacityColor, other.capacityColor, t) ?? capacityColor,
      comboBoxActionColor:
          Color.lerp(comboBoxActionColor, other.comboBoxActionColor, t) ??
              comboBoxActionColor,
      comboBoxBorderColor:
          Color.lerp(comboBoxBorderColor, other.comboBoxBorderColor, t) ??
              comboBoxBorderColor,
      favoritColor:
          Color.lerp(favoritColor, other.favoritColor, t) ?? favoritColor,
      iconCategoryColor:
          Color.lerp(iconCategoryColor, other.iconCategoryColor, t) ??
              iconCategoryColor,
      productParamsColor:
          Color.lerp(productParamsColor, other.productParamsColor, t) ??
              productParamsColor,
      tabFontColor:
          Color.lerp(tabFontColor, other.tabFontColor, t) ?? tabFontColor,
      trashColor: Color.lerp(trashColor, other.trashColor, t) ?? trashColor,
      banerColor: Color.lerp(banerColor, other.banerColor, t) ?? banerColor,
    );
  }

  @override
  AppColors copyWith({
    Color? actionCardColor,
    Color? capacityColor,
    Color? comboBoxActionColor,
    Color? comboBoxBorderColor,
    Color? favoritColor,
    Color? iconCategoryColor,
    Color? productParamsColor,
    Color? tabFontColor,
    Color? trashColor,
    Color? banerColor,
    Color? cardColor,
    Color? priceOldColor,
    Color? accentColor,
    Color? fontColor,
    Color? bottomBarColor,
    Color? dividerColor,
    Color? cartImageColor,
  }) {
    return AppColors(
      cartImageColor: cartImageColor ?? this.cartImageColor,
      dividerColor: dividerColor ?? this.dividerColor,
      bottomBarColor: bottomBarColor ?? this.bottomBarColor,
      accentColor: accentColor ?? this.accentColor,
      fontColor: fontColor ?? this.fontColor,
      cardColor: cardColor ?? this.cardColor,
      priceOldColor: priceOldColor ?? this.priceOldColor,
      actionCardColor: actionCardColor ?? this.actionCardColor,
      capacityColor: capacityColor ?? this.capacityColor,
      comboBoxActionColor: comboBoxActionColor ?? this.comboBoxActionColor,
      comboBoxBorderColor: comboBoxBorderColor ?? this.comboBoxBorderColor,
      favoritColor: favoritColor ?? this.favoritColor,
      iconCategoryColor: iconCategoryColor ?? this.iconCategoryColor,
      productParamsColor: productParamsColor ?? this.productParamsColor,
      tabFontColor: tabFontColor ?? this.tabFontColor,
      trashColor: trashColor ?? this.trashColor,
      banerColor: banerColor ?? this.banerColor,
    );
  }
}
