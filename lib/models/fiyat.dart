import 'dart:convert';

class Fiyat {
  final int sell;
  final int high;
  final double buy;
  final double change_rate;
  final double bid;
  final double wavg;
  final double last_order;
  final double volume;
  final int low;
  final int ask;
  final double avg;
  Fiyat({
    this.sell,
    this.high,
    this.buy,
    this.change_rate,
    this.bid,
    this.wavg,
    this.last_order,
    this.volume,
    this.low,
    this.ask,
    this.avg,
  });

  Fiyat copyWith({
    int sell,
    int high,
    double buy,
    double change_rate,
    double bid,
    double wavg,
    double last_order,
    double volume,
    int low,
    int ask,
    double avg,
  }) {
    return Fiyat(
      sell: sell ?? this.sell,
      high: high ?? this.high,
      buy: buy ?? this.buy,
      change_rate: change_rate ?? this.change_rate,
      bid: bid ?? this.bid,
      wavg: wavg ?? this.wavg,
      last_order: last_order ?? this.last_order,
      volume: volume ?? this.volume,
      low: low ?? this.low,
      ask: ask ?? this.ask,
      avg: avg ?? this.avg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sell': sell,
      'high': high,
      'buy': buy,
      'change_rate': change_rate,
      'bid': bid,
      'wavg': wavg,
      'last_order': last_order,
      'volume': volume,
      'low': low,
      'ask': ask,
      'avg': avg,
    };
  }

  factory Fiyat.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Fiyat(
      sell: map['sell']?.toInt(),
      high: map['high']?.toInt(),
      buy: map['buy']?.toDouble(),
      change_rate: map['change_rate']?.toDouble(),
      bid: map['bid']?.toDouble(),
      wavg: map['wavg']?.toDouble(),
      last_order: map['last_order']?.toDouble(),
      volume: map['volume']?.toDouble(),
      low: map['low']?.toInt(),
      ask: map['ask']?.toInt(),
      avg: map['avg']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Fiyat.fromJson(String source) => Fiyat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Fiyat(sell: $sell, high: $high, buy: $buy, change_rate: $change_rate, bid: $bid, wavg: $wavg, last_order: $last_order, volume: $volume, low: $low, ask: $ask, avg: $avg)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Fiyat &&
      o.sell == sell &&
      o.high == high &&
      o.buy == buy &&
      o.change_rate == change_rate &&
      o.bid == bid &&
      o.wavg == wavg &&
      o.last_order == last_order &&
      o.volume == volume &&
      o.low == low &&
      o.ask == ask &&
      o.avg == avg;
  }

  @override
  int get hashCode {
    return sell.hashCode ^
      high.hashCode ^
      buy.hashCode ^
      change_rate.hashCode ^
      bid.hashCode ^
      wavg.hashCode ^
      last_order.hashCode ^
      volume.hashCode ^
      low.hashCode ^
      ask.hashCode ^
      avg.hashCode;
  }
}