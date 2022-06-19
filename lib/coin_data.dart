import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '503C234C-6914-4B3D-824A-CB22A7E01231';

class CoinData {
  Future getCoinData() async {
    http.Response response = await http.get('$coinAPIURL/BTC/USD?apikey=$apiKey');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var price = data['rate'];
      return price;
    } else {
      print(response.statusCode);
    }
  }
}
