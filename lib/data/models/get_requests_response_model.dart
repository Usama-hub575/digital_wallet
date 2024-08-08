class MoneyRequest {
  final String id;
  final String senderName;
  final String recipientName;
  final String senderId;
  final String recipientId;
  final double amount;
  final String status;
  final String formattedDate;
  final String formattedTime;

  MoneyRequest({
    required this.id,
    required this.senderName,
    required this.recipientName,
    required this.senderId,
    required this.recipientId,
    required this.amount,
    required this.status,
    required this.formattedDate,
    required this.formattedTime,
  });

  factory MoneyRequest.fromJson(Map<String, dynamic> json) {
    return MoneyRequest(
      id: json['id'],
      senderName: json['sender_name'],
      recipientName: json['recipient_name'],
      senderId: json['sender_id'],
      recipientId: json['recipient_id'],
      amount: json['amount'].toDouble(),
      status: json['status'],
      formattedDate: json['formatted_date'],
      formattedTime: json['formatted_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_name': senderName,
      'recipient_name': recipientName,
      'sender_id': senderId,
      'recipient_id': recipientId,
      'amount': amount,
      'status': status,
      'formatted_date': formattedDate,
      'formatted_time': formattedTime,
    };
  }
}

class RequestsResponseModel {
  final List<MoneyRequest> all;
  final List<MoneyRequest> sent;
  final List<MoneyRequest> received;

  RequestsResponseModel({
    required this.all,
    required this.sent,
    required this.received,
  });

  factory RequestsResponseModel.fromJson(Map<String, dynamic> json) {
    return RequestsResponseModel(
      all: (json['all'] as List<dynamic>)
          .map((item) => MoneyRequest.fromJson(item as Map<String, dynamic>))
          .toList(),
      sent: (json['sent'] as List<dynamic>)
          .map((item) => MoneyRequest.fromJson(item as Map<String, dynamic>))
          .toList(),
      received: (json['received'] as List<dynamic>)
          .map((item) => MoneyRequest.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  static RequestsResponseModel empty() {
    return RequestsResponseModel(
      all: [],
      sent: [],
      received: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'all': all.map((request) => request.toJson()).toList(),
      'sent': sent.map((request) => request.toJson()).toList(),
      'received': received.map((request) => request.toJson()).toList(),
    };
  }
}
