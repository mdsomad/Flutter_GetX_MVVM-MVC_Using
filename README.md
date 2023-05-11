# flutter_getx_mvvm_mvc

A new Flutter project.
- 1: Handle App APIs Exceptiions


```sh
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

```
