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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['received'] = this.received;
    data['sent'] = this.sent;
    data['received_sum'] = this.receivedSum;
    data['sent_sum'] = this.sentSum;
    return data;
  }
}
