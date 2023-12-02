
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    final txtEmail = TextFormField();
    final txtPass = TextFormField();
    final space = SizedBox(height: 20,);
    final btnLogin = SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin, 
      onPressed: () => Navigator.pushNamed(context, '/dash')
    );

    final btnGmail = SocialLoginButton(
      buttonType: SocialLoginButtonType.google, 
      onPressed: () {},
    );

    final btnFacebook = SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook, 
      onPressed: () {},
    );

    final imgLogo = Image.asset('assets/pokemon.png');
    final txtRegister = TextButton(
      onPressed: () { 
        Navigator.pushNamed(context, '/register');  
      },
      child: Text('Crear cuenta')
    );

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white,Colors.yellow])
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                imgLogo,
                txtEmail,
                space,
                txtPass,
                space,
                btnLogin,
                space,
                btnGmail,
                space,
                btnFacebook,
                space,
                txtRegister
              ],
            ),
          ),
        ),
      ),
    );
  }
}