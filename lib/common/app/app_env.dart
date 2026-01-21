enum AppEnv {
  debug,
  staging,
  production;

  static AppEnv fromString(String value) {
    switch (value) {
      case 'production':
        return AppEnv.production;
      case 'staging':
        return AppEnv.staging;
      default:
        return AppEnv.debug;
    }
  }
}
