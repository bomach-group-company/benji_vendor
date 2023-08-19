import 'package:benji_vendor/back_office/my_product/my_product_provider.dart';
import 'package:benji_vendor/back_office/order/order_provider.dart';
import 'package:benji_vendor/back_office/ratings/rating_provider.dart';
import 'package:benji_vendor/back_office/upload_product/upload_prod_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../back_office/auth/auth_provider.dart';
import '../back_office/category/category_provider.dart';
import '../back_office/notification/notification_provider.dart';
import '../back_office/user/user_provider.dart';
import 'extras_provider.dart';

class InitProvider {
  static List<SingleChildWidget> providerInit() {
    final List<SingleChildWidget> provided = [
      ChangeNotifierProvider(
        create: (context) => ExtraProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MyProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoryProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SendProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MyOrderProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => NotificationProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => RatingProvider(),
      ),
      //   ChangeNotifierProvider(
      //   create: (context) => PayProvider(),
      // ),
    ];

    return provided;
  }
}
