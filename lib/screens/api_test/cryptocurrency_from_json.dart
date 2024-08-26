class Cryptocurrency {
  final String id;
  final String symbol;
  final String name;
  final double currentPrice;

  Cryptocurrency({
    required this.id,
    required this.symbol,
    required this.name,
    required this.currentPrice,
  });

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) {
    return Cryptocurrency(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      currentPrice: json['current_price'].toDouble(),
    );
  }
}
