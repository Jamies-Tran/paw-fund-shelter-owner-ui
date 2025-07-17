import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/template/paw_template.dart';

class AccountVerificationView extends StatelessWidget {
  const AccountVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return PTemplate(
      desktop: SizedBox(),
      tablet: SizedBox(),
      mobile: SizedBox(),
      layoutVer: ELayoutVersion.verOne,
    );
  }
}