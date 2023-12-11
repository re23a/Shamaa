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
      FetchAccount event, Emitter<AccountBlocState> emit) async {
    emit(AccountLoadingState());
    try {
      final response = await supabaseClient
          .from('account')
          .select()
          .eq('user_id', getCurrentUserId)
          .single()
          .execute();
      if (response.data != null) {
        final Account accounts = Account.fromMap(response.data);
        emit(GetUserSuccessState(accounts));
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
