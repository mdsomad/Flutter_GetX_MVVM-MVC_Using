# flutter_getx_mvvm_mvc

A new Flutter project.
- 1: Handle APIs Response

- 1: Cteate enum
```sh
enum Status{LOADING,COMPLETED,ERROR}
```



- 2: Create generic class
```sh
import 'package:flutter_getx_mvvm_mvc/data/response/status.dart';


//TODO Create generic class
class ApiResponse<T> {
  Status? status;
  T? data;          // <-- dynamic data provided
  String? message;

  ApiResponse(this.status,this.data,this.message);



  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;
  

  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data : $data";
  }
  
  
  
}

```