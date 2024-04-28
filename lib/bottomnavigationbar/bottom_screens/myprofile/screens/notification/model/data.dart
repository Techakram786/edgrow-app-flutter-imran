class Data {
  int? id;
  String? title;
  String? comment;
  String? createdAt;
  int? tableId;
  String? tableName;
  String? time;
  String? date;

  Data(
      {this.id,
        this.title,
        this.comment,
        this.createdAt,
        this.tableId,
        this.tableName,
        this.time,
        this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    comment = json['comment'];
    createdAt = json['created_at'];
    tableId = json['table_id'];
    tableName = json['table_name'];
    time = json['time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    data['table_id'] = tableId;
    data['table_name'] = tableName;
    data['time'] = time;
    data['date'] = date;
    return data;
  }
}