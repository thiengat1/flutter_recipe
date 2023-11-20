import 'package:flutter/material.dart';
import 'package:flutter_recipe_list/models/recipe.api.dart';
import 'package:flutter_recipe_list/models/recipe.dart';
import 'package:flutter_recipe_list/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipesList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipesList = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
    print(_recipesList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Food Recipe')
          ]),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _recipesList.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipesList[index].name,
                      cookTime: _recipesList[index].totalTime,
                      rating: _recipesList[index].rating.toString(),
                      thumbnailUrl: _recipesList[index].images);
                },
              ));
  }
}
