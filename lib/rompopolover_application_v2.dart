import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rompopolover_application_v2/types/posts.dart'; 
Future<List<Photo>> fetchImagenes() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return photoFromJson(json.encode(data));
  } else {
    throw Exception('Failed to load imagenes');
  }
}

void main() async {
  try {
    final List<Photo> imagenes = await fetchImagenes();
    print('Imágenes obtenidas:');
    for (var imagen in imagenes) {
      print('Id: ${imagen.id}\n Título: ${imagen.title}\n URL: ${imagen.url}');
    }
  } catch (e) {
    print('Error:$e');
  }
}