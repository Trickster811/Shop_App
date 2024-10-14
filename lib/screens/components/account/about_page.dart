import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    super.key,
  });

  Future<void> _launchUrl(Uri url) async {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
      webViewConfiguration: const WebViewConfiguration(
        headers: <String, String>{'my_header_key': 'my_header_value'},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Uri github = Uri.parse('https://github.com/Trickster811');
    final Uri mail = Uri.parse('https://nedaoukajoachim@gmail.com');
    final Uri pinterest = Uri.parse('https://www.pinterest.com/MacNight_nj/');
    final Uri linkedIn =
        Uri.parse('https://cm.linkedin.com/in/joachim-nedaouka-0b43b2228');
    final Uri youtube = Uri.parse('https://www.youtube.com/@macnight_nj');

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
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
          'A propos',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/graph.6.svg',
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/call.5.svg',
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            right: -MediaQuery.of(context).size.width * 0.6,
            bottom: 0,
            child: Image.asset(
              'assets/images/butterfly_company_logo.png',
              color: const Color.fromARGB(255, 153, 51, 51).withOpacity(0.2),
              // colorBlendMode: BlendMode.modulate,
              // width: MediaQuery.of(context).size.width * 3,
              height: MediaQuery.of(context).size.height * 0.65,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(),
                  const Spacer(),
                  Image.asset(
                    'assets/images/butterfly_logo_minim.png',
                    height: 65,
                    width: 65,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'B-Shop',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Application Publicitaire',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '1.0.0+1',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Liens',
                    style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.w700,
                      // color: Colors.black45,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 250,
                    // padding: EdgeInsets.all(2.0),
                    margin: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            _launchUrl(github);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/github.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ), // width: 25,
                            // height: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchUrl(mail);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/mail.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            width: 25,
                            height: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchUrl(pinterest);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/pinterest.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            width: 25,
                            height: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchUrl(linkedIn);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/linked_in.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            width: 25,
                            height: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchUrl(youtube);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/youtube.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
