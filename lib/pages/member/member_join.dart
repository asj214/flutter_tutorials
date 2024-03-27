import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_tutorials/constants.dart';

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

  void tabJoinButton () {
    debugPrint('tab tab tab');
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        _formKey.currentState!.validate();
      }
    });
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
              child: Text('환영', style: TextStyle(fontSize: 50, color: Colors.green),),
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
                focusNode: focusNode,
                validator: (value) {
                  String chkVal = value.toString();
                  if (!EmailValidator.validate(chkVal)) {
                    return 'You Need Press Enter Right Email';
                  }
                  return null;
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
                focusNode: focusNode,
                validator: (value) {
                  if (value.toString().length < 2) {
                    return 'Dammit!!!!';
                  }
                  return null;
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
                onPressed: tabJoinButton,
                child: const Text('회원가입', style: TextStyle(color: primaryTextColor))
              )
            ),
          ],
        ),
      )
    );
  }
}