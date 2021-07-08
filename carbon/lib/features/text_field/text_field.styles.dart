import 'package:flutter/material.dart';
import 'package:carbon/shared/index.dart';

abstract class CTextfieldStyle {
  static final Map<String, dynamic> layouts = {
    'textfield-label-font-size': 14.0,
    'textfield-label-font-family': CFonts.primaryRegular,
    'textfield-text-font-size': 15.0,
    'textfield-text-font-family': CFonts.primaryRegular,
    'textfield-hint-font-size': 15.0,
    'textfield-hint-font-family': CFonts.primaryRegular,
    'textfield-description-font-size': 14.0,
    'textfield-description-font-family': CFonts.primaryRegular,

    /// primary ///

    // border
    'textfield-primary-enabled-border': UnderlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.gray60, width: 1),
    ),
    'textfield-primary-focus-border': OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.white0, width: 2),
    ),
    'textfield-primary-disabled-border': UnderlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
    ),

    /// success ///

    // border
    'textfield-success-enabled-border': UnderlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.gray60, width: 1),
    ),
    'textfield-success-focus-border': OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.green40, width: 2),
    ),
    'textfield-success-disabled-border': UnderlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
    ),

    /// warning ///

    // border
    'textfield-warning-enabled-border': UnderlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.gray60, width: 1),
    ),
    'textfield-warning-focus-border': OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.yellow20, width: 2),
    ),
    'textfield-warning-disabled-border': UnderlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
    ),

    /// error ///

    // border
    'textfield-error-enabled-border': UnderlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.gray60, width: 1),
    ),
    'textfield-error-focus-border': OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.red50, width: 2),
    ),
    'textfield-error-disabled-border': UnderlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
    ),
  };

  static const Map<String, Color> colors = {
    'textfield-disabled-icon-color': CColors.gray70,

    // background-color
    'textfield-enabled-background-color': CColors.gray10,
    'textfield-focus-background-color': CColors.gray10,
    'textfield-disabled-background-color': CColors.gray10,

    // modalform-background-color
    'textfield-modalform-enabled-background-color': CColors.gray10,
    'textfield-modalform-focus-background-color': CColors.gray10,
    'textfield-modalform-disabled-background-color': CColors.gray10,

    /// primary ///

    // label
    'textfield-primary-enabled-label-color': CColors.gray70,
    'textfield-primary-focus-label-color': CColors.gray70,
    'textfield-primary-disabled-label-color': CColors.gray30,

    // hint
    'textfield-primary-enabled-hint-color': CColors.gray40,
    'textfield-primary-focus-hint-color': CColors.gray40,
    'textfield-primary-disabled-hint-color': CColors.gray30,

    // text
    'textfield-primary-enabled-text-color': CColors.gray90,
    'textfield-primary-focus-text-color': CColors.gray90,
    'textfield-primary-disabled-text-color': CColors.gray30,

    // description
    'textfield-primary-enabled-description-color': CColors.gray70,
    'textfield-primary-focus-description-color': CColors.gray70,
    'textfield-primary-disabled-description-color': CColors.gray30,

    /// success ///

    // label
    'textfield-success-enabled-label-color': CColors.gray70,
    'textfield-success-focus-label-color': CColors.gray70,
    'textfield-success-disabled-label-color': CColors.gray30,

    // hint
    'textfield-success-enabled-hint-color': CColors.gray40,
    'textfield-success-focus-hint-color': CColors.gray40,
    'textfield-success-disabled-hint-color': CColors.gray30,

    // text
    'textfield-success-enabled-text-color': CColors.gray90,
    'textfield-success-focus-text-color': CColors.gray90,
    'textfield-success-disabled-text-color': CColors.gray30,

    // description
    'textfield-success-enabled-description-color': CColors.gray70,
    'textfield-success-focus-description-color': CColors.green70,
    'textfield-success-disabled-description-color': CColors.gray30,

    /// warning ///

    // label
    'textfield-warning-enabled-label-color': CColors.gray70,
    'textfield-warning-focus-label-color': CColors.gray70,
    'textfield-warning-disabled-label-color': CColors.gray30,

    // hint
    'textfield-warning-enabled-hint-color': CColors.gray40,
    'textfield-warning-focus-hint-color': CColors.gray40,
    'textfield-warning-disabled-hint-color': CColors.gray30,

    // text
    'textfield-warning-enabled-text-color': CColors.gray90,
    'textfield-warning-focus-text-color': CColors.gray90,
    'textfield-warning-disabled-text-color': CColors.gray30,

    // description
    'textfield-warning-enabled-description-color': CColors.gray70,
    'textfield-warning-focus-description-color': CColors.yellow30,
    'textfield-warning-disabled-description-color': CColors.gray30,

    /// error ///

    // label
    'textfield-error-enabled-label-color': CColors.gray70,
    'textfield-error-focus-label-color': CColors.gray70,
    'textfield-error-disabled-label-color': CColors.gray30,

    // hint
    'textfield-error-enabled-hint-color': CColors.gray40,
    'textfield-error-focus-hint-color': CColors.gray40,
    'textfield-error-disabled-hint-color': CColors.gray30,

    // text
    'textfield-error-enabled-text-color': CColors.gray90,
    'textfield-error-focus-text-color': CColors.gray90,
    'textfield-error-disabled-text-color': CColors.gray30,

    // description
    'textfield-error-enabled-description-color': CColors.gray70,
    'textfield-error-focus-description-color': CColors.red60,
    'textfield-error-disabled-description-color': CColors.gray30,
  };
}
