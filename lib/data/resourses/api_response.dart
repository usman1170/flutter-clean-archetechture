import 'package:mvvm/data/resourses/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? massage;
  ApiResponse(
    this.status,
    this.data,
    this.massage,
  );
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.error() : status = Status.ERROR;
  ApiResponse.complete() : status = Status.COMPLETE;

  @override
  String toString() {
    return "Status : $status\nMassgae : $massage\nData : $data";
  }
}
