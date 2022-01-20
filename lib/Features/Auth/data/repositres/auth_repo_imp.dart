import 'package:dartz/dartz.dart';
import 'package:e_commerce_advanced/Features/Auth/domain/repositries/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl extends AuthRepo{
  @override
  Future completeInformation({String? name, String? phoneNumber, String? address}) {
    // TODO: implement completeInformation
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception,UserCredential>> loginWithFaceboo() async {
     final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return Right(await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential));
  }

  @override
  Future<Either<Exception,UserCredential>> loginWithGoogle() async {
 // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return Right(await FirebaseAuth.instance.signInWithCredential(credential));

  }

}