


enum ViewState {
  idle, // 
  busy, // 加载中
  empty, // 无数据
  error,  // 加载失败
}

enum ViewStateErrorType {
  defaultError,
  networkTimeOutError,  // 网络超时
  unauthorizedError, // 未授权
}

class ViewStateError {
  ViewStateErrorType _errorType;
  String message;
  String errorMessage;

  ViewStateError(this._errorType, {this.message, this.errorMessage}) {
    _errorType ??= ViewStateErrorType.defaultError;
    message ??= errorMessage; // dart 空值赋值
  }

  // dart get方法缩略写法
  ViewStateErrorType get errorType => _errorType;
  get isDefaultError => _errorType == ViewStateErrorType.defaultError;
  get isNetworkTimeOut => _errorType == ViewStateErrorType.networkTimeOutError;
  get isUnauthorized => _errorType == ViewStateErrorType.unauthorizedError;

  @override
  String toString() {
    return 'ViewStateError{errorType: $_errorType, message: $message, errorMessage: $errorMessage}';
}
}