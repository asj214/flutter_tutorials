import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_tutorials/constants.dart';
import 'package:flutter_tutorials/apis/member.dart';
import 'package:flutter_tutorials/components/dialogs.dart';

class MemberJoin extends StatefulWidget {
  const MemberJoin({super.key});
  @override
  State<MemberJoin> createState() => _MemberJoin();
}

class _MemberJoin extends State<MemberJoin> {
  final inputPad = const EdgeInsets.all(10);
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  String email = '';
  String name = '';
  String password = '';

  void tabJoinButton () async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final member = RegisterMember(
        email: email,
        name: name,
        password: password,
      );

      final resp = await registerMember(member);
      if (mounted) { 
        if (resp.statusCode == 201) {
          final snackBar = SnackBar(
            content: const Text('회원가입 완료'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              },
            ),
            width: 280.0, // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0, // Inner padding for SnackBar content.
            ),
            duration: const Duration(milliseconds: 1500),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          // final Map<String, dynamic> respBody = jsonDecode(resp.body);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const BasicDialog(message: '에러가 발생했습니다.');
            },
          );
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tutorial',
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 40, 5, 40),
              child: Text('드루와', style: TextStyle(fontSize: 50, color: Colors.green),),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(0)
                  ),
                  hintText: '이메일',
                  isDense: true,
                  contentPadding: inputPad,
                ),
                // focusNode: focusNode,
                validator: (value) {
                  String chkVal = value.toString();
                  if (!EmailValidator.validate(chkVal)) {
                    return 'You Need Press Enter Right Email';
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    email = val.toString();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(0)
                  ),
                  hintText: '이름',
                  isDense: true,
                  contentPadding: inputPad,
                ),
                validator: (value) {
                  if (value.toString().length < 2) {
                    return 'Dammit!!!!';
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    name = val.toString();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: TextFormField(
                obscureText: true, // 패스워드 항목으로 사용하려면 추가
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(0)
                  ),
                  hintText: '비밀번호',
                  isDense: true,
                  contentPadding: inputPad
                ),
                onSaved: (val) {
                  setState(() {
                    password = val.toString();
                  });
                },
              )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                onPressed: () => tabJoinButton(),
                child: const Text('회원가입', style: TextStyle(color: primaryTextColor))
              )
            ),
          ],
        ),
      )
    );
  }
}