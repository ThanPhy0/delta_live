class SplashModel {
  Future<void> loadResources() async {
    // Simulate a resource-loading delay (e.g., fetching user data, checking authentication).
    await Future.delayed(const Duration(seconds: 3));
  }
}
