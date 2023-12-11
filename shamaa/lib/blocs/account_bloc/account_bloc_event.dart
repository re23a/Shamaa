part of 'account_bloc_bloc.dart';

@immutable
abstract class AccountBlocEvent {}

class FetchAccounts extends AccountBlocEvent {}

class FetchAccount extends AccountBlocEvent {}

class CreateAccountEvent extends AccountBlocEvent {
  final Account account;
  CreateAccountEvent({required this.account});
}
