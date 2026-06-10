class AppConfig {
  static const apiBaseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'https://api.example.com/api');
  static const requestTimeout = Duration(seconds: 30);
}
