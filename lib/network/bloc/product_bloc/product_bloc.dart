import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/app/constants/event_type.dart';
import 'package:quran_app/app/util/page_info.dart';
import 'package:quran_app/model/Product/product_response.dart';
import 'package:quran_app/model/common/resource.dart';
import 'package:quran_app/network/domain/usecases/product_usecases.dart';
import 'package:quran_app/network/injector/injector.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>(_init);
  }
  void _init(ProductEvent event, Emitter<ProductState> emit) async {
    if (event is GetProductListEvent) {
      Map<String, dynamic> queryParams = Map();
      queryParams["page"] = event.page;
      queryParams["limit"] = 10;
      queryParams["isFeatured"] = event.isFeatured;

      print("queryParams");
      print(queryParams);

      Resource response =
          await Injector.resolve<ProductUseCase>().getProductList(queryParams);

      int pageNo = event.page;
      bool showLoad = true;

      if (response.status == false) {
        showLoad = false;
        pageNo = pageNo - 1;
      }
      if (response.status!) {
        List<Products> productList = response.data.map<Products>((e) => Products.fromJson(e)).toList();
        int listCount = event.list!.length + productList.length;
        event.list!.addAll(productList);
        emit(ProductLoaded(
            data: event.list,
            paginateInfo: PaginateInfo(page: pageNo, count: listCount, showLoad: showLoad)));
      } else {
        emit(ErrorState(message: "response.errormessage"));
      }
    }
  }
}
