import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthRepo{
  Future<Either<Exception,UserCredential>> loginWithGoogle();
  Future<Either<Exception,UserCredential>> loginWithFaceboo();
  Future completeInformation({@required String name,@required String phoneNumber , @required String address});
}