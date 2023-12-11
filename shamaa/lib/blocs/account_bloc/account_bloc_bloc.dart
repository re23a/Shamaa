import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shamaa/model/account.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'account_bloc_event.dart';
part 'account_bloc_state.dart';

class AccountBlocBloc extends Bloc<AccountBlocEvent, AccountBlocState> {
  final SupabaseClient supabaseClient = Supabase.instance.client;
  String get getCurrentUserId => supabaseClient.auth.currentUser!.id;

  AccountBlocBloc() : super(AccountBlocInitial()) {
    on<FetchAccounts>(_onFetchAccounts);
    on<FetchAccount>(_onFetchAccount);
    on<CreateAccountEvent>(_onCreateAccount);
    on<FetchAccountId>(_onFetchAccountsID);
  }

  Future<void> _onFetchAccounts(
      FetchAccounts event, Emitter<AccountBlocState> emit) async {
    emit(AccountLoadingState());
    try {
      final response = await supabaseClient.from('account').select().execute();
      final List<dynamic> data = response.data as List<dynamic>;
      final List<Account> accounts =
          data.map((accountData) => Account.fromMap(accountData)).toList();

      emit(GetUsersSuccessState(accounts));
    } catch (error) {
      emit(AccountErrorState(error.toString()));
      print(error);
    }
  }

  Future<void> _onFetchAccount(
    FetchAccount event,
    Emitter<AccountBlocState> emit,
  ) async {
    emit(AccountLoadingState());
    try {
      final response = await supabaseClient
          .from('account')
          .select()
          .eq('user_id', getCurrentUserId)
          .execute();

      if (response.data != null && response.data.isNotEmpty) {
        final List<Account> accounts = (response.data as List)
            .map((accountData) => Account.fromMap(accountData))
            .toList();

        // Use accountIndex if it's not null and within range, otherwise default to 0
        final int? index =
            event.Numaber != null && event.Numaber! < accounts.length
                ? event.Numaber
                : 0;

        emit(GetUserSuccessState(
            accounts[index!])); // Emit success state with the specified account
      } else {
        emit(AccountErrorState('No account found'));
      }
    } catch (error) {
      emit(AccountErrorState(error.toString()));
      print(error);
    }
  }

  Future<void> _onFetchAccountsID(
      FetchAccountId event, Emitter<AccountBlocState> emit) async {
    emit(AccountLoadingState());
    try {
      final response = await supabaseClient
          .from('account')
          .select()
          .eq('user_id',
              getCurrentUserId) // Make sure this gets the current user ID
          .execute();

      if (response.data != null && response.data.isNotEmpty) {
        final List<Account> accounts = (response.data as List)
            .map((accountData) => Account.fromMap(accountData))
            .toList();

        emit(GetUsersSuccessState(accounts));
      } else {
        emit(AccountErrorState('No account found'));
      }
    } catch (error) {
      emit(AccountErrorState(error.toString()));
      print(error);
    }
  }

  Future<void> _onCreateAccount(
      CreateAccountEvent event, Emitter<AccountBlocState> emit) async {
    emit(AccountLoadingState());
    try {
      await supabaseClient.from('account').insert(event.account.toMap());

      emit(AccountCreatedState());
    } catch (error) {
      emit(AccountErrorState(error.toString()));
    }
  }
}
