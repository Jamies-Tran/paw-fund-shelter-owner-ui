import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/template/paw_template.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PTemplate(
        desktop: SizedBox(child: Text("Desktop views"),),
        tablet: SizedBox(child: Text("Table views"),),
        mobile: SizedBox(child: Text("Mobile views"),),
        layoutVer: ELayoutVersion.verOne
    );
  }
}
