import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:b_shop/utils/controllers.utils.dart';
import 'package:b_shop/utils/utils.dart';
import 'package:b_shop/welcome_pages/auth/sign_up_page.dart';
import 'package:b_shop/welcome_pages/start_page.dart';

class SignInScreen extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const SignInScreen({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoading = false;
  // Variables to get user entries
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  // Form key
  final _signInFormKey = GlobalKey<FormState>();

  String? userType;

  Future<void> signInWithEmailAndPassword() async {
    try {
      if (!await Internet.checkInternetAccess()) {
        UtilFunctions.showFlashMessage(
          'Pas d\'internet',
          Colors.blue,
        );
        return;
      }
      setState(() {
        isLoading = true;
      });
      User? userSignedIn = await Auth.signInWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
      if (userSignedIn != null) {
        // print(userSignedIn);
        UserAccount.localSaving().then(
          (value) => showCupertinoModalPopup(
            context: context,
            builder: (context) => CupertinoActionSheet(
              title: Text(
                'Bon retour M/Mme ${userSignedIn.displayName!.substring(0, userSignedIn.displayName!.indexOf('|'))}!!',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              message: const Text(
                'Vos informations ont été validées avec succès',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                          userInfo: {
                            'userType': userSignedIn.displayName!.substring(
                                userSignedIn.displayName!.indexOf('|') + 1),
                            'username': userSignedIn.displayName!.substring(
                                0, userSignedIn.displayName!.indexOf('|')),
                            'phone': userSignedIn.phoneNumber,
                            'email': userSignedIn.email,
                            'photoURL': userSignedIn.photoURL,
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Continuer d\'utiliser B-Shop',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(
        e.message,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _signInFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Hero(
                  tag: 'description_tag',
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Shop\nApp'.toUpperCase(),
                          textAlign: TextAlign.center,
                          textScaler: const TextScaler.linear(1.6),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          'by MacNight_nj',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    'Connexion',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: Text('Email'),
                ),
                TextFormField(
                  controller: _controllerEmail,
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'votre email',
                    contentPadding: const EdgeInsets.only(
                      left: 10.0,
                      bottom: 10.0,
                    ),
                    filled: true,
                    fillColor: primaryColor.withOpacity(0.1),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner cet élément',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Mot de passe'),
                TextFormField(
                  controller: _controllerPassword,
                  cursorColor: primaryColor,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'mot de passe',
                    contentPadding: const EdgeInsets.only(
                      left: 10.0,
                      bottom: 10.0,
                    ),
                    filled: true,
                    fillColor: primaryColor.withOpacity(0.1),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner cet élément',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Nouveau parmi nous? '),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(
                                userInfo: const [], deviceSize: deviceSize),
                          ),
                        );
                      },
                      child: const Text(
                        "S'inscire",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 50.0,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text(
                          'Annuler',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        // if (!_signInFormKey.currentState!.validate()) {
                        //   return UtilFunctions.showFlashMessage(
                        //     'Veuillez remplir tous les champs !!!',
                        //     Colors.red,
                        //   );
                        // }

                        if (_signInFormKey.currentState!.validate() &&
                            !isLoading) {
                          await signInWithEmailAndPassword();
                        }
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 30.0,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              )
                            : const Text(
                                'Se Connecter',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
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
