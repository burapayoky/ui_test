import 'package:flutter/material.dart';
import 'package:ui_test/main.dart';
import 'package:ui_test/src/widget/TextLage.dart';
import 'package:ui_test/src/widget/bottom_wiget.dart';

import 'widget/appbar/action_flag_icon.dart';

class FristPage extends StatefulWidget {
  const FristPage({super.key});

  @override
  State<FristPage> createState() => _FristPageState();
}

class _FristPageState extends State<FristPage> {
  //Listitem? item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                //SnackBar(contianner())
                showModalBottomSheet(
                    context: context,
                    constraints: BoxConstraints(maxWidth: double.infinity),
                    builder: (context) => (const SafeArea(
                            child: Padding(
                          padding: EdgeInsets.symmetric(),
                          child: BottomWidget(),
                        ))));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.restaurant,
                    size: context.heightsize / 40,
                    color: Colors.black54,
                  ),
                  Text(
                    'Soi Siam',
                    style: TextStyle(
                        fontSize: context.heightsize / 40,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          actions: const [
            ActionsFlagIcon(),
          ],
        ),
        /////body
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: context.heightsize / 8),
                  child: Column(
                    children: [
                      TextLage(
                          hinttext: 'Self-Service',
                          textsize: context.heightsize / 14),
                      TextLage(
                          hinttext: 'Experience.',
                          textsize: context.heightsize / 14),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.heightsize / 30,
                ),
                Text(
                  'Form self-order to self-checkout',
                  style: TextStyle(fontSize: context.heightsize / 48),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.credit_card,
                      size: context.heightsize / 48,
                      color: Colors.red,
                    ),
                    Text(
                      ' Aceept only Credit Card',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: context.heightsize / 48,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoute.order);
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          )),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue)),
                      child: Text(
                        'Tap to Order',
                        style: TextStyle(
                            fontSize: context.heightsize / 50,
                            color: Colors.white),
                      )),
                ),
                //end of button
              ],
            ),
            //end of body text
            //gif
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/gif/gif1.gif'),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: context.widthsize / 35,
                      top: context.heightsize / 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.restaurant,
                          size: context.widthsize / 38,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Soi Siam',
                        style: TextStyle(
                            fontSize: context.widthsize / 40,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

extension DateScale on BuildContext {
  double get heightsize => MediaQuery.of(this).size.height;
  double get widthsize => MediaQuery.of(this).size.width;
  Size get sizescreen => MediaQuery.of(this).size;
}
