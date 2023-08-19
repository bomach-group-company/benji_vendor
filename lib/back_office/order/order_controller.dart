import 'package:benji_vendor/back_office/order/order_provider.dart';
import 'package:benji_vendor/back_office/user/user_provider.dart';
import 'package:benji_vendor/reusable%20widgets/toast.dart';
import 'package:benji_vendor/utility/allNavigation.dart';
import 'package:provider/provider.dart';

class MyOrderController {
  static Future<void> myOrder(context) async {
    MyOrderProvider provider =
        Provider.of<MyOrderProvider>(context, listen: false);
    UserProvider user = Provider.of<UserProvider>(context, listen: false);
    provider.isLoadOrder(true);
    bool isDone = await provider.myOrderFromApi(user.userId.id!.toString());
    if (isDone) {
      provider.isLoadOrder(false);
    } else {
      provider.isLoadOrder(false);
    }
    provider.isLoadOrder(false);
  }

  static Future<void> acceptOrder(context, id, [bool? fromModal]) async {
    MyOrderProvider provider =
        Provider.of<MyOrderProvider>(context, listen: false);
    if (fromModal == true) {
      inAppToast(context, "Accepting order please wait");
    }

    provider.isloadAccept(true);
    bool isDone = await provider.acceptOrderFromApi(id!.toString());
    if (isDone) {
      await myOrder(context);
      provider.isloadAccept(false);
      inAppToast(context, "Order accepted");
      PageRouting.popToPage(context);
    } else {
      provider.isloadAccept(false);
      inAppToast(context, "Failed to accepted order", isError: true);
    }
    provider.isloadAccept(false);
  }

  static Future<void> cancelOrder(context, id, [bool? fromModal]) async {
    MyOrderProvider provider =
        Provider.of<MyOrderProvider>(context, listen: false);
    if (fromModal == true) {
      inAppToast(context, "Canceling order please wait");
    }

    provider.isloadCancel(true);
    bool isDone = await provider.cancelOrderFromApi(id!.toString());
    if (isDone) {
      await myOrder(context);
      provider.isloadCancel(false);
      inAppToast(context, "Order cancelled");
      PageRouting.popToPage(context);
    } else {
      provider.isloadCancel(false);
      inAppToast(context, "Failed to cancel order", isError: true);
    }
    provider.isloadCancel(false);
  }

  static Future<void> declineOrder(context, id) async {
    MyOrderProvider provider =
        Provider.of<MyOrderProvider>(context, listen: false);

    provider.isloadDecline(true);
    bool isDone = await provider.declineOrderFromApi(id!.toString());
    if (isDone) {
      await myOrder(context);
      provider.isloadDecline(false);
    } else {
      provider.isloadDecline(false);
    }
    provider.isloadDecline(false);
  }
}
