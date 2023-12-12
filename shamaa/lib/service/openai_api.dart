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
