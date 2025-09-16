import 'dart:convert';
import 'dart:developer';
import 'package:firsteconomy/features/data/model/banner_model.dart';
import 'package:http/http.dart' as http;

class BannerRemoteDatasource {
  final client = http.Client();

  Stream<List<BannerModel>> fetchBanners() async* {
    final uri = Uri.parse( 'https://223f2e74-0a24-4c89-b7e7-6ffddb76a08c.mock.pstmn.io/api/fetchBannerImage', );

    try {
      final response = await client.get(
        uri,
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> data = jsonData['data'];
        final banners = data.map((e) => BannerModel.fromJson(e)).toList();
        yield banners;
      } else {
        log('unexeption: else case: ${response.statusCode} ${response.body}');
        throw Exception(
          'Failed to load banners. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      log('Unexeption Occured: $e');
      yield [];
    }
  }
}
