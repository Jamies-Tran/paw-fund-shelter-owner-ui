import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/responsive_design.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/template/layout/paw_layout_v1.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/template/layout/paw_layout_v2.dart';

class PTemplate extends StatelessWidget {
  const PTemplate({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
    required this.layoutVer
  });

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;
  final ELayoutVersion layoutVer;

  @override
  Widget build(BuildContext context) {
    switch (layoutVer) {
      case ELayoutVersion.verOne:
        return ResponsiveDesign(
            desktop: PDesktopLayoutV1(body: desktop),
            tablet: PTabletLayoutV1(body: tablet),
            mobile: PMobileLayoutV1(body: mobile)
        );
      case ELayoutVersion.verTwo:
        return ResponsiveDesign(
            desktop: PDesktopLayoutV2(),
            tablet: PTabletLayoutV2(),
            mobile: PMobileLayoutV2()
        );
    }
  }
}
