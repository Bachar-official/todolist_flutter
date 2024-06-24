class Urls {
  static const _baseUrl = 'https://beta.mrdekk.ru/todo';
  static String listUrl = '$_baseUrl/list';
  static String idUrl(String id) => '$_baseUrl/list/$id';
}