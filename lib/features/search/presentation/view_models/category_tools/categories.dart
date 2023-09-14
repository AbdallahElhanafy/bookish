import 'package:ebook_app/core/utils/assets.dart';

import 'Categories_model.dart';

class Categories {
  List<CategoriesModel> CategoriesList = [
    CategoriesModel(
        imageAsset: AssetsData.fiction, category: 'fiction'),
    CategoriesModel(
        imageAsset: AssetsData.fantasy, category: 'fantasy'),
    CategoriesModel(
        imageAsset: AssetsData.romance, category: 'romance'),
    CategoriesModel(
        imageAsset: AssetsData.science, category: 'science'),
    CategoriesModel(
        imageAsset: AssetsData.history, category: 'history'),
    CategoriesModel(imageAsset: AssetsData.action, category: 'action'),
  ];
}
