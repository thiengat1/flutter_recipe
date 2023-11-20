import 'dart:convert';
import 'package:flutter_recipe_list/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', 'feeds/list',
        {'limit': '24', 'start': '0', 'tag': 'list.recipe.popular'});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '81d4d4a279mshef86a3bd3b9c6cdp113c8djsn1a85fe72054f',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });
    Map data = jsonDecode(response.body);
    List temp = [];
    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(temp);
  }
}
