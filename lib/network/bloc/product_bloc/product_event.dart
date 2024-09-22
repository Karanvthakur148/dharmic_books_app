part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProductListEvent extends ProductEvent {
  int page;
  bool? isFeatured;
  List<Products>? list;

  GetProductListEvent(this.page,this.list,this.isFeatured);
}
