class ContactModel {
  String fromTime;
  String toTime;
  String pastFromTime;
  String pastToTime;
  bool last;
  int id;

  ContactModel({
    required this.id,
    required this.toTime,
    required this.last,
    required this.pastFromTime,
    required this.pastToTime,
    required this.fromTime,
  });
}
