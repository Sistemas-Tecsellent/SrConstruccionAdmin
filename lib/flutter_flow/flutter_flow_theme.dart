// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color lineColor;
  Color green;
  Color btnText;
  Color customColor3;
  Color customColor4;
  Color white;
  Color background;

  TextStyle get title1 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Montserrat',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 22,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Montserrat',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Montserrat',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Montserrat',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFFFDC054);
  Color secondaryColor = const Color(0xFFF2C77A);
  Color tertiaryColor = const Color(0xFFFAF1E2);
  Color alternate = const Color(0xFFFF5963);
  Color primaryBackground = const Color(0xFFF9F9F9);
  Color secondaryBackground = const Color(0xFFFFFFFF);
  Color primaryText = const Color(0xFF101213);
  Color secondaryText = const Color(0xFFAEAEAE);

  Color lineColor = Color(0xFFB5B5B5);
  Color green = Color(0xFF1EEBBD);
  Color btnText = Color(0xFFFFFFFF);
  Color customColor3 = Color(0xFFDF3F3F);
  Color customColor4 = Color(0xFF090F13);
  Color white = Color(0xFFFFFFFF);
  Color background = Color(0xFF1D2429);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
