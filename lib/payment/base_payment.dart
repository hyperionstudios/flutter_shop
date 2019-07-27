class BasePayment{

  String paymentID;
  double amount;
  DateTime paymentDate;
  String paymentMethod;

  BasePayment(this.paymentID, this.amount, this.paymentDate,
      this.paymentMethod);

  BasePayment.fromJson( Map<String,dynamic> jsonbject ){
    this.paymentID = jsonbject['payment_id'];
    this.amount = jsonbject['amount'];
    this.paymentDate = DateTime.parse(jsonbject['payment_date']);
    this.paymentMethod = jsonbject['payment_method'];
  }


}