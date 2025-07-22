import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/login/controller/login_controller.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/template/paw_template.dart';
import 'package:paw_fund_shelter_owner/share/widgets/animation/paw_animation.dart';
import 'package:paw_fund_shelter_owner/share/widgets/button/paw_button.dart';
import 'package:paw_fund_shelter_owner/share/widgets/icon/paw_icon.dart';
import 'package:paw_fund_shelter_owner/share/widgets/progresss_bar/progress_bar.dart';
import 'package:paw_fund_shelter_owner/share/widgets/text/paw_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();

    return PTemplate(
        desktop: DesktopView(controller: controller),
        tablet: SizedBox(),
        mobile: SizedBox(),
        layoutVer: ELayoutVersion.verOne
    );
  }
}

class DesktopView extends StatefulWidget {
  const DesktopView({
    super.key,
    required this.controller
  });

  final LoginController controller;

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
    formKey.currentState!.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Obx(() => Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 100
            ),
            child: PAnimation(
              beginAnimate: 0.5,
              endAnimate: 1.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 450,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PText(
                                content: "Chào mừng bạn đến với PawFund",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                textColor: Colors.orangeAccent,
                            ),
                            PConstant.hDistance50,
                            PTextFormField(
                              width: MediaQuery.of(context).size.width * 0.265,
                              enable: !widget.controller.getIsApiPending(),
                              controller: widget.controller.getEmailController(),
                              textInputType: TextInputType.emailAddress,
                              labelText: "Email",
                              hintText: "Nhập email của bạn",
                              suffixIcon: PIcon(
                                iconData: Icons.email,
                                iconButtonData: Icons.clear,
                                isButton: widget.controller.getIsEmailEditing(),
                                onPress: () => widget.controller.clearEmailText(),
                                color: widget.controller.getIsEmailFocus()
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
                                widget.controller.setIsEmailEditing();
                              },
                            ),
                            PConstant.hDistance15,
                            PTextFormField(
                              width: MediaQuery.of(context).size.width * 0.265,
                              obscureText: true,
                              enable: !widget.controller.getIsApiPending(),
                              controller: widget.controller.getPasswordController(),
                              labelText: "Password",
                              hintText: "Nhập mật khẩu",
                              suffixIcon: PIcon(
                                iconData: Icons.password,
                                iconButtonData: Icons.clear,
                                isButton: widget.controller.getIsPasswordEditing(),
                                onPress: () => widget.controller.clearPasswordText(),
                                color: widget.controller.getIsPasswordEditing()
                                    ? Colors.orangeAccent
                                    : Colors.black,
                              ),
                              enableBorderColor: Color(Colors.black.toARGB32()),
                              focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                              enableBorderRadius: 10,
                              validate: (value) {
                                if (PStringUtils.isEmpty(value)) {
                                  return "Vui lòng nhập mật khẩu";
                                }

                                return null;
                              },
                              onTap: () => widget.controller.setIsPasswordFocus(true),
                              onTapOutside: (_) => widget.controller.setIsPasswordFocus(false),
                              onChanged: (value) {
                                bool isValid = PStringUtils.isNotEmpty(value);
                                widget.controller.setIsPasswordValidate(isValid);
                                widget.controller.setIsEmailEditing();
                              },
                            ),

                            PConstant.hDistance50,

                            PWidgetUtils.chooseWithCondition(
                              widget.controller.getIsApiPending(),
                              PProgressBar(progressColors: [Colors.white, Colors.orangeAccent],),
                              PHoverButton(
                                width: MediaQuery.of(context).size.width * 0.265,
                                height: MediaQuery.of(context).size.height * 0.07,
                                title: Text("Đăng nhập",),
                                backgroundColor: PObjectUtils.chooseWithCondition(
                                    widget.controller.getIsDataValidated(),
                                    Color(Colors.orangeAccent.toARGB32()),
                                    Color(Colors.grey.toARGB32())
                                ),
                                backgroundColorHover: PObjectUtils.chooseWithCondition(
                                    widget.controller.getIsDataValidated(),
                                    Color(Colors.white.toARGB32()),
                                    null
                                ),
                                textColor: PObjectUtils.chooseWithCondition(
                                    widget.controller.getIsDataValidated(),
                                    Color(Colors.white.toARGB32()),
                                    Color(Colors.black.toARGB32()),
                                ),
                                textColorHover: PObjectUtils.chooseWithCondition(
                                    widget.controller.getIsDataValidated(),
                                    Color(Colors.orangeAccent.toARGB32()),
                                    null
                                ),
                                fontWeight: FontWeight.bold,
                                shape: RoundedRectangleBorder(),
                                shapeHover: RoundedRectangleBorder(),
                                textSize: 13,
                                textSizeHover: 17,
                                onPress:() {
                                  if (widget.controller.getIsDataValidated() && formKey.currentState!.validate()) {
                                    widget.controller.login();
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 450 ,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(LOGIN_IMG),
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
                ],
              ),
            ),
          ),
        )
    ),);
  }
}

