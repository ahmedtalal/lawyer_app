class VisaCardParameter {
  final String planID;
  final String cardName;
  final String cardNumber;
  final String cardCvc;
  final String cardExpMonth;
  final String cardExpYeaar;

  VisaCardParameter({
    required this.planID,
    required this.cardName,
    required this.cardNumber,
    required this.cardCvc,
    required this.cardExpMonth,
    required this.cardExpYeaar,
  });

  Map<String, dynamic> toJson() => {
        "plan_id": planID,
        "card_name": cardName,
        "card_number": cardNumber,
        "card_cvc": cardCvc,
        "card_expiry_month": cardExpMonth,
        "card_expiry_year": cardExpYeaar,
      };
}
