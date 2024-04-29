import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:untitled/models/articles.dart';
import 'package:untitled/services/api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:typed_data';


class newspage extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<newspage> with TickerProviderStateMixin {
  int currentIndex = 0;

  // List<Map<String, dynamic>> dataList = [
  //   {
  //     'heading':
  //         'രാജീവ് ചന്ദ്രശേഖറുമായി കൂട്ടു ചേർന്നപ്പോൾ അന്വേഷണം നിലച്ചു; ഇ.പി പറയുന്നത് സുരേന്ദ്രൻ പോലും പറയാത്തത..',
  //     'description':
  //         'തിരുവനന്തപുരം∙ കേന്ദ്രമന്ത്രി രാജീവ് ചന്ദ്രശേഖറിന്റെയും എൽഡിഎഫ് കൺവീനർ ഇ.പി.ജയരാജന്റെയും സ്ഥാപനങ്ങൾഇഡിയുടേയും ഇൻകം ടാക്സിന്റെയും പരിശോധന കഴിഞ്ഞപ്പോഴാണെന്ന് പ്രതിപക്ഷ നേതാവ് വി.ഡി.സതീശൻ. ബിസിനസ് ബന്ധം രംഭിച്ചശേഷം പിന്നീട് കേന്ദ്ര ഏജൻസികളുടെ പരിശോധനയുണ്ടായില്ല ശേഖറിന്റെ നേതൃത്വത്തിലുള്ള റിസോർട്ടാണ് നിരാമയ. രാജീവ് ചന്ദ്രശേഖർ സർക്കാര റിസോർട്ട് ഉദ്ഘാടനം ',
  //     'imagePath': 'lib/assets/img.jpg',
  //     'isExpanded': false,
  //     'isBookmarkPressed': false,
  //     'isSharePressed': false,
  //     'onlineLink':
  //         'https://www.manoramaonline.com/news/latest-news/2024/04/01/v-d-satheesan-speak-against-pinarayi-vijayan.amp.html',
  //   },
  //   {
  //     'heading':
  //         'രാജീവ് ചന്ദ്രശേഖറുമായി കൂട്ടു ചേർന്നപ്പോൾ അന്വേഷണം നിലച്ചു; ഇ.പി പറയുന്നത്',
  //     'description':
  //         'കേന്ദ്രമന്ത്രി രാജീവ് ചന്ദ്രശേഖറിന്റെ നേതൃത്വത്തിലുള്ള റിസോർട്ടാണ് നിരാമയ. രാജീവ് ചന്ദ്രശേഖർ സർക്കാര റിസോർട്ട് ഉദ്ഘാടനം ചെയ്തപ്പോൾ അദ്ദേഹത്തിന്റെ കുടുംബാംഗങ്ങൾ പങ്കെടുത്തിരുന്നു. വൈദേഹം റിസോർട്ടുമായി എകേന്ദ്രമന്ത്രി രാജീവ് ചന്ദ്രശേഖറിന്റെ നേതൃത്വത്തിലുള്ള റിസോർട്ടാണ് നിരാമയ. രാജീവ് ചന്ദ്രശേഖർ സർക്കാര റിസോർട്ട് ഉദ്ഘാടനം ചെയ്തപ്പോൾ അദ്ദേഹത്തിന്റെ കുടുംബാംഗങ്ങൾ പങ്കെടുത്തിരുന്നു. ',
  //     'imagePath': 'lib/assets/img2.jpg',
  //     'isExpanded': false,
  //     'isBookmarkPressed': false,
  //     'isSharePressed': false,
  //     'onlineLink':
  //         'https://www.manoramaonline.com/news/latest-news/2024/04/01/v-d-satheesan-speak-against-pinarayi-vijayan.amp.html',
  //   },
  //   {
  //     'heading':
  //         'സദാനന്ദ ഗൗഡ ബിജെപി വിട്ടേക്കുമെന്ന് സൂചന; മൈസൂരുവിൽ കോൺഗ്രസ് സ്ഥാനാർഥിയായേക്കും',
  //     'description':
  //         'മൈസൂരുവിൽ വൊക്കലിഗ വിഭാഗത്തിൽനിന്നുള്ള സ്ഥാനാർഥിയെ മത്സരിപ്പിക്കാനാണ് കോൺഗ്രസ് ശ്രമിക്കുന്നത്. പാർട് സീറ്റ് നിഷേധിച്ചതിനെ തുടർന്ന് മുൻ മുഖ്യമന്ത്രി ജഗദീഷ് ഷെട്ടറും കഴിഞ്ഞ വർഷം നിയമസഭാ തിരഞ്ഞെടുപ്പിനു മത്സരിച്ചെങ്കിലും പരാജയപ്പെട്ടു. ജനുവരിയിൽ ബിജെപിയിൽ തിരിച്ചെത്തിയ ഷെട്ടർ രാജീവ് ചന്ദ്രശേഖർ സർക്കാര റിസോർട്ട് ഉദ്ഘാടനം ചെയ്തപ്പോൾ അദ്ദേഹത്തിന്റെ കുടുംബാംഗങ്ങൾ പങ്കെടുത്തിരുന്നു.',
  //     'imagePath': 'lib/assets/img3.jpg',
  //     'isExpanded': false,
  //     'isBookmarkPressed': false,
  //     'isSharePressed': false,
  //     'onlineLink':
  //         'https://www.manoramaonline.com/news/latest-news/2024/04/01/v-d-satheesan-speak-against-pinarayi-vijayan.amp.html',
  //   },
  //   {
  //     'heading':
  //         'രാഹുലിനെതിരെ ആർഎസ്എസ് നൽകിയിരിക്കുന്നത് 16 കേസുകൾ’: പിണറായി കോൺഗ്രസ',
  //     'description':
  //         'കാസർകോട്∙ മുഖ്യമന്ത്രി പിണറായി വിജയന് എതിരെ രൂക്ഷവിമർശനവുമായി പ്രതിപക്ഷനേതാവ് വി.ഡി.സതീശൻ. 30 ദിവസമായി എല്ലാ യോഗങ്ങളിലും മുഖ്യമന്ത്രി എഴുതി വായിക്കുന്നത് ഒരേ കാര്യമാണെന്നും കോണ്‍ഗ്രസിനെതിരെ പച്ചക്കള്ളം പറയുന്ന മുഖ്യമന്ത്രി കേരളത്തെ ബാധിക്കുന്ന ഒരു വിഷയങ്ങളിലും പ്രതികരിക്കുന്നില്ലെന്നും സതീശൻകുറ്റപ്പെടുത്തി.കേരളത്തിന്റെ മുഖ്യമന്ത്രിയാണെന്നു പിണറായി വിജയന്‍ മറന്നു പോകരുത്. റിയാസ് മൗലവി കേസിലെ പ്രതികളെ രക്ഷി',
  //     'imagePath': 'lib/assets/img4.png',
  //     'isExpanded': false,
  //     'isBookmarkPressed': false,
  //     'isSharePressed': false,
  //     'onlineLink':
  //         'https://www.manoramaonline.com/news/latest-news/2024/04/01/v-d-satheesan-speak-against-pinarayi-vijayan.amp.html',
  //   },
  //   {
  //     'heading':
  //         'ഇലക്ടറല്‍ ബോണ്ടിൽ മാത്രം സുതാര്യത വേണം! സിപിഎമ്മിന് വ്യാജ അക്കൗണ്ടുകൾ എത്രയുമാവാം:',
  //     'description':
  //         'ആറ്റിങ്ങൽ∙ ഇലക്ടറൽ ബോണ്ടിനെതിരെ ശബ്ദമുയർത്തുന്ന സിപിഎം, രഹസ്യ അക്കൗണ്ടുകൾ എന്തിനു സൂക്ഷിക്കുന്നുവെന് കേന്ദ്രമന്ത്രി വി. മുരളീധരൻ. സുതാര്യത ഇലക്ടറല്‍ ബോണ്ടില്‍ മാത്രം മതിയോയെന്ന് അദ്ദേഹം ചോദിച്ചു. ‘തൃശൂർ ജില്ലയിൽ മാത്രം 25 അക്കൗണ്ടുകൾ മാർക്സിസ്റ്റ് പാർട്ടിക്ക് ഉണ്ടെന്ന് ഇഡി കണ്ടെത്തി. ഈ അക്കൗണ്ടുകളില്‍ കള്ളപ്പണമാണന്നു വ്യക്തം. തൃശൂരിലെ മാത്രം കണക്കാണു പുറത്തുവന്നതെന്നും സംസ്ഥാനമാകെ',
  //     'imagePath': 'lib/assets/img5.png',
  //     'isExpanded': false,
  //     'isBookmarkPressed': false,
  //     'isSharePressed': false,
  //     'onlineLink':
  //         'https://www.manoramaonline.com/news/latest-news/2024/04/01/v-d-satheesan-speak-against-pinarayi-vijayan.amp.html',
  //   },
  // ];
  late Future<List<Article>> _futureArticles;
  List<Map<String, dynamic>> dataL = [];

  @override
  void initState() {
    super.initState();
    _futureArticles = ArticleApi.fetchArticle();
    _futureArticles.then((articles) {
      setState(() {
        dataL = articles.map((article) => article.toJson()).toList();
        print(dataL);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
                children: [
                  PageView.builder(
                    itemCount: dataL.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      Map<String, dynamic> map = dataL[index];
                      List<int> binaryImage = List<int>.from(
                          map['thumbnail']['data']['data']);
                      Image thumbnail =
                      Image.memory(Uint8List.fromList(binaryImage));
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            dataL[currentIndex]['isExpanded'] =
                            !(dataL[currentIndex]['isExpanded'] ?? false);
                          });
                        },
                        onVerticalDragEnd: (details) {
                          if (details.velocity.pixelsPerSecond.dy < 0) {
                            launch(dataL[index]['hyperlink']);
                          }
                        },
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.9,
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 36,
                                        left: 0,
                                        right: 0,
                                        child: thumbnail,
                                      ),
                                      Positioned(
                                        top: MediaQuery.of(context).size.height * 0.43,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          height: MediaQuery.of(context).size.height * 0.9,
                                          width: screenWidth * 0.9,

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 20),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                                                child: Text(
                                                  dataL[index]['heading'],
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontSize: screenWidth * 0.04,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                                                child: Text(
                                                  dataL[index]['content'],
                                                  style: TextStyle(
                                                    fontSize: screenWidth * 0.03,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.9,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewPage(
                              url: dataL[currentIndex]['hyperlink'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 100,
                        width: screenWidth * 0.9,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Color(0xFF1B3358),
                        ),
                        child: Center(
                          child: Text(
                            "hello",
                            style: TextStyle(
                              fontSize: screenWidth * 0.02,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (dataL[currentIndex]['isExpanded'] ?? false)
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.9,
                      left: 0,
                      right: 0,
                      child: Container(
                        height:100,
                        width: screenWidth * 0.9,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  dataL[currentIndex]['isBookmarkPressed'] =
                                  !(dataL[currentIndex]['isBookmarkPressed'] ??
                                      false);
                                });
                              },
                              icon: Icon((dataL[currentIndex]['isBookmarkPressed'] ??
                                  false)
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline),
                              iconSize: 40,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  dataL[currentIndex]['isSharePressed'] =
                                  !(dataL[currentIndex]['isSharePressed'] ??
                                      false);
                                });
                              },
                              icon: Icon((dataL[currentIndex]['isSharePressed'] ?? false)
                                  ? Icons.share_rounded
                                  : Icons.share_outlined),
                              iconSize: 40,
                            ),
                          ],
                        ),
                      ),



        ),
    ],),);
  }
}




// class WebViewPage extends StatelessWidget {
//   final String url;
//
//   WebViewPage({required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("WebView"),
//       ),
//       body: WebView(
//         initialUrl: url,
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }

class WebViewPage extends StatefulWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView"),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _progress,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          Expanded(
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (String url) {
                setState(() {
                  _progress = 0;
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  _progress = 1;
                });
              },
              onProgress: (int progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
              },
            ),
          ),
        ],
      ),
    );
  }
}

