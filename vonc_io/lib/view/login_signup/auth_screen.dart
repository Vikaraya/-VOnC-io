import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';
import 'package:vonc_io/models/api_service.dart';
import 'package:vonc_io/view/pages/vonc_main_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Email_Password_Verifiction_Screen(),
    );
  }
}

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  final phoneKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            // alignment: Alignment.topLeft,
            child: SizedBox(
              height: screenHeight * 0.2,
              child: Image.asset(
                "assets/img/1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Green Shape
          Positioned(
            top: 0,
            right: 0,
            //alignment: Alignment.topRight,
            child: SizedBox(
              height: screenHeight * 0.115,
              child: Image.asset(
                "assets/img/2-removebg-preview.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Yellow Shape
          Positioned(
            bottom: 0,
            left: 0,
            //alignment: Alignment.bottomLeft,
            child: SizedBox(
              height: screenHeight * 0.2,
              child: Image.asset(
                "assets/img/3-removebg-preview.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // grey Shape
          Positioned(
            bottom: 0,
            right: 0,
            //alignment: Alignment.bottomRight,
            child: SizedBox(
              height: screenHeight * 0.2,
              child: Image.asset(
                "assets/img/4-removebg-preview.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.6,
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent.withOpacity(0.5),
                        radius: 65,
                        child: Center(
                          child: Image.asset(
                            "assets/img/V_O_n_C_Logo crop-min.png",
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          width: screenWidth * 0.8,
                          child: Form(
                            key: phoneKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: IntlPhoneField(
                                    initialCountryCode: 'IN',
                                    controller: phoneController,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      phoneKey.currentState!.validate();
                                    },
                                    validator: (value) {
                                      if (phoneController.text.length != 10) {
                                        return 'Plaese Enter Valid Phone Number';
                                      } else if (!RegExp(r'^[0-9]+$')
                                          .hasMatch(phoneController.text)) {
                                        return 'Please Enter Valid Phone Number';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey.shade500,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade900),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      hintText: "Phone Number",
                                      hintStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black87,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                    ),
                                    onPressed: () {
                                      if (phoneKey.currentState!.validate()) {
                                        String validPhoneNumber =
                                            phoneController.text.trim();
                                        if (validPhoneNumber.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Please enter a valid phone number')));
                                          return;
                                        }
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OtpScreen(
                                                    phoneNumber:
                                                        validPhoneNumber,
                                                    sentOtp: '',
                                                  )),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Please enter a valid phone number')));
                                      }
                                    },
                                    child: const Text(
                                      "Verify Phone Number",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Center(
                                  child: Text(
                                    "        Or \n Login with",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      child: IconButton(
                                          onPressed: () {},
                                          //siginIn,
                                          icon: Image.asset(
                                              "assets/icons/google_logo.png")),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                              "assets/icons/apple_logo.png")),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            "assets/icons/facebook_logo-removebg-preview.png"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String sentOtp;
  const OtpScreen(
      {super.key, required this.phoneNumber, required this.sentOtp});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();
  final OtpKey = GlobalKey<FormState>();

  String _obscurePhoneNumber(String phoneNumber) {
    //return phoneNumber.replaceRange(0,phoneNumber.length - 2, '*');
    String phoneNumber = widget.phoneNumber;
    if (phoneNumber.length == 10) {
      return '*' * (phoneNumber.length - 2) +
          phoneNumber.substring(phoneNumber.length - 2);
    } else if (phoneNumber.length >= 2) {
      return '*' * (phoneNumber.length - 2) +
          phoneNumber.substring(phoneNumber.length - 2);
    } else {
      return phoneNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 42,
      textStyle: const TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              // alignment: Alignment.topLeft,
              child: SizedBox(
                height: screenHeight * 0.2,
                child: Image.asset(
                  "assets/img/1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /* Center(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: screenHeight * 0.15,
                  child: Image.asset(
                    "assets/img/vonc_inovation_Icon-rb.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),*/
            //Green Shape
            Positioned(
              top: 0,
              right: 0,
              //alignment: Alignment.topRight,
              child: SizedBox(
                height: screenHeight * 0.115,
                child: Image.asset(
                  "assets/img/2-removebg-preview.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Yellow Shape
            Positioned(
              bottom: 0,
              left: 0,
              //alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: screenHeight * 0.2,
                child: Image.asset(
                  "assets/img/3-removebg-preview.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // grey Shape
            Positioned(
              bottom: 0,
              right: 0,
              //alignment: Alignment.bottomRight,
              child: SizedBox(
                height: screenHeight * 0.2,
                child: Image.asset(
                  "assets/img/4-removebg-preview.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.572,
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent.withOpacity(0.5),
                        radius: 65,
                        child: Center(
                          child: Image.asset(
                            "assets/img/V_O_n_C_Logo crop-min.png",
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: const Text(
                            "   Verification Code",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: OtpKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 2,
                              ),
                              Center(
                                child: Text(
                                  "Verification Code send to : ${_obscurePhoneNumber(widget.phoneNumber)}",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PhoneVerification(),
                                        ));
                                  },
                                  child: const Text(
                                    "Change Phone Number ?",
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Pinput(
                                  controller: otpController,
                                  obscureText: true,
                                  length: 6,
                                  defaultPinTheme: defaultPinTheme,
                                  focusedPinTheme: defaultPinTheme.copyWith(
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      border: Border.all(color: Colors.white24),
                                    ),
                                  ),
                                  submittedPinTheme: defaultPinTheme.copyWith(
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      border: Border.all(color: Colors.white24),
                                    ),
                                  ),
                                  errorPinTheme: defaultPinTheme.copyWith(
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      border: Border.all(color: Colors.red),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter OTP';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Center(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    // if (isTimervisible)
                                    // Center(
                                    //   child: Text(
                                    //     // " $remainingTime seconds",
                                    //     style: const TextStyle(
                                    //       color: Colors.white70,
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    // InkWell(
                                    //     onTap: (){}
                                    //         // remainingTime == 0 && !isResending
                                    //         //     ? resendOtp
                                    //         //     : null,
                                    //     child: Center(
                                    //         child: Text(
                                    //       isResending
                                    //           ? "Resendig ..."
                                    //           : "Resend Otp",
                                    //       style: const TextStyle(
                                    //         color: Colors.indigo,
                                    //         fontWeight: FontWeight.bold,
                                    //       ),
                                    //     ))),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    //minimumSize: Size(100, 25),
                                  ),
                                  onPressed: () {
                                    if (OtpKey.currentState!.validate()) {
                                      String validOtp =
                                          otpController.text.trim();
                                      if (validOtp.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text("Please enter the Otp"),
                                        ));
                                        return;
                                      }

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const VoncMainScreen()),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text("Invalid  Otp"),
                                      ));
                                    }
                                  },
                                  // onPressed: verifyOrResendOtp,
                                  child: const Text(
                                    "verify Otp",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // if (isTimervisible)
                              //   Text(
                              //       "Resend available in : $remainingTime seconds"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class Email_Password_Verifiction_Screen extends StatefulWidget {
  const Email_Password_Verifiction_Screen({super.key});

  @override
  State<Email_Password_Verifiction_Screen> createState() =>
      _Email_Password_Verifiction_ScreenState();
}

class _Email_Password_Verifiction_ScreenState
    extends State<Email_Password_Verifiction_Screen> {
  final signInKey = GlobalKey<FormState>();
  final signUpKey = GlobalKey<FormState>();
  //controllers for signup
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //controllers for Signin
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();
  ApiService get apiService => ApiService(apiUrl);
  final String apiUrl = 'http://192.168.29.218:8000';

  void _SignInsubmit() async {
    String email = _userIdController.text;
    String password = _passwordController.text;
    print(email + "   email    " + password);

    final apiService = ApiService(apiUrl);

    try {
      final response = await apiService.loginUser(email, password);
      print(email + " -> " + password);

      if (response['message'] != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PhoneVerification()), // Navigate to the dashboard
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed! Please try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  // ignore: non_constant_identifier_names
  void _SignUpsubmit() async {
    String email = emailController.text;
    String password = passwordController.text;

    final apiService = ApiService(apiUrl);

    try {
      final response = await apiService.register(email, password);

      if (response['message'] != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['message'])),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PhoneVerification()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Registration failed! Please try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  bool _isPasswordVisible = false;
  bool _isLoginEnabled = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(children: [
          // Blue Shape
          Positioned(
            top: 0,
            left: 0,
            // alignment: Alignment.topLeft,
            child: SizedBox(
              height: screenHeight * 0.2,
              child: Image.asset(
                "assets/img/1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Center(
          //   child: Align(
          //     alignment: Alignment.topCenter,
          //     child: Padding(
          //       padding: const EdgeInsets.only(top: 30),
          //       child: SizedBox(
          //         height: screenHeight * 0.15,
          //         child: Image.asset(
          //           "assets/img/vonc_inovation_Icon-rb.png",
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          //Green Shape
          Positioned(
            top: 0,
            right: 0,
            //alignment: Alignment.topRight,
            child: SizedBox(
              height: screenHeight * 0.115,
              child: Image.asset(
                "assets/img/2-removebg-preview.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Yellow Shape
          Positioned(
            bottom: 0,
            left: 0,
            //alignment: Alignment.bottomLeft,
            child: SizedBox(
              height: screenHeight * 0.2,
              child: Image.asset(
                "assets/img/3-removebg-preview.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // grey Shape
          Positioned(
            bottom: 0,
            right: 0,
            //alignment: Alignment.bottomRight,
            child: SizedBox(
              height: screenHeight * 0.2,
              child: Image.asset(
                "assets/img/4-removebg-preview.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),

          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.45,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50,
                        child: Center(
                          child: Image.asset(
                            "assets/img/V_O_n_C_Logo crop-min.png",
                          ),
                        ),
                      ),

                      // Text From Field
                      _isLoginEnabled
                          ? Form(
                              key: signInKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Container(
                                      height: 35,
                                      child: TextFormField(
                                        controller: _userIdController,
                                        cursorHeight: 25,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*|+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(value)) {
                                            return " Enter a valid email!";
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 6),
                                          filled: true,
                                          fillColor: Colors.grey.shade500,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade900),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          hintText: "Email",
                                          hintStyle: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black87,
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      height: 35,
                                      child: TextFormField(
                                        controller: _passwordController,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        validator: (value) {
                                          RegExp regex = RegExp(
                                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                          if (value!.isEmpty) {
                                            return 'Please enter password';
                                          } else {
                                            if (!regex.hasMatch(value)) {
                                              return 'Enter valid password';
                                            } else {
                                              return null;
                                            }
                                          }
                                        },
                                        obscureText: !_isPasswordVisible,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 6),
                                          filled: true,
                                          fillColor: Colors.grey.shade500,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade900),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          hintText: "Password",
                                          hintStyle: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black87,
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.key,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(_isPasswordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                            color: Colors.white,
                                            iconSize: 20,
                                            onPressed: () {
                                              setState(() {
                                                _isPasswordVisible =
                                                    !_isPasswordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _isLoginEnabled = false;
                                          });
                                        },
                                        child: const Text(
                                          "Sign UP",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ), // WHEN I HAVE TO IMPLEMENT G AND F AND A I HAVE TO DERUCE SIZE BOX HEIGHT AND INCREACE CONTAINER HEIGHT
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(120, 20),
                                      backgroundColor: Colors.greenAccent,
                                      //minimumSize: Size(100, 25),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _SignInsubmit();
                                      });
                                    },
                                    child: const Text(
                                      "Next  >>",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     CircleAvatar(
                                  //       child: IconButton(
                                  //           onPressed: () {},
                                  //           icon: Image.asset(
                                  //               "assets/icons/google_logo.png")),
                                  //     ),
                                  //     const SizedBox(
                                  //       width: 10,
                                  //     ),
                                  //     CircleAvatar(
                                  //       child: IconButton(
                                  //           onPressed: () {},
                                  //           icon: Image.asset(
                                  //               "assets/icons/apple_logo.png")),
                                  //     ),
                                  //     const SizedBox(
                                  //       width: 10,
                                  //     ),
                                  //     CircleAvatar(
                                  //       child: IconButton(
                                  //         onPressed: () {},
                                  //         icon: Image.asset(
                                  //             "assets/icons/facebook_logo-removebg-preview.png"),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            )
                          // signup Form
                          : Form(
                              key: signUpKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Container(
                                      height: 35,
                                      child: TextFormField(
                                        controller: emailController,
                                        cursorHeight: 25,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*|+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(value)) {
                                            return " Enter a valid email!";
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 6),
                                          filled: true,
                                          fillColor: Colors.grey.shade500,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade900),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          hintText: "Email",
                                          hintStyle: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87,
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      height: 35,
                                      child: TextFormField(
                                        controller: _passwordController,
                                        cursorHeight: 25,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        validator: (value) {
                                          RegExp regex = RegExp(
                                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                          if (value!.isEmpty) {
                                            return 'Please enter password';
                                          } else {
                                            if (!regex.hasMatch(value)) {
                                              return 'Enter valid password';
                                            } else {
                                              return null;
                                            }
                                          }
                                        },
                                        obscureText: !_isPasswordVisible,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 6),
                                          filled: true,
                                          fillColor: Colors.grey.shade500,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade900),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          hintText: "Password",
                                          hintStyle: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87,
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.key,
                                            color: Colors.white,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(_isPasswordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                            color: Colors.white,
                                            iconSize: 20,
                                            onPressed: () {
                                              setState(() {
                                                _isPasswordVisible =
                                                    !_isPasswordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      height: 35,
                                      child: TextFormField(
                                        controller: passwordController,
                                        cursorHeight: 25,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        validator: (value) {
                                          RegExp regex = RegExp(
                                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
                                          if (value!.isEmpty) {
                                            return 'Please enter password';
                                          } else {
                                            if (!regex.hasMatch(value)) {
                                              return ' password not same';
                                            } else {
                                              return null;
                                            }
                                          }
                                        },
                                        obscureText: !_isPasswordVisible,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 6),
                                          filled: true,
                                          fillColor: Colors.grey.shade500,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade900),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          hintText: "Confirm Password",
                                          hintStyle: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black87,
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.key,
                                            color: Colors.white,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(_isPasswordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                            color: Colors.white,
                                            iconSize: 20,
                                            onPressed: () {
                                              setState(() {
                                                _isPasswordVisible =
                                                    !_isPasswordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.greenAccent,
                                      //minimumSize: Size(100, 25),
                                    ),
                                    onPressed: () {
                                      _SignUpsubmit();
                                    },
                                    child: const Text(
                                      "Next  >>",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isLoginEnabled = true;
                                      });
                                    },
                                    child: const Text(
                                      " Have account , Sign In",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  // Center(
                                  //   child: Container(
                                  //     height: 4,
                                  //     width: screenWidth * 0.265,
                                  //     decoration: BoxDecoration(
                                  //       color: Colors.white10,
                                  //       borderRadius:
                                  //           BorderRadius.circular(30),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              )
                              //,Center(
                              //       child: ClipOval(
                              //         child: Image.asset(
                              //             "assets/icons/vonc_io_main-removebg-preview.png"),
                              //       ),
                              //     )
                              )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
