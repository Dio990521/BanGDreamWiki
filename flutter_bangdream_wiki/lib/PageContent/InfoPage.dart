import 'package:flutter/material.dart';

/// words I want to say to users
class InfoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("声明",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  "本App数据内容均来自于 Bestdori! 与 Bandori数据库",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlue,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Text(
                  "本App为免费App，无商业用途，也请不要他人私自利用本App进行商业行为",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlue,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Text(
                  "若有任何使用上的反馈及建议，请发送至邮件dcz33118170@gmail.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlue,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
