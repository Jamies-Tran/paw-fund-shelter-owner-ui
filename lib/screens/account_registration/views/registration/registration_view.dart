import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/controller/register/registration_controller.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/template/paw_template.dart';
import 'package:paw_fund_shelter_owner/share/widgets/animation/paw_animation.dart';
import 'package:paw_fund_shelter_owner/share/widgets/button/paw_button.dart';
import 'package:paw_fund_shelter_owner/share/widgets/icon/paw_icon.dart';
import 'package:paw_fund_shelter_owner/share/widgets/progresss_bar/progress_bar.dart';
import 'package:paw_fund_shelter_owner/share/widgets/text/paw_text.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrationController controller = Get.find();

    return PTemplate(
        desktop: DesktopView(controller: controller,),
        tablet: TabletView(),
        mobile: MobileView(),
        layoutVer: ELayoutVersion.verOne,
    );
  }
}

class DesktopView extends StatefulWidget {
  const DesktopView({
    super.key,
    required this.controller
  });

  final RegistrationController controller;

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    formKey.currentState!.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() => Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 31.5,
          ),
          child: PAnimation(
            beginAnimate: 0.5,
            endAnimate: 1.0,
            duration: Duration(seconds: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 600,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(REGISTRATION_IMG),
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
                        PConstant.hDistance30,

                        PTextFormField(
                          width: MediaQuery.of(context).size.width * 0.265,
                          enable: !widget.controller.getIsPending(),
                          controller: widget.controller.getEmailController(),
                          textInputType: TextInputType.emailAddress,
                          labelText: "Email",
                          hintText: "Nhập email của bạn",
                          suffixIcon: PIcon(
                            iconData: Icons.email,
                            iconButtonData: Icons.clear,
                            isButton: widget.controller.getIsEmailEditing(),
                            onPress: () => widget.controller.clearEmailText(),
                            color: widget.controller.getIsEmailHover()
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
                          onTap: () => widget.controller.setIsEmailHover(true),
                          onTapOutside: (_) => widget.controller.setIsEmailHover(false),
                          onChanged: (value) {
                            bool isValid = PStringUtils.isMatch(value, RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))
                              && PStringUtils.isNotEmpty(value);
                            widget.controller.setIsEmailValidate(isValid);
                          },
                        ),

                        PConstant.hDistance15,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PTextFormField(
                              width: MediaQuery.of(context).size.width * 0.13,
                              enable: !widget.controller.getIsPending(),
                              controller: widget.controller.getPasswordController(),
                              obscureText: true,
                              labelText: "Mật khẩu",
                              hintText: "Nhập mật khẩu của bạn",
                              suffixIcon: PIcon(
                                iconData: Icons.password,
                                iconButtonData: Icons.clear,
                                isButton: widget.controller.getIsPasswordEditing(),
                                onPress: () => widget.controller.clearPasswordText(),
                                color: widget.controller.getIsPasswordHover()
                                    ? Colors.orangeAccent
                                    : Colors.black,
                              ),
                              enableBorderColor: Color(Colors.black.toARGB32()),
                              focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                              focusErrorBorderColor: Color(Colors.red.shade100.toARGB32()),
                              enableBorderRadius: 10,
                              validate: (value) {
                                if (PStringUtils.isEmpty(value)) {
                                  return "Vui lòng nhập mật khẩu";
                                }

                                return null;
                              },
                              onTap: () => widget.controller.setIsPasswordHover(true),
                              onTapOutside: (_) => widget.controller
                                  .setIsPasswordHover(false),
                              onChanged: (value) => widget.controller
                                  .setIsPasswordValidate(PStringUtils.isNotEmpty(value)),
                            ),

                            PConstant.vDistance5,

                            PTextFormField(
                              width: MediaQuery.of(context).size.width * 0.13,
                              enable: !widget.controller.getIsPending(),
                              controller: widget.controller.getRePasswordController(),
                              obscureText: true,
                              labelText: "Xác nhận mật khẩu",
                              hintText: "Nhập lại mật khẩu của bạn",
                              suffixIcon: PIcon(
                                iconData:  Icons.password,
                                iconButtonData: Icons.clear,
                                isButton: widget.controller.getIsRePasswordEditing(),
                                onPress: () => widget.controller.clearRePasswordText(),
                                color: widget.controller.getIsRePasswordHover()
                                    ? Colors.orangeAccent
                                    : Colors.black,
                              ),
                              enableBorderColor: Color(Colors.black.toARGB32()),
                              focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                              focusErrorBorderColor: Color(Colors.red.shade100.toARGB32()),
                              enableBorderRadius: 10,
                              validate: (value) {
                                if(PStringUtils.isEmpty(value)) {
                                  return "Vui lòng nhập lại mật khẩu";
                                }

                                if (!widget.controller.getIsRePasswordMatch()) {
                                  return "Mật khẩu không khớp";
                                }

                                return null;
                              },
                              onTap: () => widget.controller.setIsRePasswordHover(true),
                              onTapOutside: (_) => widget.controller
                                     .setIsRePasswordHover(false),
                              onChanged: (value) {
                                widget.controller
                                    .setIsRePasswordValidate(PStringUtils.isNotEmpty(value));
                              },

                            ),
                          ],
                        ),

                        PConstant.hDistance50,

                        PDateRangePicker(
                          width: MediaQuery.of(context).size.width * 0.265,
                          enable: !widget.controller.getIsPending(),
                          controller: widget.controller.getBirthdayController(),
                          selectionColor: Colors.orangeAccent,
                          backgroundColor: Colors.white,
                          textInputType: TextInputType.emailAddress,
                          labelText: "Ngày sinh",
                          hintText: "Chọn ngày sinh của bạn",
                          suffixIcon: PIcon(
                            iconData: Icons.cake,
                            iconButtonData: Icons.clear,
                            isButton: widget.controller.getIsBirthdayEditing(),
                            onPress: () => widget.controller.clearBirthdayText(),
                            color: widget.controller.getIsBirthdayHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          enableBorderRadius: 10,
                          validate: (value) {
                            if (PStringUtils.isEmpty(value)) {
                              return "Vui lòng nhập ngày sinh của bạn";
                            }

                            return null;
                          },
                          onSelectionChanged: (value) {
                            widget.controller.setBirthdayControllerText(value.value.toString().substring(0, 10));
                            widget.controller.setIsBirthdayValidate();
                          },
                          maxDate: DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
                        ),

                        PConstant.hDistance15,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PTextFormField(
                              width: MediaQuery.of(context).size.width * 0.13,
                              enable: !widget.controller.getIsPending(),
                              controller: widget.controller.getFirstNameController(),
                              labelText: "Họ",
                              hintText: "Nhập họ của bạn",
                              suffixIcon: PIcon(
                                iconData: Icons.account_circle_outlined,
                                iconButtonData: Icons.clear,
                                isButton: widget.controller.getIsFirstNameEditing(),
                                onPress: () => widget.controller.clearFirstNameText(),
                                color: widget.controller.getIsFirstNameHover()
                                    ? Colors.orangeAccent
                                    : Colors.black,
                              ),
                              enableBorderColor: Color(Colors.black.toARGB32()),
                              focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                              focusErrorBorderColor: Color(Colors.red.shade100.toARGB32()),
                              enableBorderRadius: 10,
                              validate: (value) {
                                if (PStringUtils.isEmpty(value)) {
                                  return "Vui lòng nhập họ của bạn";
                                }

                                return null;
                              },
                              onTap: () => widget.controller.setIsFirstNameHover(true),
                              onTapOutside: (_) => widget.controller
                                  .setIsFirstNameHover(false),
                              onChanged: (value) {
                                widget.controller.setIsFirstNameValidate(PStringUtils
                                    .isNotEmpty(value));
                              },

                            ),

                            PConstant.vDistance5,

                            PTextFormField(
                              width: MediaQuery.of(context).size.width * 0.13,
                              enable: !widget.controller.getIsPending(),
                              controller: widget.controller.getLastNameController(),
                              labelText: "Tên",
                              hintText: "Nhập tên của bạn",
                              suffixIcon: PIcon(
                                iconData: Icons.account_circle,
                                iconButtonData: Icons.clear,
                                isButton: widget.controller.getIsLastNameEditing(),
                                onPress: () => widget.controller.clearLastNameText(),
                                color: widget.controller.getIsLastNameHover()
                                    ? Colors.orangeAccent
                                    : Colors.black,
                              ),
                              enableBorderColor: Color(Colors.black.toARGB32()),
                              focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                              enableBorderRadius: 10,
                              validate: (value) {
                                if (PStringUtils.isEmpty(value)) {
                                  return "Vui lòng nhập tên của bạn";
                                }

                                return null;
                              },
                              onTap: () => widget.controller.setIsLastNameHover(true),
                              onTapOutside: (_) => widget.controller
                                  .setIsLastNameHover(false),
                              onChanged: (value) {
                                widget.controller.setIsLastNameValidate(PStringUtils
                                    .isNotEmpty(value));
                              },
                            )
                          ],
                        ),

                        PConstant.hDistance15,

                        PTextFormField(
                            width: MediaQuery.of(context).size.width * 0.265,
                            enable: !widget.controller.getIsPending(),
                            controller: widget.controller.getPhoneController(),
                            labelText: "Số điện thoại",
                            hintText: "Nhập số điện thoại của bạn",
                            textInputType: TextInputType.number,
                            suffixIcon: PIcon (
                              iconData: Icons.phone,
                              iconButtonData: Icons.clear,
                              isButton: widget.controller.getIsPhoneEditing(),
                              onPress: () => widget.controller.clearPhoneText(),
                              color: widget.controller.getIsPhoneHover()
                                  ? Colors.orangeAccent
                                  : Colors.black,
                            ),
                            enableBorderColor: Color(Colors.black.toARGB32()),
                            focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                            enableBorderRadius: 10,
                            validate: (value) {
                              if (PStringUtils.isEmpty(value)) {
                                return "Vui lòng nhập số điện thoại";
                              }

                              if (!PStringUtils.isMatch(value, RegExp(r'^(?:\+84|0)(3[2-9]|5[2689]|7[0-9]|8[1-9]|9[0-9])[0-9]{7}$'))) {

                                return "Số điện thoại không hợp lệ";

                              }
                              return null;
                            },
                            onTap: () => widget.controller.setIsPhoneHover(true),
                            onTapOutside: (_) => widget.controller
                                .setIsPhoneHover(false),
                            onChanged: (value) {
                              bool isValidated = PStringUtils.isMatch(value, RegExp(r'^(?:\+84|0)(3[2-9]|5[2689]|7[0-9]|8[1-9]|9[0-9])[0-9]{7}$'))
                                  && PStringUtils.isNotEmpty(value);
                              widget.controller.setIsPhoneValidate(isValidated);
                            }
                        ),

                        PConstant.hDistance50,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              PText(
                                  content: "Bạn đã có tài khoản?",
                                  fontSize: 15,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'Đăng nhập tại đây',
                                      style: TextStyle(color: Colors.orangeAccent, decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(PRoute.loginView),
                                    ),
                                  ]
                                ),
                              )
                          ]
                        ),

                        PConstant.hDistance10,
                        PWidgetUtils.chooseWithCondition(
                          widget.controller.getIsPending(),
                          PProgressBar(progressColors: [Colors.white, Colors.orangeAccent],),
                          PButton(
                            width: MediaQuery.of(context).size.width * 0.245,
                            title: PText(
                              content: "Đăng ký",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              textColor: Color(Colors.white.toARGB32()),
                            ),
                            backgroundColor: widget.controller.getIsDataValidated()
                                ? Color(Colors.green.toARGB32())
                                : Color(Colors.grey.toARGB32()),
                            onPress:() {
                              if (widget.controller.getIsDataValidated() && formKey.currentState!.validate()) {
                                widget.controller.register();
                              }

                            },
                          )
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}


class TabletView extends StatefulWidget {
  const TabletView({super.key});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {

  RegistrationController controller = Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 31.5,
            ),
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                  color: Color(Colors.white.toARGB32()),
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
                    PConstant.hDistance30,

                    PTextFormField(
                      enable: !controller.getIsPending(),
                      controller: controller.getEmailController(),
                      width: 410,
                      textInputType: TextInputType.emailAddress,
                      labelText: "Email",
                      hintText: "Nhập email của bạn",
                      suffixIcon: PIcon(
                        iconData: Icons.email,
                        iconButtonData: Icons.clear,
                        isButton: controller.getIsEmailEditing(),
                        onPress: () => controller.clearEmailText(),
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
                      onChanged: (value) {
                        bool isValid = PStringUtils.isMatch(value, RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))
                            && PStringUtils.isNotEmpty(value);
                        controller.setIsEmailValidate(isValid);
                      },
                    ),

                    PConstant.hDistance10,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PTextFormField(
                          enable: !controller.getIsPending(),
                          controller: controller.getPasswordController(),
                          obscureText: true,
                          labelText: "Mật khẩu",
                          hintText: "Nhập mật khẩu của bạn",
                          suffixIcon: PIcon(
                            iconData: Icons.password,
                            iconButtonData: Icons.clear,
                            isButton: controller.getIsPasswordEditing(),
                            onPress: () => controller.clearPasswordText(),
                            color: controller.getIsPasswordHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          focusErrorBorderColor: Color(Colors.red.shade100.toARGB32()),
                          enableBorderRadius: 10,
                          validate: (value) {
                            if (PStringUtils.isEmpty(value)) {
                              return "Vui lòng nhập mật khẩu";
                            }

                            return null;
                          },
                          onTap: () => controller.setIsPasswordHover(true),
                          onTapOutside: (_) => controller
                              .setIsPasswordHover(false),
                          onChanged: (value) => controller
                              .setIsPasswordValidate(PStringUtils.isNotEmpty(value)),
                        ),

                        PConstant.vDistance5,

                        PTextFormField(
                          enable: !controller.getIsPending(),
                          controller: controller.getRePasswordController(),
                          obscureText: true,
                          labelText: "Xác nhận mật khẩu",
                          hintText: "Nhập lại mật khẩu của bạn",
                          suffixIcon: PIcon(
                            iconData:  Icons.password,
                            iconButtonData: Icons.clear,
                            isButton: controller.getIsRePasswordEditing(),
                            onPress: () => controller.clearRePasswordText(),
                            color: controller.getIsRePasswordHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          focusErrorBorderColor: Color(Colors.red.shade100.toARGB32()),
                          enableBorderRadius: 10,
                          validate: (value) {
                            if(PStringUtils.isEmpty(value)) {
                              return "Vui lòng nhập lại mật khẩu";
                            }

                            if (!controller.getIsRePasswordMatch()) {
                              return "Mật khẩu không khớp";
                            }

                            return null;
                          },
                          onTap: () => controller.setIsRePasswordHover(true),
                          onTapOutside: (_) => controller
                              .setIsRePasswordHover(false),
                          onChanged: (value) {
                            controller.setIsRePasswordValidate(PStringUtils.isNotEmpty(value));
                          },

                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PTextFormField(
                          enable: !controller.getIsPending(),
                          controller: controller.getFirstNameController(),
                          labelText: "Họ",
                          hintText: "Nhập họ của bạn",
                          suffixIcon: PIcon(
                            iconData: Icons.account_circle_outlined,
                            iconButtonData: Icons.clear,
                            isButton: controller.getIsFirstNameEditing(),
                            onPress: () => controller.clearFirstNameText(),
                            color: controller.getIsFirstNameHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          focusErrorBorderColor: Color(Colors.red.shade100.toARGB32()),
                          enableBorderRadius: 10,
                          validate: (value) {
                            if (PStringUtils.isEmpty(value)) {
                              return "Vui lòng nhập họ của bạn";
                            }

                            return null;
                          },
                          onTap: () => controller.setIsFirstNameHover(true),
                          onTapOutside: (_) => controller
                              .setIsFirstNameHover(false),
                          onChanged: (value) {
                            controller.setIsFirstNameValidate(PStringUtils
                                .isNotEmpty(value));
                          },

                        ),

                        PConstant.vDistance5,

                        PTextFormField(
                          enable: !controller.getIsPending(),
                          controller: controller.getLastNameController(),
                          labelText: "Tên",
                          hintText: "Nhập tên của bạn",
                          suffixIcon: PIcon(
                            iconData: Icons.account_circle,
                            iconButtonData: Icons.clear,
                            isButton: controller.getIsLastNameEditing(),
                            onPress: () => controller.clearLastNameText(),
                            color: controller.getIsLastNameHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          enableBorderRadius: 10,
                          validate: (value) {
                            if (PStringUtils.isEmpty(value)) {
                              return "Vui lòng nhập tên của bạn";
                            }

                            return null;
                          },
                          onTap: () => controller.setIsLastNameHover(true),
                          onTapOutside: (_) => controller
                              .setIsLastNameHover(false),
                          onChanged: (value) {
                            controller.setIsLastNameValidate(PStringUtils
                                .isNotEmpty(value));
                          },
                        )
                      ],
                    ),

                    PConstant.hDistance10,

                    PDateRangePicker(
                      enable: !controller.getIsPending(),
                      controller: controller.getBirthdayController(),
                      width: 410,
                      selectionColor: Colors.orangeAccent,
                      backgroundColor: Colors.white,
                      textInputType: TextInputType.emailAddress,
                      labelText: "Ngày sinh",
                      hintText: "Chọn ngày sinh của bạn",
                      suffixIcon: PIcon(
                        iconData: Icons.cake,
                        iconButtonData: Icons.clear,
                        isButton: controller.getIsBirthdayEditing(),
                        onPress: () => controller.clearBirthdayText(),
                        color: controller.getIsBirthdayHover()
                            ? Colors.orangeAccent
                            : Colors.black,
                      ),
                      enableBorderColor: Color(Colors.black.toARGB32()),
                      focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                      enableBorderRadius: 10,
                      validate: (value) {
                        if (PStringUtils.isEmpty(value)) {
                          return "Vui lòng nhập ngày sinh của bạn";
                        }

                        return null;
                      },
                    ),

                    PConstant.hDistance10,

                    PTextFormField(
                        width: 410,
                        enable: !controller.getIsPending(),
                        controller: controller.getPhoneController(),
                        labelText: "Số điện thoại",
                        hintText: "Nhập số điện thoại của bạn",
                        textInputType: TextInputType.number,
                        suffixIcon: PIcon (
                          iconData: Icons.phone,
                          iconButtonData: Icons.clear,
                          isButton: controller.getIsPhoneEditing(),
                          onPress: () => controller.clearPhoneText(),
                          color: controller.getIsPhoneHover()
                              ? Colors.orangeAccent
                              : Colors.black,
                        ),
                        enableBorderColor: Color(Colors.black.toARGB32()),
                        focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                        enableBorderRadius: 10,
                        validate: (value) {
                          if (PStringUtils.isEmpty(value)) {
                            return "Vui lòng nhập số điện thoại";
                          }

                          if (!PStringUtils.isMatch(value, RegExp(r'^(?:\+84|0)(3[2-9]|5[2689]|7[0-9]|8[1-9]|9[0-9])[0-9]{7}$'))) {
                            return "Số điện thoại không hợp lệ";
                          }

                          return null;
                        },
                        onTap: () => controller.setIsPhoneHover(true),
                        onTapOutside: (_) => controller
                            .setIsPhoneHover(false),
                        onChanged: (value) {
                          bool isValidated = PStringUtils.isMatch(value, RegExp(r'^(?:\+84|0)(3[2-9]|5[2689]|7[0-9]|8[1-9]|9[0-9])[0-9]{7}$'))
                              && PStringUtils.isNotEmpty(value);
                          controller.setIsPhoneValidate(isValidated);
                        }
                    ),

                    PConstant.hDistance50,

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PText(
                            content: "Bạn đã có tài khoản?",
                            fontSize: 15,
                          ),
                          RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Đăng nhập tại đây',
                                    style: TextStyle(color: Colors.orangeAccent, decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(PRoute.loginView),
                                  ),
                                ]
                            ),
                          )
                        ]
                    ),

                    PConstant.hDistance10,

                    PButton(
                      width: 300,
                      title: PText(
                        content: "Đăng ký",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        textColor: Color(Colors.white.toARGB32()),
                      ),
                      backgroundColor: controller.getIsDataValidated()
                          ? Color(Colors.green.toARGB32())
                          : Color(Colors.grey.toARGB32()),
                      onPress:() {
                        if (formKey.currentState!.validate()) {
                          controller.register();
                        }

                      },
                    ),
                    PConstant.hDistance10
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),);
  }
}


class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  RegistrationController controller = Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 31.5,
            ),
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                  color: Color(Colors.white.toARGB32()),
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
                    PConstant.hDistance30,

                    PTextFormField(
                      enable: !controller.getIsPending(),
                      controller: controller.getEmailController(),
                      width: 410,
                      textInputType: TextInputType.emailAddress,
                      labelText: "Email",
                      hintText: "Nhập email của bạn",
                      suffixIcon: PIcon(
                        iconData: Icons.email,
                        iconButtonData: Icons.clear,
                        isButton: controller.getIsEmailEditing(),
                        onPress: () => controller.clearEmailText(),
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
                      onChanged: (value) {
                        bool isValid = PStringUtils.isMatch(value, RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))
                            && PStringUtils.isNotEmpty(value);
                        controller.setIsEmailValidate(isValid);
                      },
                    ),

                    PConstant.hDistance10,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PTextFormField(
                          enable: !controller.getIsPending(),
                          controller: controller.getPasswordController(),
                          obscureText: true,
                          labelText: "Mật khẩu",
                          hintText: "Nhập mật khẩu của bạn",
                          suffixIcon: PIcon(
                            iconData: Icons.password,
                            iconButtonData: Icons.clear,
                            isButton: controller.getIsPasswordEditing(),
                            onPress: () => controller.clearPasswordText(),
                            color: controller.getIsPasswordHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          focusErrorBorderColor: Color(Colors.red.shade100.toARGB32()),
                          enableBorderRadius: 10,
                          validate: (value) {
                            if (PStringUtils.isEmpty(value)) {
                              return "Vui lòng nhập mật khẩu";
                            }

                            return null;
                          },
                          onTap: () => controller.setIsPasswordHover(true),
                          onTapOutside: (_) => controller
                              .setIsPasswordHover(false),
                          onChanged: (value) => controller
                              .setIsPasswordValidate(PStringUtils.isNotEmpty(value)),
                        ),

                        PConstant.vDistance5,

                        PTextFormField(
                          enable: !controller.getIsPending(),
                          controller: controller.getRePasswordController(),
                          obscureText: true,
                          labelText: "Xác nhận mật khẩu",
                          hintText: "Nhập lại mật khẩu của bạn",
                          suffixIcon: PIcon(
                            iconData:  Icons.password,
                            iconButtonData: Icons.clear,
                            isButton: controller.getIsRePasswordEditing(),
                            onPress: () => controller.clearRePasswordText(),
                            color: controller.getIsRePasswordHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          focusErrorBorderColor: Color(Colors.red.shade100.toARGB32()),
                          enableBorderRadius: 10,
                          validate: (value) {
                            if(PStringUtils.isEmpty(value)) {
                              return "Vui lòng nhập lại mật khẩu";
                            }

                            if (!controller.getIsRePasswordMatch()) {
                              return "Mật khẩu không khớp";
                            }

                            return null;
                          },
                          onTap: () => controller.setIsRePasswordHover(true),
                          onTapOutside: (_) => controller
                              .setIsRePasswordHover(false),
                          onChanged: (value) {
                            controller.setIsRePasswordValidate(PStringUtils.isNotEmpty(value));
                          },

                        ),
                      ],
                    ),

                    PConstant.hDistance30,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PTextFormField(
                          enable: !controller.getIsPending(),
                          controller: controller.getFirstNameController(),
                          labelText: "Họ",
                          hintText: "Nhập họ của bạn",
                          suffixIcon: PIcon(
                            iconData: Icons.account_circle_outlined,
                            iconButtonData: Icons.clear,
                            isButton: controller.getIsFirstNameEditing(),
                            onPress: () => controller.clearFirstNameText(),
                            color: controller.getIsFirstNameHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          focusErrorBorderColor: Color(Colors.red.shade100.toARGB32()),
                          enableBorderRadius: 10,
                          validate: (value) {
                            if (PStringUtils.isEmpty(value)) {
                              return "Vui lòng nhập họ của bạn";
                            }

                            return null;
                          },
                          onTap: () => controller.setIsFirstNameHover(true),
                          onTapOutside: (_) => controller
                              .setIsFirstNameHover(false),
                          onChanged: (value) {
                            controller.setIsFirstNameValidate(PStringUtils
                                .isNotEmpty(value));
                          },

                        ),

                        PConstant.vDistance5,

                        PTextFormField(
                          enable: !controller.getIsPending(),
                          controller: controller.getLastNameController(),
                          labelText: "Tên",
                          hintText: "Nhập tên của bạn",
                          suffixIcon: PIcon(
                            iconData: Icons.account_circle,
                            iconButtonData: Icons.clear,
                            isButton: controller.getIsLastNameEditing(),
                            onPress: () => controller.clearLastNameText(),
                            color: controller.getIsLastNameHover()
                                ? Colors.orangeAccent
                                : Colors.black,
                          ),
                          enableBorderColor: Color(Colors.black.toARGB32()),
                          focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                          enableBorderRadius: 10,
                          validate: (value) {
                            if (PStringUtils.isEmpty(value)) {
                              return "Vui lòng nhập tên của bạn";
                            }

                            return null;
                          },
                          onTap: () => controller.setIsLastNameHover(true),
                          onTapOutside: (_) => controller
                              .setIsLastNameHover(false),
                          onChanged: (value) {
                            controller.setIsLastNameValidate(PStringUtils
                                .isNotEmpty(value));
                          },
                        )
                      ],
                    ),

                    PConstant.hDistance10,

                    PDateRangePicker(
                      enable: !controller.getIsPending(),
                      controller: controller.getBirthdayController(),
                      width: 410,
                      selectionColor: Colors.orangeAccent,
                      backgroundColor: Colors.white,
                      textInputType: TextInputType.emailAddress,
                      labelText: "Ngày sinh",
                      hintText: "Chọn ngày sinh của bạn",
                      suffixIcon: PIcon(
                        iconData: Icons.cake,
                        iconButtonData: Icons.clear,
                        isButton: controller.getIsBirthdayEditing(),
                        onPress: () => controller.clearBirthdayText(),
                        color: controller.getIsBirthdayHover()
                            ? Colors.orangeAccent
                            : Colors.black,
                      ),
                      enableBorderColor: Color(Colors.black.toARGB32()),
                      focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                      enableBorderRadius: 10,
                      validate: (value) {
                        if (PStringUtils.isEmpty(value)) {
                          return "Vui lòng nhập ngày sinh của bạn";
                        }

                        return null;
                      },
                    ),

                    PConstant.hDistance10,

                    PTextFormField(
                        width: 410,
                        enable: !controller.getIsPending(),
                        controller: controller.getPhoneController(),
                        labelText: "Số điện thoại",
                        hintText: "Nhập số điện thoại của bạn",
                        textInputType: TextInputType.number,
                        suffixIcon: PIcon (
                          iconData: Icons.phone,
                          iconButtonData: Icons.clear,
                          isButton: controller.getIsPhoneEditing(),
                          onPress: () => controller.clearPhoneText(),
                          color: controller.getIsPhoneHover()
                              ? Colors.orangeAccent
                              : Colors.black,
                        ),
                        enableBorderColor: Color(Colors.black.toARGB32()),
                        focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                        enableBorderRadius: 10,
                        validate: (value) {
                          if (PStringUtils.isEmpty(value)) {
                            return "Vui lòng nhập số điện thoại";
                          }

                          if (!PStringUtils.isMatch(value, RegExp(r'^(?:\+84|0)(3[2-9]|5[2689]|7[0-9]|8[1-9]|9[0-9])[0-9]{7}$'))) {
                            return "Số điện thoại không hợp lệ";
                          }

                          return null;
                        },
                        onTap: () => controller.setIsPhoneHover(true),
                        onTapOutside: (_) => controller
                            .setIsPhoneHover(false),
                        onChanged: (value) {
                          bool isValidated = PStringUtils.isMatch(value, RegExp(r'^(?:\+84|0)(3[2-9]|5[2689]|7[0-9]|8[1-9]|9[0-9])[0-9]{7}$'))
                              && PStringUtils.isNotEmpty(value);
                          controller.setIsPhoneValidate(isValidated);
                        }
                    ),

                    PConstant.hDistance50,

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PText(
                            content: "Bạn đã có tài khoản?",
                            fontSize: 15,
                          ),
                          RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Đăng nhập tại đây',
                                    style: TextStyle(color: Colors.orangeAccent, decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(PRoute.loginView),
                                  ),
                                ]
                            ),
                          )
                        ]
                    ),

                    PConstant.hDistance10,

                    PButton(
                      width: 300,
                      title: PText(
                        content: "Đăng ký",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        textColor: Color(Colors.white.toARGB32()),
                      ),
                      backgroundColor: controller.getIsDataValidated()
                          ? Color(Colors.green.toARGB32())
                          : Color(Colors.grey.toARGB32()),
                      onPress:() {
                        if (formKey.currentState!.validate()) {
                          controller.register();
                        }

                      },
                    ),
                    PConstant.hDistance10
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),);
  }
}


