import 'package:customer/app/modules/home/home_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DialogSuccessWidget extends StatelessWidget {
  const DialogSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 130,
              child: Image.asset('assets/images/dialog_success.png'),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Text(
              "Seu ponto foi adicionado! 🎉🥳 ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                  },
                  child: Text("Voltar")),
            )
          ],
        ),
      ),
    );
  }
}
