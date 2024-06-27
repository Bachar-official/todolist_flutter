class Urls {
  static const baseUrl = 'https://beta.mrdekk.ru/todo';
  static String listUrl = '$baseUrl/list';
  static String idUrl(String id) => '$listUrl/$id';
}
