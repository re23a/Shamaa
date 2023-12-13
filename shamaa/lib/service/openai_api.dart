import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> chatGPT(String msg) async {
  final url = Uri.parse("https://api.openai.com/v1/chat/completions");
  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer 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"
    },
    body: jsonEncode(
      {
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content":
                "You are a teacher for children and try to help them learn In Arabic language with emoji."
          },
          {"role": "user", "content": msg}
        ],
        "temperature": 1,
        "max_tokens": 256,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      },
    ),
  );
  return jsonDecode(response.body)['choices'][0]["message"]["content"];
}

String utf8convert(String text) {
  List<int> bytes = text.toString().codeUnits;
  return utf8.decode(bytes);
}
