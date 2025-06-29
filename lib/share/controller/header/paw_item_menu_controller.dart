
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/utils/paw_utils.dart';

class MenuItemController extends GetxController {
  final Rx<String> _currentHoveringRoute = "".obs;
  final Rx<bool> _isSubMenuItemHovering = false.obs;

  void setCurrentHoveringRoute(String route) {
    _currentHoveringRoute.value = route;
  }

  String getCurrentHoveringRoute() {
    return _currentHoveringRoute.value;
  }

  bool getIsMenuItemSelected(String route) {
    return PObjectUtils.isEquals(Get.currentRoute, route);
  }

  bool getIsSubMenuItemHovering() {
    return _isSubMenuItemHovering.value;
  }

  void setIsSubMenuItemHovering(bool isHover) {
     _isSubMenuItemHovering.value = isHover;
  }

  bool getIsMenuItemHovering(String currentRoute) {
    return PObjectUtils.isEquals(currentRoute, _currentHoveringRoute.value);
  }
}