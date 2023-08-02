import 'package:customer/app/modules/auth/presentation/controllers/signin_controller.dart';
import 'package:customer/app/modules/auth/presentation/controllers/signup_controller.dart';
import 'package:customer/shared/utils/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController _controller = Modular.get<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: _controller.formField,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Cadastre-se",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      validator: Validators.name,
                      controller: _controller.nameTextController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome completo',
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      validator: Validators.email,
                      controller: _controller.emailTextController,
                      decoration: const InputDecoration(
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
                    TextFormField(
                      validator: _controller.passwordEquals,
                      controller: _controller.passwordTextController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(
                            Icons.lock,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      validator: _controller.passwordEquals,
                      controller: _controller.confirmPasswordTextController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirmação de senha',
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(
                            Icons.lock,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Observer(
                      builder: (_) => ElevatedButton(
                        onPressed: _controller.isLoading
                            ? null
                            : () => _controller.signUp(),
                        child: _controller.isLoading
                            ? SizedBox(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                ),
                                height: 25.0,
                                width: 25.0,
                              )
                            : Text(
                                "Criar conta",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
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
                    Visibility(
                      visible: false,
                      child: SignInButton(
                        Buttons.Google,
                        onPressed: () {},
                        text: "Entrar com o Google",
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                                text: 'Já possui uma conta? faça ',
                                style: TextStyle(color: Colors.black54),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Login!',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => Navigator.of(context).pop())
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
      ),
    );
  }
}
