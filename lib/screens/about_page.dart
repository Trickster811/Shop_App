import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ndere_ads/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  final Uri _github = Uri.parse('https://github.com/Trickster811');
  final Uri _mail = Uri.parse('https://nedaoukajoachim@gmail.com');
  final Uri _pinterest = Uri.parse('https://www.pinterest.com/MacNight_nj/');
  final Uri _linkedIn =
      Uri.parse('https://cm.linkedin.com/in/joachim-nedaouka-0b43b2228');
  final Uri _youtube = Uri.parse('https://www.youtube.com/@macnight_nj');

  Future<void> _launchUrl(Uri _url) async {
    await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
      webViewConfiguration: WebViewConfiguration(
        headers: <String, String>{'my_header_key': 'my_header_value'},
      ),
    );
  }

  double appBarHeightSize = 0;

  @override
  Widget build(BuildContext context) {
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
                  Container(),
                  Spacer(),
                  Image.asset(
                    'assets/images/hidden_icon_logo.png',
                    height: 65,
                    width: 65,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ndere Ads',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Application Publicitaire',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '1.0.0+1',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Liens',
                    style: TextStyle(
                      fontFamily: 'Comfortaa_bold',
                      // color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 250,
                    // padding: EdgeInsets.all(2.0),
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            _launchUrl(_github);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/github.svg',
                            color: Colors.white,
                            // width: 25,
                            // height: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchUrl(_mail);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/mail.svg',
                            color: Colors.white,
                            width: 25,
                            height: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchUrl(_pinterest);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/pinterest.svg',
                            color: Colors.white,
                            width: 25,
                            height: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchUrl(_linkedIn);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/linked_in.svg',
                            color: Colors.white,
                            width: 25,
                            height: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchUrl(_youtube);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/youtube.svg',
                            color: Colors.white,
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
