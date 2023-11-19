import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../appConst/index.dart';

var socialLoginicons= Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  googleIcon,
                                  width: 23,
                                  height: 23,
                                  fit: BoxFit.cover,
                                )).box.rounded.color(halfwhite).make(),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  facebookIcon,
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                )).box.rounded.color(halfwhite).make(),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  appleIcon,
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                )).box.rounded.color(halfwhite).make(),
                          ],
                        );