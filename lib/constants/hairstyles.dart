// ignore_for_file: constant_identifier_names

enum HairStyle {
  BuzzCut,
  UnderCut,
  SlickBack,
  CurlyShag,
  LongWavyCurtainBangs,
  MediumLengthWavy,
  CornrowBraids,
  LongHairTiedUp,
}

extension HairStyleExtension on HairStyle {
  String get name {
    switch (this) {
      case HairStyle.BuzzCut:
        return 'BuzzCut';
      case HairStyle.UnderCut:
        return 'UnderCut';
      case HairStyle.SlickBack:
        return 'SlickBack';
      case HairStyle.CurlyShag:
        return 'CurlyShag';
      case HairStyle.LongWavyCurtainBangs:
        return 'LongWavyCurtainBangs';
      case HairStyle.MediumLengthWavy:
        return 'MediumLengthWavy';
      case HairStyle.CornrowBraids:
        return 'CornrowBraids';
      case HairStyle.LongHairTiedUp:
        return 'LongHairTiedUp';
      default:
        return '';
    }
  }
}
