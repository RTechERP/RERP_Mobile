class AppInfo {
  final String appId;
  final String appStoreUrl;
  final String googlePlayUrl;
  final String termsAndConditions;
  final String termsOfService;
  final String privacyPolicy;

  const AppInfo({
    required this.appId,
    required this.appStoreUrl,
    required this.googlePlayUrl,
    this.termsAndConditions =
        'Purchase will be applied to your iTunes account at the and of the trial. Subscriptions will automatically renew unless canceled within 24-hours before the end of the current period.You can cancel anytime with your iTunes account settings',
    this.termsOfService = 'Terms of Service',
    this.privacyPolicy = 'Privacy Policy',
  });

  AppInfo copyWith({
    String? appId,
    int? bookId,
    String? appStoreUrl,
    String? googlePlayUrl,
    String? termsAndConditions,
    String? termsOfService,
    String? privacyPolicy,
  }) {
    return AppInfo(
      appId: appId ?? this.appId,

      appStoreUrl: appStoreUrl ?? this.appStoreUrl,
      googlePlayUrl: googlePlayUrl ?? this.googlePlayUrl,
      termsAndConditions: termsAndConditions ?? this.termsAndConditions,
      termsOfService: termsOfService ?? this.termsOfService,
      privacyPolicy: privacyPolicy ?? this.privacyPolicy,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appId': appId,

      'appStoreUrl': appStoreUrl,
      'googlePlayUrl': googlePlayUrl,
      'termsAndConditions': termsAndConditions,
      'termsOfService': termsOfService,
      'privacyPolicy': privacyPolicy,
    };
  }

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      appId: json['appId'],

      appStoreUrl: json['appStoreUrl'],
      googlePlayUrl: json['googlePlayUrl'],
      termsAndConditions: json['termsAndConditions'],
      termsOfService: json['termsOfService'],
      privacyPolicy: json['privacyPolicy'],
    );
  }
}
