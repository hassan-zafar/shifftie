class ThemeConfig {
  String? mainColor;
  // String logo = logo;
  String? backgroundColor;
  String? primaryColorLight;
  String? textColor;
  String? secondaryColor;

  ThemeConfig({
    this.mainColor,
    // this.logo = logo,
    this.backgroundColor,
    this.primaryColorLight,
    this.textColor,
    this.secondaryColor,
  });

  ThemeConfig.fromJson(Map config) {
    // logo = config['logo'] ?? kLogo;
    mainColor = config['MainColor'];
    backgroundColor = config['backgroundColor'];
    primaryColorLight = config['primaryColorLight'];
    textColor = config['textColor'];
    secondaryColor = config['secondaryColor'];
  }

  Map? toJson() {
    var map = <String, dynamic>{};
    map['MainColor'] = mainColor;
    // map['logo'] = logo;
    map['backgroundColor'] = backgroundColor;
    map['primaryColorLight'] = primaryColorLight;
    map['textColor'] = textColor;
    map['secondaryColor'] = secondaryColor;
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
