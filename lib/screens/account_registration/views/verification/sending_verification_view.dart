import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/controller/verification/sending_verification_controller.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/template/paw_template.dart';
import 'package:paw_fund_shelter_owner/share/widgets/icon/paw_icon.dart';
import 'package:paw_fund_shelter_owner/share/widgets/text/paw_text.dart';

class SendingVerificationView extends StatelessWidget {
  const SendingVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    SendingVerificationController controller = Get.find();

    return PTemplate(
      desktop: DesktopView(controller: controller),
      tablet: SizedBox(),
      mobile: SizedBox(),
      layoutVer: ELayoutVersion.verOne,
    );
  }
}


class DesktopView extends StatefulWidget {
  const DesktopView({
    super.key,
    required this.controller
  });

  final SendingVerificationController controller;

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    formKey.currentState!.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Padding(
        padding: EdgeInsets.symmetric(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 600,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("sua.jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color(Colors.black.toARGB32()),
                        blurStyle: BlurStyle.solid,
                        blurRadius: 5.0
                    )
                  ]
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 600,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(Colors.black.toARGB32()),
                        blurStyle: BlurStyle.solid,
                        blurRadius: 5.0
                    )
                  ]
              ),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PTextFormField(
                        width: MediaQuery.of(context).size.width * 0.265,
                        readOnly: widget.controller.getIsToggleAccountEdit(),
                        enable: !widget.controller.getIsApiPending(),
                        controller: widget.controller.getEmailEditingController(),
                        textInputType: TextInputType.emailAddress,
                        labelText: "Email",
                        hintText: "Nhập email của bạn",
                        suffixIcon: PIcon(
                          iconData: Icons.email,
                          iconButtonData: Icons.clear,
                          isButton: widget.controller.getIsEmailEditing(),
                          onPress: () => widget.controller.clearEmailText(),
                          color: widget.controller.getIsBirthdayFocus()
                              ? Colors.orangeAccent
                              : Colors.black,
                        ),
                        enableBorderColor: Color(Colors.black.toARGB32()),
                        focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                        enableBorderRadius: 10,
                        validate: (value) {
                          if (PStringUtils.isEmpty(value)) {
                            return "Vui lòng nhập email";
                          }

                          if (!PStringUtils.isMatch(value, RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))) {
                            return "Email không hợp lệ";
                          }

                          return null;
                        },
                        onTap: () => widget.controller.setIsEmailFocus(true),
                        onTapOutside: (_) => widget.controller.setIsEmailFocus(false),
                        onChanged: (value) {
                          bool isValid = PStringUtils.isMatch(value, RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))
                              && PStringUtils.isNotEmpty(value);
                          widget.controller.setIsEmailValidate(isValid);
                        },
                      ),
                    ],
                  ),
              ),
            )
          ],
        ),
    );
  }
}


