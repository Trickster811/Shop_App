import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final helpTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow-left-2.2.svg",
            height: 30,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          'Aide',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Monstserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10000000000),
              ),
              child: TextField(
                controller: helpTextController,
                textAlign: TextAlign.center,
                cursorColor: Theme.of(context).iconTheme.color,
                decoration: const InputDecoration(
                  hintText: 'votre texte ici',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text('Envoyer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
