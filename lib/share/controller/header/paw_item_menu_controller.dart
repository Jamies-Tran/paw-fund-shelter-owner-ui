
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/utils/paw_utils.dart';

class MenuItemController extends GetxController {
  final Rx<String> _currentHoveringRoute = "".obs;

  void setCurrentHoveringRoute(String route) {
    _currentHoveringRoute.value = route;
  }

  String getCurrentHoveringRoute() {
    return _currentHoveringRoute.value;
  }

  bool getIsMenuItemSelected(String route) {
    return PObjectUtils.isEquals(Get.currentRoute, route);
  }

  bool getIsMenuItemHovering(String currentRoute) {
    return PObjectUtils.isEquals(currentRoute, _currentHoveringRoute.value);
  }
}