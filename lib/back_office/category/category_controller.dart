import 'package:provider/provider.dart';


import 'category_provider.dart';

class CategoryController {
  static Future<void> contactCat(context) async {
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: false);
    // provider.isLoadCat(true);
    bool isDone = await provider.catFromApi();
    if (isDone) {
      //   provider.isLoadCat(false);
    } else {
      //  provider.isLoadCat(false);
    }
  }


   static Future<void> contactSubCat(context) async {
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: false);
    // provider.isLoadCat(true);
    bool isDone = await provider.subCatFromApi();
    if (isDone) {
      //   provider.isLoadCat(false);
    } else {
      //  provider.isLoadCat(false);
    }
  }


}
