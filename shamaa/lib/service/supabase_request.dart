import 'package:shamaa/model/account.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> increaseAccountStars(int incrementStars) async {
  final SupabaseClient client = Supabase.instance.client;
  try {
    final fetchResponse = await client
        .from('account')
        .select()
        .eq('user_id', client.auth.currentUser!.id)
        .single()
        .execute();
    if (fetchResponse.data == null) {
      throw Exception('Account not found');
    }
    final Account currentAccount = Account.fromMap(fetchResponse.data);
    final newStarCount = currentAccount.stars + incrementStars;
    await client
        .from('account')
        .update({'stars': newStarCount})
        .eq('user_id', client.auth.currentUser!.id)
        .execute();
  } catch (e) {
    print('Error updating account stars: $e');
  }

//  TO USE  await increaseAccountStars(5);
}

Future<void> updateAccount({
  String? name,
  DateTime? dateOfBirth,
  String? studentClass,
  int? creatureIndex,
}) async {
  final SupabaseClient client = Supabase.instance.client;

  try {
    final Map<String, dynamic> updateData = {
      if (name != null) 'name': name,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth.toIso8601String(),
      if (studentClass != null) 'student_class': studentClass,
      if (creatureIndex != null) 'creature_index': creatureIndex,
    };
    await client
        .from('account')
        .update(updateData)
        .eq('user_id', client.auth.currentUser!.id)
        .execute();
  } catch (e) {
    print('Error updating account: $e');
  }

  // TO USE await updateAccount();
}
