import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    Key? key,
  }) : super(key: key);

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'A propos',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
        actions: [
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
            right: -MediaQuery.of(context).size.width * 0.8,
            bottom: 0,
            child: Image.asset(
              'assets/images/hidden_icon_logo.png',
              // color: Colors.white.withOpacity(0.2),
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
                    'assets/images/hidden_icon_logo.png',
                    height: 65,
                    width: 65,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'ShopApp',
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
                      fontFamily: 'Comfortaa_bold',
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
