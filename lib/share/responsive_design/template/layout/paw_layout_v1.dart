import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/widgets/header/paw_header.dart';
import 'package:paw_fund_shelter_owner/share/widgets/sidebar/paw_side_bar.dart';

class PDesktopLayoutV1 extends StatelessWidget {
  const PDesktopLayoutV1({
    super.key,
    required this.body
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(),
          child: Column(
            children: [
              PHeader(layoutVersion: ELayoutVersion.verOne,),
              body
            ],
          ),
      ),
    );
  }
}

class PTabletLayoutV1 extends StatelessWidget {
  const PTabletLayoutV1({
    super.key,
    required this.body
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PHeader(layoutVersion: ELayoutVersion.verOne),
      drawer: Drawer(
        child: PSideBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(),
        child: Column(
          children: [
            body
          ],
        ),
      ),
    );
  }
}

class PMobileLayoutV1 extends StatelessWidget {
  const PMobileLayoutV1({
    super.key,
    required this.body
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PHeader(layoutVersion: ELayoutVersion.verOne),
      drawer: Drawer(
        child: PSideBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(),
        child: Column(
          children: [
            body
          ],
        ),
      ),
    );
  }
}
