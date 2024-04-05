import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:com.lubumi.sellers/authentication_bloc/bloc.dart';
import 'package:com.lubumi.sellers/users_repo.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{
  final UserRepo userRepo;

  AuthenticationBloc({@required UserRepo userRepo})
  : assert(UserRepo !=null),
    userRepo=userRepo;
@override
  AuthenticationState get initialState => Uninitialized();

@override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
    ) async* {
  if(event is AppStarted){
    yield* _mapAppStartedToState();
  }else if(event is LoggedIn){
    yield* _mapLoggedInToState();
  }else if(event is LoggedOut){
    yield* _mapLoggedOutToState();
  }
}
 Stream<AuthenticationState> _mapAppStartedToState() async*{
  try{
    final isSignedIn = await userRepo.isSignedIn();
    if(isSignedIn){
      final name = await userRepo.getUser();
      yield Authenticated(name);
    }else{
      yield Unauthenticated();
    }
  }catch (_){
    yield Unauthenticated();
  }
 }
 Stream<AuthenticationState> _mapLoggedInToState() async*{
  yield Authenticated(await userRepo.getUser());
 }
 Stream<AuthenticationState> _mapLoggedOutToState() async*{
  yield Unauthenticated();
  userRepo.signOut();
 }

}