import 'package:flutter/material.dart';
import 'package:moviles/widgets/card_intent_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class IntencionesScreen extends StatelessWidget {
  const IntencionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intenciones')),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( 
          childAspectRatio: 12/9,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        children: [
          GestureDetector(
            onTap: () => _openInWeb('https://www.unicuc.mx'),
            child: const CardIntentWidget(icon: Icons.open_in_browser_rounded)
          ),
          GestureDetector(
            onTap: () => _openPhone('4612279093'),
            child: const CardIntentWidget(icon: Icons.phone_android)
          ),
          GestureDetector(
            onTap: () => _openSMS('4612279093'),
            child: const CardIntentWidget(icon: Icons.message)
          ),
          GestureDetector(
            onTap: () => _openEmail('isctorres@gmail.com?'),
            child: const CardIntentWidget(icon: Icons.email)
          ),
          GestureDetector(
            onTap: (){},
            child: const CardIntentWidget(icon: Icons.camera)
          )
        ],
      ),
    );
  }


  _openInWeb(String url) async {
    Uri uri = Uri.parse(url);
    if( await canLaunchUrl(uri) ){
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  _openPhone(String number) async {
    Uri uri = Uri.parse('tel: $number');
    if( await canLaunchUrl(uri) ){
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  _openSMS(String number) async {
    Uri uri = Uri.parse('sms: $number');
    if( await canLaunchUrl(uri) ){
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  _openEmail(String email) async {

    Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Hola Mundo&body=Enviando intenciones'
    );

    //var emailData = uri.toString();
    if( await canLaunchUrl(uri) ){
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}