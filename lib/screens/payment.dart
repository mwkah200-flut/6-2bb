class PaymentMethod {
  final String type;
  final String cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final String cvv;

  PaymentMethod({
    required this.type,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvv,
  });

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "cardNumber": cardNumber,
      "expiryMonth": expiryMonth,
      "expiryYear": expiryYear,
      "cvv": cvv,
    };
  }
}