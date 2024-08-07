import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/custom_form_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 100,
              horizontal: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Get Started!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: "NAME",
                          iconData: Icons.person,
                          textEditingController: controller.name,
                          validator: (v) => controller.validateUserName(v),
                          obscureText: false,
                        ),
                        CustomTextField(
                          hintText: "EMAIL",
                          iconData: Icons.email,
                          textEditingController: controller.email,
                          validator: (v) => controller.validateEmail(v),
                          obscureText: false,
                        ),
                        Obx(
                          () => CustomTextField(
                            hintText: "PASSWORD",
                            iconData: Icons.security,
                            textEditingController: controller.password,
                            validator: (v) => controller.validatePassword(v),
                            obscureText: controller.isObscure.value,
                            iconLeft: GestureDetector(
                              onTap: controller.stateObscure,
                              child: Icon(
                                !controller.isObscure.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 26,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => CustomTextField(
                            hintText: "CONFIR PASSWORD",
                            iconData: Icons.security,
                            textEditingController: controller.confirPassword,
                            validator: (v) =>
                                controller.validateConfirmPassword(v),
                            obscureText: controller.isObscureConfir.value,
                            iconLeft: GestureDetector(
                              onTap: controller.stateObscureConfir,
                              child: Icon(
                                !controller.isObscureConfir.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 26,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: controller.register,
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a member? ",
                      style: TextStyle(
                        // color: Colors.grey.shade900,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: Get.back,
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
