import 'package:benji_vendor/back_office/user/user_provider.dart';
import 'package:provider/provider.dart';

import 'notification_provider.dart';

class NotificaionController {
  static Future<void> notify(context) async {
    NotificationProvider provider =
        Provider.of<NotificationProvider>(context, listen: false);
    UserProvider user = Provider.of<UserProvider>(context, listen: false);
    provider.isLoadCat(true);
    bool isDone =
        await provider.notificationFromApi(user.userId.id!.toString());
    if (isDone) {
      provider.isLoadCat(false);
    } else {
      provider.isLoadCat(false);
    }
    provider.isLoadCat(false);
  }
}
