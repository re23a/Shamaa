import 'package:shamaa/model/account.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> increaseAccountStars(int incrementStars, int? accountIndex) async {
  final SupabaseClient client = Supabase.instance.client;
  if (client.auth.currentUser == null) {
    print('No authenticated user found.');
    return;
  }
  String userId = client.auth.currentUser!.id;
  try {
    final response =
        await client.from('account').select().eq('user_id', userId).execute();
    List<dynamic> accountData = response.data;
    if (accountData.isEmpty) {
      print('No accounts found for user.');
      return;
    }
    List<Account> accounts =
        accountData.map((data) => Account.fromMap(data)).toList();
    int selectedAccountIndex =
        accountIndex != null && accountIndex < accounts.length
            ? accountIndex
            : 0;
    if (selectedAccountIndex < 0 || selectedAccountIndex >= accounts.length) {
      print('Index out of range.');
      return;
    }

    Account selectedAccount = accounts[selectedAccountIndex];
    int newStarCount = selectedAccount.stars + incrementStars;

    await client
        .from('account')
        .update({'stars': newStarCount})
        .eq('user_id', userId)
        .eq('id', selectedAccount.id)
        .execute();
  } catch (e) {
    print('Exception occurred: $e');
  }
}

Future<void> updateAccount(Account account, int? id) async {
  final SupabaseClient client = Supabase.instance.client;
  String userId = client.auth.currentUser!.id;

  try {
    // Map with only the fields to be updated
    final Map<String, dynamic> updateData = {
      'name': account.name,
      'date_of_birth': account.dateOfBirth.toIso8601String(),
      'student_class': account.studentClass,
      'creature_index': account.creatureIndex,
    };

    // Update the account in the database
    await client
        .from('account')
        .update(updateData)
        .eq('user_id', userId)
        .single();
  } catch (e) {
    print('Error updating account: $e');
  }
}
