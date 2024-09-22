class Resource {
  final dynamic data;
  final bool? status;
  String? message = "";

  Resource({this.data, this.status, this.message});

  Resource copyWith({dynamic data, bool? status, String? message}) {
    Resource resource = Resource(data: data, status: status, message: message);

    return resource;
  }

  @override
  int get hashCode => data.hashCode ^ status.hashCode ^ message.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Resource &&
              runtimeType == other.runtimeType &&
              data == other.data &&
              status == other.status &&
              message == other.message;

  @override
  String toString() {
    return 'Resource{data: $data, status: $status, message: $message}';
  }
}