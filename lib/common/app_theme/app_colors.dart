import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryERP = Color(0xFFEE4623);
  static const Color secondaryERP = Color(0xFF2957A6);
  static const Color primaryERPlight = Color(0xFFFFA726);

  static const Color primaryColor2 = Color(0xff000000);
  static const Color textColor = Color(0xffffffff);

  static const Color heading = Color(0xff404C6D);
  static const Color gray = Color(0xff8C96B1);
  static const Color text = Color(0xffA3ABC0);
  static const Color background = Color(0xffF0F4FF);
  static const Color disableText = Color(0xffC1C1CC);
  static const Color enableText = Color(0xff3F4254);
  static const Color neutralText = Color(0xff404C6D);

  static const Color whiteBlue = Color(0xffF9FBFF);
  static const Color red = Colors.red;
  static const Color main = Color(0xff4267CD);
  static const Color blueMain = Color(0xff4267CD);
  static const Color purple = Color(0xff853EFD);
  static const Color success = Color(0xff41B339);
  static const Color alert = Color(0xffD92B46);
  static const Color bgCard = Color(0xffF5F5FA);
  static const Color supportBtn = Color(0xFFEFF0F6);
  static const Color borderColor = Color(0xFFEBEBF0);
  static const Color warning = Color(0xFFF0891A);

  static const Color grey_bg = Color(0xFFECEEF0);

  static const MaterialColor secondaryColor =
      MaterialColor(0xFFFFB909, <int, Color>{
        50: Color(0xFFFFF8E6),
        100: Color(0xFFFFF1CE),
        200: Color(0xFFFFEAB5),
        300: Color(0xFFFFE39D),
        400: Color(0xFFFFD56B),
        500: Color(0xFFFFC73A),
        600: Color(0xFFFFB909),
        700: Color(0xFFCC9407),
        800: Color(0xFF996F05),
        900: Color(0xFF684B03),
      });

  /// State Color.
  static const Color stateSuccessColor = Color(0xFF33B469);
  static const Color stateWarningColor = Color(0xFFEBBC2E);
  static const Color stateInfoColor = Color(0xFF2F80ED);
  static const Color stateErrorColor = Color(0xFFED3A3A);

  /// Text Color.
  static const Color textSuccessColor = Color(0xFF181C32);
  static const Color textSecondaryColor = Color(0xFF3F4254);
  static const Color textTertiaryColor = Color(0xFF8B90A7);
  static const Color textDisableColor = Color(0xFFC1C1CC);
  static const Color textMain = Color(0xFF009E62);
  static const Color label = Color(0xFF6E7191);
  static const Color hintText = Color(0xff989898);

  /// Button Color.
  static const Color colorNavigationButton = Color(0xff3B71FE);
  static const Color colorBrandButton = Color(0xffE4F4FF);
  static const Color colorRedAlert = Color(0xffF01A3C);
  static const Color colorMainSecondary = Color(0xffE5ECFF);
  static const Color unSelectedDateColor = Color(0xffEDEFF1);
  static const Color unlockButton = Color(0xffAF52DE);
  static const Color disableTextButton = Color(0xffC5C7D3);
  static const Color disableBorderButton = Color(0xffEBEBF0);

  ///base
  static const Color white = Color(0xFFFFFFFF);

  // static const Color divider = Color(0xFFF);
  static const Color black = Color(0xff000000);
  static const Color transparent = Colors.transparent;
  static const Color offWhite = Color(0xFFFCFCFC);
  static const Color line = Color(0xFFD9DBE9);
  static const Color strokeOrderColor = Color(0xFFD9D9D9);

  ///support colors
  static const Color backgroundLight = Color(0xFFF8F9FC);
  static const Color iconColor = Color(0xFF555B7C);
  static const Color placeholder = Color(0xFFE8EAF3);

  static const LinearGradient gradientERP = LinearGradient(
    colors: [Color(0xFFEF4723), Color(0xFFFF0000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient skeleton = LinearGradient(
    colors: [Color(0xFFE7E8EE), Color(0xFFF7F7F8)],
  );
  static const LinearGradient gradientOrangeA500 = LinearGradient(
    colors: [Color(0xFFFFC800), Color(0xFFFF9C09)],
  );
  static const LinearGradient gradientRedA500 = LinearGradient(
    colors: [Color(0xFFE6514A), Color(0xFFE57536)],
  );
  static const LinearGradient gradientBlueA500 = LinearGradient(
    colors: [Color(0xFF98A2FF), Color(0xFF4659FF)],
  );
  static const LinearGradient gradientBlue = LinearGradient(
    colors: [Color(0xFF428ECD), Color(0xFF512167)],
  );
  static const LinearGradient gradientPurple = LinearGradient(
    colors: [Color(0xFFE359F9), Color(0xFF5F2EEA)],
  );
  static const LinearGradient gradientPurpleVertical = LinearGradient(
    colors: [Color(0xFFE359F9), Color(0xFF5F2EEA)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Emotion [Stressful]: display dangerous content.
  static const Color redA500 = Color(0xFFE41338);
  static const Color redA400 = Color(0xFFE94260);
  static const Color redA300 = Color(0xFFF7B8C3);
  static const Color redA200 = Color(0xFFFCE7EB);
  static const Color redA100 = Color(0xFFF8F8FF);

  ///Emotion [Positive]: display successful content.
  static const Color greenA500 = Color(0xFF1CBB78);
  static const Color greenA400 = Color(0xFF4BDDA0);
  static const Color greenA300 = Color(0xFF84F5C6);
  static const Color greenA200 = Color(0xFFCCF9E6);
  static const Color greenA100 = Color(0xFFDDFDF0);

  ///Emotion [Careful]: display warning content.
  static const Color orangeA500 = Color(0xFFFD8230);
  static const Color orangeA400 = Color(0xFFFD9B5A);
  static const Color orangeA300 = Color(0xFFFED9C1);
  static const Color orangeA200 = Color(0xFFFFF2EA);
  static const Color orangeA100 = Color(0xFFFFF9F4);

  ///Emotions [Useful]:
  static const Color yellow = Color(0xFFFFCC00);
  static const Color yellowA500 = Color(0xFFFFD53E);
  static const Color yellowA400 = Color(0xFFFFE589);
  static const Color yellowA300 = Color(0xFFFEF1C1);
  static const Color yellowA200 = Color(0xFFFFF8DD);
  static const Color yellowA100 = Color(0xFFFFFBED);

  ///Emotions [Useful]:
  static const Color pinkA500 = Color(0xFFFD79FF);
  static const Color pinkA400 = Color(0xFFFD93FF);
  static const Color pinkA300 = Color(0xFFFEC6FF);
  static const Color pinkA200 = Color(0xFFFEDDFF);
  static const Color pinkA100 = Color(0xFFFFF0FF);

  ///Emotions [Useful]:
  static const Color purpleA500 = Color(0xFFA93CFE);
  static const Color purpleA400 = Color(0xFFBF6FFF);
  static const Color purpleA300 = Color(0xFFD29AFF);
  static const Color purpleA200 = Color(0xFFEAD0FF);
  static const Color purpleA100 = Color(0xFFF3E5FF);
  static const Color deepPurple = Color(0xff3F0B98);

  ///Emotions [Useful]:
  static const Color matchaA500 = Color(0xFF88BB1C);
  static const Color matchaA400 = Color(0xFFBCEE52);
  static const Color matchaA300 = Color(0xFFD6FF7E);
  static const Color matchaA200 = Color(0xFFE3FFB5);
  static const Color matchaA100 = Color(0xFFF1FFD2);

  static const Color tealA700 = Color(0xFF00897B);
  static const Color tealA400 = Color(0xFF26A69A);
  static const Color tealA300 = Color(0xFF80CBC4);
  static const Color tealA200 = Color(0xFFB2DFDB);
  static const Color tealA100 = Color(0xFFE0F2F1);

  static const Color blueA500 = Color(0xFF3B82F6);
  static const Color blueA400 = Color(0xFF5EABFF);
  static const Color blueA300 = Color(0xFF8DC7FF);
  static const Color blueA200 = Color(0xFFC2DFFF);
  static const Color blueA100 = Color(0xFFE7F2FF);

  static const Color danger = Color(0xFFBD4242);
  static const Color backgroundDialog = Color(0xFFF2F2F2);
  static const Color dialogDivider = Color(0xFF3C3C43);

  // Gray Color.
  static const MaterialColor grayColor = MaterialColor(0xFFA6A6B0, <int, Color>{
    5: Color(0xFFFFFFFF),
    10: Color(0xFFF5F5FA),
    20: Color(0xFFEBEBF0),
    30: Color(0xFFDDDDE3),
    40: Color(0xFFC4C4CF),
    50: Color(0xFFA6A6B0),
    60: Color(0xFF808089),
    70: Color(0xFF64646D),
    80: Color(0xFF515158),
    90: Color(0xFF38383D),
    100: Color(0xFF27272A),
    150: Color(0xFF000000),
  });

  static const Color bgFreeColor = Color(0xff41B339);
  static const Color bgTrialColor = Color(0xffF0881A);
  static const Color grayBgColor = Color(0xffF3F3F3);
  static const Color selectedTabConversation = Color(0xffAF52DE);

  static const Color shadowColor = Color(0xFF00000017);

}
