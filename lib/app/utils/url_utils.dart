class UrlUtils {

  /// Needed only for getting raw url to create [Uri.https]
  static String trimUrl(String url) {
    if (url.contains('https://')) {
      return url.replaceAll('https://', '');
    }
    return url;
  }
}
