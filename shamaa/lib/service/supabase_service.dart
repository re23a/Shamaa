import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> supabaseConfig() async {
  await Supabase.initialize(
    url: "https://yoaylpzsutwohboeszaz.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlvYXlscHpzdXR3b2hib2VzemF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk3NzcyMDksImV4cCI6MjAxNTM1MzIwOX0.VJZX5mB4m5Lq8ZBIdlRyhjKxmbEkS-DHE3C04dY03Pk",
  );
}
