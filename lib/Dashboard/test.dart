// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, annotate_overrides, library_private_types_in_public_api, unused_local_variable, unused_label, dead_code, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class test extends StatefulWidget {
  final token;
  const test({@required this.token, Key? key}) : super(key: key);

  @override
  _test createState() => _test();
}

class _test extends State<test> {
  late String email;
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    email = jwtDecodedToken['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(email)],
      ),
    ));
  }
}
