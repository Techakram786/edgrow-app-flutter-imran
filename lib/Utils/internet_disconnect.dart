import 'package:flutter/material.dart';


class InternetDisconnect extends StatelessWidget {
  const InternetDisconnect({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: ListView(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            bubbles(height: 100, width: 100),
                            Padding(
                              padding: const EdgeInsets.only(top: 75, left: 55),
                              child: bubbles(height: 60, width: 60),
                            ),
                            Positioned(
                              right: 30,
                              bottom: 10,
                              child: bubbles(height: 60, width: 60),
                            ),
                          ],
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            const SizedBox(height: 100, width: 100),
                            Positioned(
                              right: 30,
                              bottom: 10,
                              child: bubbles(height: 60, width: 60),
                            ),
                          ],
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 60, left: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            bubbles(height: 100, width: 100),
                            Positioned(
                              right: 30,
                              bottom: 10,
                              child: bubbles(height: 60, width: 60),
                            ),
                            Positioned(
                              right: 65,
                              top: 10,
                              child: bubbles(height: 60, width: 60),
                            ),
                          ],
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 60, left: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            const SizedBox(
                              height: 130,
                              width: 100,
                            ),
                            Positioned(
                              left: 30,
                              bottom: 10,
                              child: bubbles(height: 60, width: 60),
                            ),
                            Positioned(
                              left: 65,
                              top: 10,
                              child: bubbles(height: 60, width: 60),
                            ),
                            Positioned(
                              right: 20,
                              top: 10,
                              child: bubbles(height: 100, width: 100),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No internet Connection !',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Text(
                        'Your internet connection is down. please fix it and then you can continue using App!',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container bubbles({required double height, required double width}) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff5d5d5d).withOpacity(0.1),
          shape: BoxShape.circle),
      height: height,
      width: width,
    );
  }
}
