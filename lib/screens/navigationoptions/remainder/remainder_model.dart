class Reminder {
  String title;
  String notes;
  DateTime date;

  Reminder({required this.title, required this.notes, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'notes': notes,
      'date': date.toIso8601String(),
    };
  }
}
