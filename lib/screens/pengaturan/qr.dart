import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:clone_telegram/provider/theme.dart';
import 'package:clone_telegram/provider/qr_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class Qr extends StatefulWidget {
  const Qr({Key? key}) : super(key: key);

  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {
  int selectedCard = -1;
  @override
  Widget build(BuildContext context) {
    bool _isMoon = false;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final Color _warnaQr = Provider.of<QrController>(context).colorQr;
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(themeNotifier.isDark
                  ? "assets/chat_bg_dark.jpg"
                  : "assets/chat_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          width: width,
          height: height,
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: width * 0.17, left: width * 0.02),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: width * 0.2),
                    padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                    width: width * 0.6,
                    height: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        QrImage(
                          foregroundColor: _warnaQr == Colors.green
                              ? Colors.green
                              : _warnaQr,
                          data: 'Telegram Clone by Yoga',
                          version: QrVersions.auto,
                          size: width * 0.5,
                          gapless: false,
                          embeddedImage: AssetImage('assets/telegram.png'),
                          embeddedImageStyle: QrEmbeddedImageStyle(
                            size: Size(30, 30),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        Text(
                          "@YOGABAYUAP",
                          style: TextStyle(
                            color: _warnaQr == Colors.green
                                ? Colors.green
                                : _warnaQr,
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: width * 0.42,
                    top: width * 0.12,
                    child: CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/seed/girl/200/300',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: width * 0.2),
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                width: width * 0.6,
                height: width * 0.56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: themeNotifier.isDark
                      ? Color.fromARGB(255, 29, 31, 31)
                      : Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kode QR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        AnimatedIconButton(
                          size: 23,
                          onPressed: () {
                            setState(() {
                              _isMoon = !_isMoon;
                            });
                            themeNotifier.isDark
                                ? themeNotifier.isDark = false
                                : themeNotifier.isDark = true;
                          },
                          duration: const Duration(milliseconds: 500),
                          splashColor: Colors.transparent,
                          icons: const <AnimatedIconItem>[
                            AnimatedIconItem(
                              icon: Icon(Icons.wb_sunny_outlined,
                                  color: Colors.blue),
                            ),
                            AnimatedIconItem(
                              icon: Icon(Icons.mode_night_outlined,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: width,
                      height: width * 0.2,
                      child: ListView.builder(
                        itemCount: carditems.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final _cardItem = carditems[index];
                          return Consumer<ThemeModel>(
                            builder:
                                (context, ThemeModel themeNotifier, child) {
                              return Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: themeNotifier.isDark
                                      ? Color.fromARGB(255, 29, 31, 31)
                                      : Colors.white,
                                  border: Border.all(
                                    color: selectedCard == index
                                        ? Colors.blue
                                        : Colors.white,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                width: width * 0.17,
                                height: width * 0.2,
                                child: Center(
                                  child: FractionallySizedBox(
                                    heightFactor:
                                        0.9, // Adjust those two for the white space
                                    widthFactor: 0.9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(themeNotifier.isDark
                                              ? "assets/chat_bg_dark.jpg"
                                              : "assets/chat_bg.jpg"),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.linearToSrgbGamma(),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Provider.of<QrController>(context,
                                                      listen: false)
                                                  .changeColor(
                                                      _cardItem.warnaQr);
                                              setState(() {
                                                selectedCard = index;
                                              });
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              padding: EdgeInsets.all(1),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              child: QrImage(
                                                padding: EdgeInsets.zero,
                                                foregroundColor:
                                                    _cardItem.warnaQr,
                                                data: 'Telegram Clone by Yoga',
                                                version: QrVersions.auto,
                                                size: width * 0.06,
                                                gapless: false,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            _cardItem.iconCard,
                                            size: 17,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.blue,
                      ),
                      width: width,
                      height: 40,
                      child: TextButton(
                        onPressed: () {
                          Share.share(
                              'Telegram Clone by Yoga Bayu Anggana Pratama');
                        },
                        child: Text(
                          "Bagikan Kode QR",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class CardQR {
  final Color warnaQr;
  final IconData iconCard;

  CardQR({
    required this.warnaQr,
    required this.iconCard,
  });
}

List<CardQR> carditems = [
  CardQR(
    warnaQr: Colors.green,
    iconCard: Icons.home,
  ),
  CardQR(
    warnaQr: Colors.red,
    iconCard: Icons.android,
  ),
  CardQR(
    warnaQr: Colors.blue,
    iconCard: Icons.diamond,
  ),
  CardQR(
    warnaQr: Colors.yellow,
    iconCard: Icons.theater_comedy,
  ),
  CardQR(
    warnaQr: Colors.orange,
    iconCard: Icons.local_activity_rounded,
  ),
];
