import 'package:blog_app/app/core/enviroment/env.dart';
import 'package:blog_app/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blog_app/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.authService.isLogin.value
            ? const SizedBox(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffDB3022),
                        Color(0xffE33D3D),
                        Color(0xffF45C5C),
                        // Colors.orangeAccent,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 36, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Register Account",
                                style: Env.textStyles.headingStyle,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Complete your detail or continue \nwith social media",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextField(
                                  controller: controller.nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xffe7edeb),
                                    hintText: "Name",
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: controller.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xffe7edeb),
                                    hintText: "Email",
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Obx(
                                  () => TextField(
                                    controller: controller.passwordController,
                                    keyboardType: TextInputType.text,
                                    obscureText: controller.isVisible.value,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xffe7edeb),
                                      hintText: "Password",
                                      suffixIcon: Obx(
                                        () => IconButton(
                                          icon: controller.isVisible.value ==
                                                  false
                                              ? Icon(
                                                  Icons.remove_red_eye,
                                                  color: Colors.grey[600],
                                                )
                                              : Icon(
                                                  Icons.visibility_off,
                                                  color: Env.colors.primaryPink,
                                                ),
                                          onPressed: () =>
                                              controller.tooglePassword(),
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                                // Align(
                                //   alignment: Alignment.centerRight,
                                //   child: TextButton(
                                //     onPressed: () {},
                                //     child: Text(
                                //       "Forgot password?",
                                //       textAlign: TextAlign.right,
                                //       style: Env.textStyles.subheads,
                                //     ),
                                //   ),
                                // ),

                                const SizedBox(height: 20),

                                // CustomButton(
                                //     buttonText: "Sign Up",
                                //     onPressed: () {
                                //       controller.authService
                                //           .registerUserWithEmailAndPassword(
                                //         email: controller.emailController.text
                                //             .trim(),
                                //         password: controller
                                //             .passwordController.text
                                //             .trim(),
                                //       );
                                //     }),

                                MaterialButton(
                                  color: Env.colors.primaryPink,
                                  onPressed: () {
                                    controller.authService
                                        .registerUserWithEmailAndPassword(
                                      email: controller.emailController.text
                                          .trim(),
                                      password: controller
                                          .passwordController.text
                                          .trim(),
                                    );
                                  },
                                  child: const Text("Sign Up"),
                                ),

                                const SizedBox(height: 20),

                                const SizedBox(height: 20),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Already have an account?",
                                      // style: Env.textStyles.subheads,
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        Get.offAll(() => LoginView());
                                      },
                                      child: Text(
                                        "Sign In",
                                        style: Env.textStyles.subheads.copyWith(
                                          color: Env.colors.primaryIndigo,
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
