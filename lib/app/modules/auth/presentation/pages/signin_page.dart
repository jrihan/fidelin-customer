import 'package:customer/app/modules/auth/presentation/controllers/signin_controller.dart';
import 'package:customer/app/modules/auth/presentation/pages/forgot_password_page.dart';
import 'package:customer/app/modules/auth/presentation/pages/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'dart:io' show Platform;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInController _controller = Modular.get<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 120,
                    child: Image.asset('assets/images/white-logo.png'),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.mail,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Observer(
                    builder: (_) => TextField(
                      obscureText: _controller.passwordVisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () =>
                                _controller.togglePasswordVisible(),
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _controller.passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                        border: const OutlineInputBorder(),
                        labelText: 'Senha',
                        prefixIcon: const Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(
                            Icons.lock,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      enableFeedback: false,
                      child: Text(
                        'Esqueceu a senha?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            ),
                          }),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Observer(
                    builder: (_) => ElevatedButton(
                      onPressed: _controller.loading
                          ? null
                          : () => _controller.signIn(),
                      child: _controller.loading
                          ? SizedBox(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                              ),
                              height: 25.0,
                              width: 25.0,
                            )
                          : Text(
                              "Entrar",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color:
                                      Theme.of(context).colorScheme.background),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Row(children: <Widget>[
                    Expanded(
                      child: Divider(),
                    ),
                    Padding(
                        child: Text(
                          "ou",
                          style: TextStyle(color: Colors.black45),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10)),
                    Expanded(
                      child: Divider(),
                    ),
                  ]),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {},
                    text: "Entrar com o Google",
                  ),
                  Visibility(
                    visible: Platform.isIOS,
                    child: SignInButton(
                      Buttons.Apple,
                      onPressed: () {},
                      text: "Entrar com a Apple",
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'Não tem uma conta? ',
                              style: TextStyle(color: Colors.black54),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Cadastre-se!',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpPage(),
                                          ),
                                        ),
                                )
                              ]),
                        ),
                      )),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
