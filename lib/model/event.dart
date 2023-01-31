class Event {
  final String title;
  final String detail;
  final DateTime dateTime;
  Event({required this.title, required this.detail, required this.dateTime});

  @override
  String toString() => title;
  String toS() => detail;
}
