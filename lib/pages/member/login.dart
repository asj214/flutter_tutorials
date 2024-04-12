import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_tutorials/constants.dart';
import 'package:flutter_tutorials/apis/member.dart';
import 'package:flutter_tutorials/utils/token.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final inputPad = const EdgeInsets.all(10);
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 40, 5, 40),
              child: Text('로그인페이지', style: TextStyle(fontSize: 50, color: Colors.green),),
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
                onPressed: () => authenticate(),
                child: const Text('로그인', style: TextStyle(color: primaryTextColor))
              )
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: null,
                    child: Text('아이디/비밀번호 찾기'),
                  ),
                  
                  VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                    color: Colors.grey,
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text('회원가입'),
                  )
                ],
              )
            ),
          ]
        )
      ),
    );
  }

  void authenticate () async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        LoginRespData resp = await loginMember(LoginData(
          email: email,
          password: password
        ));

        saveToken(resp.token);
        // aysnc 이기 때문에 렌더링 시점 차이로 인해서 mounted 사용해주어야함
        if (mounted) {
          Navigator.of(context).pushNamed('/home');
        }

      } catch (e) {
        debugPrint('로그인 실패: {$e}');
      }
    }
  }
}