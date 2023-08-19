import 'package:benji_vendor/back_office/ratings/rating_provider.dart';
import 'package:benji_vendor/back_office/user/user_provider.dart';
import 'package:provider/provider.dart';


class RatingController {
  static Future<void> vendorRating(context) async {
    RatingProvider provider =
        Provider.of<RatingProvider>(context, listen: false);
    UserProvider user = Provider.of<UserProvider>(context, listen: false);
    provider.isLoad(true);
    bool isDone =
        await provider.ratingFromApi(user.userId.id!.toString());
    if (isDone) {
      provider.isLoad(false);
    } else {
      provider.isLoad(false);
    }
    provider.isLoad(false);
  }


   static Future<void> averageRating(context) async {
    RatingProvider provider =
        Provider.of<RatingProvider>(context, listen: false);
    UserProvider user = Provider.of<UserProvider>(context, listen: false);
   
    bool isDone =
        await provider.averageFromApi(user.userId.id!.toString());
    if (isDone) {
     
    } else {
      
    }
  }
}
