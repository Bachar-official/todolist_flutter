enum Importance {
  none,
  low,
  high;

  String getImportanceName() {
    switch (this) {
      case Importance.low:
        return 'Низкий';
      case Importance.high:
        return '!! Высокий';
      case Importance.none:
      default:
        return 'Нет';
    }
  }
}
