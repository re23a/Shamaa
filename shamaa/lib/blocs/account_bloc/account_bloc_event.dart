part of 'account_bloc_bloc.dart';

@immutable
@immutable
abstract class AccountBlocEvent {}

class FetchAccounts extends AccountBlocEvent {}

class FetchAccount extends AccountBlocEvent {
  final int? Numaber;

  FetchAccount({this.Numaber});
}

class FetchAccountId extends AccountBlocEvent {}

class CreateAccountEvent extends AccountBlocEvent {
  final Account account;
  CreateAccountEvent({required this.account});
}

class UpdateAccountEvent extends AccountBlocEvent {
  final Account account;

  UpdateAccountEvent({required this.account});
}
