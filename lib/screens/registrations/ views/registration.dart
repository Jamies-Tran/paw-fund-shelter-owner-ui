import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/registrations/controller/registration_controller.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/constans/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/template/paw_template.dart';
import 'package:paw_fund_shelter_owner/share/widgets/button/paw_button.dart';
import 'package:paw_fund_shelter_owner/share/widgets/text/paw_text.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {

  RegistrationController controller = Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Obx(() => SingleChildScrollView(
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 31.5,
              horizontal: 250
            ),
            child: Row(
              children: [
                Container(
                  width: 350,
                  height: 600,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("sua.jpg"),
                        fit: BoxFit.fitHeight
                      )
                  ),
                ),
                Container(
                  width: 600,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Color(Colors.white.toARGB32())
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          onChanged: (value) {
                            bool isValid = PStringUtils.isMatch(value, RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))
                              && PStringUtils.isNotEmpty(value);
                            controller.setIsDataValidated(isValid);
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
                              suffixIcon: Icon(
                                Icons.password,
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
                                  .setIsFirstNameHover(false),
                              onChanged: (value) => controller
                                  .setIsDataValidated(PStringUtils.isNotEmpty(value)),
                            ),
        
                            PConstant.vDistance5,
        
                            PTextFormField(
                              enable: !controller.getIsPending(),
                              controller: controller.getRePasswordController(),
                              obscureText: true,
                              labelText: "Xác nhận mật khẩu",
                              hintText: "Nhập lại mật khẩu của bạn",
                              suffixIcon: Icon(
                                Icons.password,
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
        
                                if (!controller.getIsPassValidated()) {
                                  return "Mật khẩu không khớp";
                                }
        
                                return null;
                              },
                              onTap: () => controller.setIsRePasswordHover(true),
                              onTapOutside: (_) => controller
                                     .setIsFirstNameHover(false),
                              onChanged: (value) {
                                controller.setValidatePass();
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
                              suffixIcon: Icon(
                                Icons.account_circle_outlined,
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
                                  return "Vui lòng nhập tên của bạn";
                                }
        
                                return null;
                              },
                              onTap: () => controller.setIsFirstNameHover(true),
                              onTapOutside: (_) => controller
                                  .setIsFirstNameHover(false),
                              onChanged: (value) {
                                controller.setIsDataValidated(PStringUtils
                                    .isNotEmpty(value));
                              },
        
                            ),
        
                            PConstant.vDistance5,
        
                            PTextFormField(
                              enable: !controller.getIsPending(),
                              controller: controller.getLastNameController(),
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
                                controller.setIsDataValidated(PStringUtils
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
                          suffixIcon: Icon(
                            Icons.cake,
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
                          onTapOutside: (_) => controller.setIsBirthdayHover(false),
                          onChanged: (value) {
                            controller.setIsDataValidated(PStringUtils.isNotEmpty(value));
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
                          suffixIcon: Icon(
                            Icons.phone,
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
                            controller.setIsDataValidated(isValidated);
                          }
                        ),
        
                        PConstant.hDistance10,
        
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
                                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(PRoute.loginScreen),
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
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
