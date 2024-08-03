class SentTransaction {
  final String id;
  final String senderName;
  final String recipientName;
  final String senderId;
  final String recipientId;
  final int amount;
  final String status;
  final String formattedDate;
  final String formattedTime;

  SentTransaction({
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

  // Factory constructor to create an instance from JSON
  factory SentTransaction.fromJson(Map<String, dynamic> json) {
    return SentTransaction(
      id: json['id'],
      senderName: json['sender_name'],
      recipientName: json['recipient_name'],
      senderId: json['sender_id'],
      recipientId: json['recipient_id'],
      amount: json['amount'],
      status: json['status'],
      formattedDate: json['formatted_date'],
      formattedTime: json['formatted_time'],
    );
  }

  // Method to convert an instance to JSON
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

class ReceivedTransaction {
  final String id;
  final String senderName;
  final String recipientName;
  final String senderId;
  final String recipientId;
  final int amount;
  final String status;
  final String formattedDate;
  final String formattedTime;

  ReceivedTransaction({
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

  // Factory constructor to create an instance from JSON
  factory ReceivedTransaction.fromJson(Map<String, dynamic> json) {
    return ReceivedTransaction(
      id: json['id'],
      senderName: json['sender_name'],
      recipientName: json['recipient_name'],
      senderId: json['sender_id'],
      recipientId: json['recipient_id'],
      amount: json['amount'],
      status: json['status'],
      formattedDate: json['formatted_date'],
      formattedTime: json['formatted_time'],
    );
  }

  // Method to convert an instance to JSON
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
  final List<SentTransaction> sent;
  final List<ReceivedTransaction> received;

  RequestsResponseModel({
    required this.sent,
    required this.received,
  });

  // Factory constructor to create an instance from JSON
  factory RequestsResponseModel.fromJson(Map<String, dynamic> json) {
    return RequestsResponseModel(
      sent: (json['sent'] as List)
          .map((item) => SentTransaction.fromJson(item))
          .toList(),
      received: (json['received'] as List)
          .map((item) => ReceivedTransaction.fromJson(item))
          .toList(),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'sent': sent.map((item) => item.toJson()).toList(),
      'received': received.map((item) => item.toJson()).toList(),
    };
  }

  static RequestsResponseModel empty() {
    return RequestsResponseModel(
      sent: [],
      received: [],
    );
  }
}
