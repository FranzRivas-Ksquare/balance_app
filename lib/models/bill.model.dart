class Bill {
  String? title;
  String type;
  num amount;
  String date;
  String? description;

  Bill({this.title, required this.type, required this.amount, required this.date, this.description});
}