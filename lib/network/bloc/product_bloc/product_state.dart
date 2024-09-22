part of 'product_bloc.dart';

@immutable
abstract class ProductState {
  List<Products>? productList;
  BlocEventState eventState;
  String message;

  ProductState(
      {this.message = "",
        this.eventState = BlocEventState.LOADING,this.productList});
}

class ProductInitial extends ProductState {
  ProductInitial() : super(eventState: BlocEventState.LOADING);
}

class ErrorState extends ProductState {
  String message;

  ErrorState({required this.message})
      : super(eventState: BlocEventState.ERROR, message: message);
}
class ProductLoaded extends ProductState {
  final List<Products>? data;
  final PaginateInfo? paginateInfo;

  ProductLoaded({required this.data,this.paginateInfo})
      : super(productList: data, eventState: BlocEventState.LOADED);
}
