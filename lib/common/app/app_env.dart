enum AppEnv {
  debug,
  production;

  static AppEnv fromString(String value) {
    switch (value) {
      case 'production':
        return AppEnv.production;
      default:
        return AppEnv.debug;
    }
  }
}
