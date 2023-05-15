

//TODO Create AppExceptions Class
class AppExceptions implements Exception {
   final _message;
   final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }

  
}




//TODO Create InternetException Class
class InternetException extends AppExceptions{
   InternetException([String? message]) : super(message,'No internet');
}



//TODO Create RequestTimeOutException Class
class RequestTimeOutException extends AppExceptions{
   RequestTimeOutException([String? message]) : super(message,'Request time out');
}



//TODO Create ServerException Class
class ServerException extends AppExceptions{
   ServerException([String? message]) : super(message,'Internal server error');
}



//TODO Create InvalidUrlException Class
class InvalidUrlException extends AppExceptions{
   InvalidUrlException([String? message]) : super(message,'Invalid Url');
}


//TODO Create FetchDataException Class
class FetchDataException extends AppExceptions{
   FetchDataException([String? message]) : super(message,'');
}