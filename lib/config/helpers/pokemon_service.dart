import 'package:dio/dio.dart';


class PokemonService {
  
  static Future<String> getPokemonName(int id) async {

    final dio = Dio();
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon/${id}');
      return response.data['name'] ?? 'Name no found';

    } catch (e) {
      
      throw Exception('Pokemon no found');
    }
  }
}