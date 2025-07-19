import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/controller/verification/sending_verification_controller.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/template/paw_template.dart';
import 'package:paw_fund_shelter_owner/share/widgets/button/paw_button.dart';
import 'package:paw_fund_shelter_owner/share/widgets/icon/paw_icon.dart';
import 'package:paw_fund_shelter_owner/share/widgets/progresss_bar/progress_bar.dart';
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
          padding: EdgeInsets.symmetric(
              vertical: 100
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: 450 ,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/sua.jpg"),
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
                      PConstant.hDistance30,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              PTextFormField(
                                width: MediaQuery.of(context).size.width * 0.265,
                                readOnly: !widget.controller.getIsToggleAccountEdit(),
                                enable: !widget.controller.getIsApiPending(),
                                controller: widget.controller.getEmailEditingController(),
                                textInputType: TextInputType.emailAddress,
                                labelText: "Email",
                                hintText: "Nhập email của bạn",
                                suffixIcon: PIcon(
                                  iconData: Icons.email,
                                  iconButtonData: Icons.clear,
                                  isButton: widget.controller.getIsEmailEditing() && widget.controller.getIsToggleAccountEdit(),
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

                              PConstant.hDistance15,

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PTextFormField(
                                    width: MediaQuery.of(context).size.width * 0.13,
                                    enable: !widget.controller.getIsApiPending(),
                                    readOnly: !widget.controller.getIsToggleAccountEdit(),
                                    controller: widget.controller.getFirstNameController(),
                                    labelText: "Họ",
                                    hintText: "Nhập họ của bạn",
                                    suffixIcon: PIcon(
                                      iconData: Icons.account_circle_outlined,
                                      iconButtonData: Icons.clear,
                                      isButton: widget.controller.getIsFirstNameFocus() && widget.controller.getIsToggleAccountEdit(),
                                      onPress: () => widget.controller.clearFirstNameText(),
                                      color: widget.controller.getIsFirstNameFocus()
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
                                    onTap: () => widget.controller.setIsFirstNameFocus(true),
                                    onTapOutside: (_) => widget.controller
                                        .setIsFirstNameFocus(false),
                                    onChanged: (value) {
                                      widget.controller.setIsFirstNameValidate(PStringUtils
                                          .isNotEmpty(value));
                                    },

                                  ),

                                  PConstant.vDistance5,

                                  PTextFormField(
                                    width: MediaQuery.of(context).size.width * 0.13,
                                    enable: !widget.controller.getIsApiPending(),
                                    readOnly: !widget.controller.getIsToggleAccountEdit(),
                                    controller: widget.controller.getLastNameController(),
                                    labelText: "Tên",
                                    hintText: "Nhập tên của bạn",
                                    suffixIcon: PIcon(
                                      iconData: Icons.account_circle,
                                      iconButtonData: Icons.clear,
                                      isButton: widget.controller.getIsLastNameFocus() && widget.controller.getIsToggleAccountEdit(),
                                      onPress: () => widget.controller.clearLastNameText(),
                                      color: widget.controller.getIsLastNameFocus()
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
                                    onTap: () => widget.controller.setIsLastNameFocus(true),
                                    onTapOutside: (_) => widget.controller
                                        .setIsLastNameFocus(false),
                                    onChanged: (value) {
                                      widget.controller.setIsLastNameValidate(PStringUtils
                                          .isNotEmpty(value));
                                    },
                                  )
                                ],
                              ),

                              PConstant.hDistance15,

                              PDateRangePicker(
                                width: MediaQuery.of(context).size.width * 0.265,
                                readOnly: !widget.controller.getIsToggleAccountEdit(),
                                enable: !widget.controller.getIsApiPending(),
                                controller: widget.controller.getBirthdayController(),
                                selectionColor: Colors.orangeAccent,
                                backgroundColor: Colors.white,
                                textInputType: TextInputType.emailAddress,
                                labelText: "Ngày sinh",
                                hintText: "Chọn ngày sinh của bạn",
                                suffixIcon: PIcon(
                                  iconData: Icons.cake,
                                  iconButtonData: Icons.clear,
                                  isButton: widget.controller.getIsBirthdayFocus() && widget.controller.getIsToggleAccountEdit(),
                                  onPress: () => widget.controller.clearBirthdayText(),
                                  color: widget.controller.getIsBirthdayFocus()
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

                              PTextFormField(
                                  width: MediaQuery.of(context).size.width * 0.265,
                                  enable: !widget.controller.getIsApiPending(),
                                  controller: widget.controller.getPhoneController(),
                                  labelText: "Số điện thoại",
                                  hintText: "Nhập số điện thoại của bạn",
                                  textInputType: TextInputType.number,
                                  suffixIcon: PIcon (
                                    iconData: Icons.phone,
                                    iconButtonData: Icons.clear,
                                    isButton: widget.controller.getIsPhoneFocus() && widget.controller.getIsToggleAccountEdit(),
                                    onPress: () => widget.controller.clearPhoneText(),
                                    color: widget.controller.getIsPhoneFocus()
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
                                  onTap: () => widget.controller
                                      .setIsPhoneFocus(true),
                                  onTapOutside: (_) => widget.controller
                                      .setIsPhoneFocus(false),
                                  onChanged: (value) {
                                    bool isValidated = PStringUtils.isMatch(value, RegExp(r'^(?:\+84|0)(3[2-9]|5[2689]|7[0-9]|8[1-9]|9[0-9])[0-9]{7}$'))
                                        && PStringUtils.isNotEmpty(value);
                                    widget.controller.setIsPhoneValidate(isValidated);
                                  }
                              ),
                            ],
                          ),
                          PConstant.vDistance20,
                          PWidgetUtils.chooseWithCondition(
                              widget.controller.getIsToggleSendingCode(),
                              PConstant.vDistance50,
                              PWidgetUtils.chooseWithCondition(
                                widget.controller.getIsToggleAccountEdit(),
                                PIcon(
                                  iconButtonData: Icons.cancel,
                                  isButton: true,
                                  color: Colors.red,
                                  size: 25,
                                  onPress: () {
                                    bool value = !widget.controller.getIsToggleAccountEdit();
                                    widget.controller.setIsToggleAccountEdit(value);
                                  },
                                ),
                                PIcon(
                                  iconButtonData: Icons.edit,
                                  isButton: true,
                                  color: Colors.orangeAccent,
                                  size: 25,
                                  onPress: () {
                                    bool value = !widget.controller.getIsToggleAccountEdit();
                                    widget.controller.setIsToggleAccountEdit(value);
                                  },
                                )
                            ),
                          ),
                          // PWidgetUtils.chooseWithCondition(
                          //     widget.controller.getIsToggleAccountEdit(),
                          //     PIcon(
                          //       iconButtonData: Icons.cancel,
                          //       isButton: true,
                          //       color: Colors.red,
                          //       size: 25,
                          //       onPress: () {
                          //         bool value = !widget.controller.getIsToggleAccountEdit();
                          //         widget.controller.setIsToggleAccountEdit(value);
                          //       },
                          //     ),
                          //     PIcon(
                          //       iconButtonData: Icons.edit,
                          //       isButton: true,
                          //       color: Colors.orangeAccent,
                          //       size: 25,
                          //       onPress: () {
                          //         bool value = !widget.controller.getIsToggleAccountEdit();
                          //         widget.controller.setIsToggleAccountEdit(value);
                          //       },
                          //     )
                          // ),
                        ],
                      ),

                      PConstant.hDistance50,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PWidgetUtils.chooseWithCondition(
                              widget.controller.getIsToggleSendingCode(),
                              Row(
                                children: [
                                  PConstant.vDistance45,
                                  PTextFormField(
                                      width: MediaQuery.of(context).size.width * 0.265,
                                      controller: widget.controller.getVerificationCodeController(),
                                      labelText: "Mã xác nhận",
                                      hintText: "Nhập mã xác nhận",
                                      suffixIcon: PIcon (
                                        iconData: Icons.code,
                                        iconButtonData: Icons.clear,
                                        isButton: widget.controller.getIsVerificationCodeFocus() && widget.controller.getIsToggleAccountEdit(),
                                        onPress: () => widget.controller.clearVerificationCodeText(),
                                        color: widget.controller.getIsVerificationCodeFocus()
                                            ? Colors.orangeAccent
                                            : Colors.black,
                                      ),
                                      enableBorderColor: Color(Colors.black.toARGB32()),
                                      focusBorderColor: Color(Colors.orangeAccent.toARGB32()),
                                      enableBorderRadius: 10,
                                      validate: (value) {
                                        if (PStringUtils.isEmpty(value)) {
                                          return "Vui lòng nhập mã xác nhận";
                                        }
                                        return null;
                                      },
                                      onTap: () => widget.controller
                                          .setIsVerificationCodeFocus(true),
                                      onTapOutside: (_) => widget.controller
                                          .setIsVerificationCodeFocus(false),
                                      onChanged: (value) {
                                        bool isValidated = PStringUtils.isNotEmpty(value);
                                        widget.controller.setIsVerificationCodeValidate(isValidated);
                                      }
                                  ),
                                  PConstant.vDistance10,
                                  PWidgetUtils.chooseWithCondition(
                                      widget.controller.getIsApiPending(),
                                      PProgressBar(progressColors: [Colors.white, Colors.orangeAccent],),
                                      PIcon(
                                        iconButtonData: Icons.send,
                                        size: 25,
                                        color: Colors.orangeAccent,
                                        isButton: true,
                                        onPress: () {
                                          widget.controller.activeAccount();
                                        },
                                      )
                                  ),
                                ],
                              ),
                              PWidgetUtils.chooseWithCondition(
                              widget.controller.getIsApiPending(),
                              PProgressBar(progressColors: [Colors.white, Colors.orangeAccent],),
                              PWidgetUtils.chooseWithCondition(
                                widget.controller.getIsToggleAccountEdit(),
                                PButton(
                                  width: MediaQuery.of(context).size.width * 0.265,
                                  title: PText(
                                    content: "Cập nhật",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    textColor: Color(Colors.white.toARGB32()),
                                  ),
                                  backgroundColor: Color(Colors.blueAccent.toARGB32()),
                                  onPress:() {

                                    if (widget.controller.getIsDataValidated() && formKey.currentState!.validate()) {
                                      widget.controller.updateAccount().whenComplete(() => widget.controller.fetchData(),);
                                    }
                                  },
                                ),
                                PButton(
                                  width: MediaQuery.of(context).size.width * 0.265,
                                  title: PText(
                                    content: "Gửi mã xác nhận",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    textColor: Color(Colors.white.toARGB32()),
                                  ),
                                  backgroundColor: Color(Colors.orangeAccent.toARGB32()),
                                  onPress:() {
                                    if (widget.controller.getIsDataValidated() && formKey.currentState!.validate()) {
                                      widget.controller.sendVerificationAccount();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.04,)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),);
  }
}


