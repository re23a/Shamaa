part of 'account_bloc_bloc.dart';

@immutable
abstract class AccountBlocState {}

class AccountBlocInitial extends AccountBlocState {}

class GetUsersSuccessState extends AccountBlocState {
  final List<Account> accounts;
  GetUsersSuccessState(this.accounts);
}

class GetUserSuccessState extends AccountBlocState {
  final Account account;

  GetUserSuccessState(this.account);
}

class AccountLoadingState extends AccountBlocState {}

class AccountErrorState extends AccountBlocState {
  final String message;
  AccountErrorState(this.message);
}

class AccountCreatedState extends AccountBlocState {}
