class TransactionsResponseModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  TransactionsResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  TransactionsResponseModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static TransactionsResponseModel empty() {
    return TransactionsResponseModel(
      count: 0,
      next: '',
      previous: '',
      results: [],
    );
  }
}

class Results {
  int? id;
  String? senderName;
  String? receiverName;
  String? senderId;
  String? receiverId;
  int? amount;
  String? formattedDate;
  String? formattedTime;
  String? status;

  Results({
    this.id,
    this.senderName,
    this.receiverName,
    this.senderId,
    this.receiverId,
    this.amount,
    this.formattedDate,
    this.formattedTime,
    this.status,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderName = json['sender_name'];
    receiverName = json['receiver_name'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    amount = json['amount'];
    formattedDate = json['formatted_date'];
    formattedTime = json['formatted_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_name'] = this.senderName;
    data['receiver_name'] = this.receiverName;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['amount'] = this.amount;
    data['formatted_date'] = this.formattedDate;
    data['formatted_time'] = this.formattedTime;
    data['status'] = this.status;
    return data;
  }
}
