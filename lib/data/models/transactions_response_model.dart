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
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // Adding copyWith method
  TransactionsResponseModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<Results>? results,
  }) {
    return TransactionsResponseModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_name'] = senderName;
    data['receiver_name'] = receiverName;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['amount'] = amount;
    data['formatted_date'] = formattedDate;
    data['formatted_time'] = formattedTime;
    data['status'] = status;
    return data;
  }

// Optionally, you can add a copyWith method here too if needed
}
