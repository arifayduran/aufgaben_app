class Cryptocurrency {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;

  Cryptocurrency({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
  });

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) {
    return Cryptocurrency(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: json['current_price'].toDouble(),
    );
  }
}


// JSON DATA EXAMPLE
//
// {
//        "id": "bitcoin",
//        "symbol": "btc",
//        "name": "Bitcoin",
//        "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
//        "current_price": 63964,
//        "market_cap": 1263053327463,
//        "market_cap_rank": 1,
//        "fully_diluted_valuation": 1343311181092,
//        "total_volume": 19767518373,
//        "high_24h": 64894,
//        "low_24h": 63608,
//        "price_change_24h": 17.3,
//        "price_change_percentage_24h": 0.02705,
//        "market_cap_change_24h": 805124211,
//        "market_cap_change_percentage_24h": 0.06378,
//        "circulating_supply": 19745328.0,
//        "total_supply": 21000000.0,
//        "max_supply": 21000000.0,
//        "ath": 73738,
//        "ath_change_percentage": -13.37995,
//        "ath_date": "2024-03-14T07:10:36.635Z",
//        "atl": 67.81,
//        "atl_change_percentage": 94093.74782,
//        "atl_date": "2013-07-06T00:00:00.000Z",
//        "roi": null,
//        "last_updated": "2024-08-26T11:39:12.220Z"
//    },
