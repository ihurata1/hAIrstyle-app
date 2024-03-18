// ignore_for_file: constant_identifier_names

enum HairStyleName {
  BuzzCut,
  UnderCut,
  SlickBack,
  CurlyShag,
  LongWavyCurtainBangs,
  MediumLengthWavy,
  CornrowBraids,
  LongHairTiedUp,
}

extension HairStyleExtension on HairStyleName {
  String get name {
    switch (this) {
      case HairStyleName.BuzzCut:
        return 'Buzz Cut';
      case HairStyleName.UnderCut:
        return 'Under Cut';
      case HairStyleName.SlickBack:
        return 'Slick Back';
      case HairStyleName.CurlyShag:
        return 'Curly Shag';
      case HairStyleName.LongWavyCurtainBangs:
        return 'Long Wavy Curtain Bangs';
      case HairStyleName.MediumLengthWavy:
        return 'Medium Length Wavy';
      case HairStyleName.CornrowBraids:
        return 'Cornrow Braids';
      case HairStyleName.LongHairTiedUp:
        return 'Long Hair Tied Up';
      default:
        return '';
    }
  }
}
