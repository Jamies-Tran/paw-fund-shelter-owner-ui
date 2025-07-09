import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/registrations/controller/registration_controller.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/template/paw_template.dart';
import 'package:paw_fund_shelter_owner/share/widgets/icon/paw_icon.dart';
import 'package:paw_fund_shelter_owner/share/widgets/text/paw_text.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PTemplate(
        desktop: DesktopView(),
        tablet: SizedBox(child: Text("Table views"),),
        mobile: SizedBox(child: Text("Mobile views"),),
        layoutVer: ELayoutVersion.verOne
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrationController controller = Get.find();
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10.0
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PTextFormField(
                          labelText: "Họ",
                          hintText: "Nhập họ của bạn",
                          suffixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: controller.getIsFirstNameHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          enableBorderRadius: 10,
                          onTap: () => controller.setIsFirstNameHover(true),
                          onTapOutside: (_) => controller
                              .setIsFirstNameHover(false),

                        ),

                        PConstant.vDistance5,

                        PTextFormField(
                          labelText: "Tên",
                          hintText: "Nhập tên của bạn",
                          suffixIcon: Icon(
                            Icons.account_circle,
                            color: controller.getIsLastNameHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          enableBorderRadius: 10,
                          onTap: () => controller.setIsLastNameHover(true),
                          onTapOutside: (_) => controller
                              .setIsLastNameHover(false),
                        )
                      ],
                    ),

                    PConstant.hDistance10,

                    PTextFormField(
                      width: 410,
                      textInputType: TextInputType.emailAddress,
                      labelText: "Email",
                      hintText: "Nhập email của bạn",
                      suffixIcon: Icon(
                        Icons.email,
                        color: controller.getIsEmailHover()
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
                      onTap: () => controller.setIsEmailHover(true),
                      onTapOutside: (_) => controller.setIsEmailHover(false),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
