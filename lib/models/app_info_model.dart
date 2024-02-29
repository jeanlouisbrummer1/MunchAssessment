class AppInfoModel {
  AppInfoModel._privateConstructor();

  static final AppInfoModel instance = AppInfoModel._privateConstructor();

  String version = '6.6.5';
  String environment = 'Production';
  String deviceID = 'ACEHFJD3-DJUFG-SJHFS-84YSS';

  Future<void> fetchAppInfo() async {
    Future.delayed(const Duration(seconds: 2), () {
      version = '6.6.5';
      environment = 'Production';
      deviceID = 'ACEHFJD3-DJUFG-SJHFS-84YSS';
    });
  }
}
