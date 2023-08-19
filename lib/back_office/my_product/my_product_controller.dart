import 'package:benji_vendor/back_office/user/user_provider.dart';
import 'package:provider/provider.dart';
import 'my_product_provider.dart';

class MyProductController {

  static Future<void> myProd(context) async {
    MyProductProvider provider =
        Provider.of<MyProductProvider>(context, listen: false);
    UserProvider user = Provider.of<UserProvider>(context, listen: false);
    provider.isLoadProduct(true);
    bool isDone = await provider.myProductFromApi(user.userId.id!.toString());
    if (isDone) {
      provider.isLoadProduct(false);
    } else {
      provider.isLoadProduct(false);
    }
    provider.isLoadProduct(false);
  }

  static Future<void> myVariety(context, id) async {
    MyProductProvider provider =
        Provider.of<MyProductProvider>(context, listen: false);
    provider.isLoadVariety(true);
    bool isDone = await provider.myProductVarietyFromApi(id!.toString());
    if (isDone) {
      if(provider.myProdVariety.isNotEmpty){
        await myOption(context, provider.myProdVariety.first.id);

      }      
      provider.isLoadVariety(false);
    } else {
      provider.isLoadVariety(false);
    }
    provider.isLoadVariety(false);
  }

  static Future<void> myOption(context, id) async {
    MyProductProvider provider =
        Provider.of<MyProductProvider>(context, listen: false);

    provider.isLoadOption(true);
    bool isDone = await provider.myVarietyOptionFromApi(id);
    if (isDone) {
      provider.isLoadOption(false);
    } else {
      provider.isLoadOption(false);
    }
    provider.isLoadOption(false);
  }
}
