import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'home_view.dart';

class OAuthView extends StatelessWidget {
  const OAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse('http://localhost:8080/api/v1/auth/google')),
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
            userAgent: 'random',
            javaScriptEnabled: true,
            useShouldOverrideUrlLoading: true,
            useOnLoadResource: true,
            cacheEnabled: true,
          )),
          onLoadStop: (controller, url) async {
            // log(url.toString());
            if (url.toString().startsWith(
                'http://localhost:8080/api/v1/auth/google/redirect')) {
              var resp = await controller.evaluateJavascript(
                  source: "window.document.body.innerText");
              log("The response: " + resp);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
              );
            }
          },
        ),
      ),
    );
  }
}
