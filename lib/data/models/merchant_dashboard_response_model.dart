class MerchantDashboardResponseModel {
  int? total;
  int? received;
  int? sent;
  int? receivedSum;
  int? sentSum;

  MerchantDashboardResponseModel({
    this.total,
    this.received,
    this.sent,
    this.receivedSum,
    this.sentSum,
  });

  MerchantDashboardResponseModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    received = json['received'];
    sent = json['sent'];
    receivedSum = json['received_sum'];
    sentSum = json['sent_sum'];
  }

  static MerchantDashboardResponseModel empty() {
    return MerchantDashboardResponseModel(
      received: 0,
      receivedSum: 0,
      sent: 0,
      sentSum: 0,
      total: 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['received'] = received;
    data['sent'] = sent;
    data['received_sum'] = receivedSum;
    data['sent_sum'] = sentSum;
    return data;
  }
}
