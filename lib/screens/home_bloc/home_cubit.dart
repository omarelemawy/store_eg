import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:store_eg/screens/home_bloc/home_state.dart';

import '../../constants/utils.dart';
import '../../model/collection_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int? selected=1;
  int page = 1;
  int? totalPages;
  List<Item>? listOfHomeData=[];
  final RefreshController refreshController=RefreshController(initialRefresh: true);

  void changeSelect(index){
    selected=index;
    emit(ChangeSelectedHomeState());
  }

  Future<List<Item>?> fetchData(int page) async {

      var response = await Dio().get(
          Utils.HOMESections_URL+"$page",options:
      Options()
      );
      totalPages = CollectionModel.fromJson(response.data).data!.total;
      return CollectionModel.fromJson(response.data).data!.data;
  }
  void getHomeData() {
    if (state is DataLoading) return;

    final currentState = state;

    var oldData = <Item>[];
    if (currentState is DataLoaded) {
      oldData = currentState.items;
    }

    emit(DataLoading(oldData, isFirstFetch: page == 1));

      fetchData(page).then((newData) {
      if(page <totalPages!) {
        page++;
        final data = (state as DataLoading).oldData;

        data.addAll(newData!);
        emit(DataLoaded(data));
      }
      });
  }
  /*Future<List<Item>?> getHomeData({isRefresh=false})async{

    emit(GetLoadingHomeState());
    var response = await Dio().get(
        Utils.HOMESections_URL+"$currentPage",options:
    Options()
    );
    if(response.data["status"]==true)
    {
      currentPage++;
      totalPages=response.data["data"]["total"];
      if(isRefresh){
        currentPage=1;
      }
      else{
        if(currentPage>=totalPages){
          refreshController.loadNoData();
        }

      }
      emit(GetSuccessHomeState());
      return CollectionModel.fromJson(response.data).data!.data;
    }else{
      emit(GetErrorHomeState(response.data["message"]));
    }
  }
  void getMyHomeData({isRefresh=false}){
    getHomeData(isRefresh:isRefresh).then((value) {
      listOfHomeData=value!;
    });

  }*/
}
