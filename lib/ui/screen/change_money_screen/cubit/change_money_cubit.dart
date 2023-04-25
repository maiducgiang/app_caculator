import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/data_money/money_model.dart';
import 'package:mubaha/ui/screen/change_money_screen/cubit/change_money_state.dart';
import 'package:dio/dio.dart';

class ChangeMoneyCubit extends Cubit<ChangeMoneyState> {
  ChangeMoneyCubit() : super(ChangeMoneyState.initial());

  Future<bool> fetchData() async {
    try {
      final response = await Dio().get(
          'https://marketdata.tradermade.com/api/v1/live_currencies_list?api_key=Gj2jrkZZ4QpsZcEj-HSy');
      MoneyModel model = MoneyModel.fromJson(response.data);
      emit(state.copyWith(listMoney: model));
      return true;
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
      return false;
    }
  }

  Future<String> changeMoney(
      {required String from, required String to, required double value}) async {
    try {
      final response = await Dio().get(
          'https://marketdata.tradermade.com/api/v1/live?currency=${from}${to}&api_key=Gj2jrkZZ4QpsZcEj-HSy');
      List<dynamic> quotes = response.data["quotes"] as List<dynamic>;
      double bid = (quotes[0] as Map<String, dynamic>)["bid"] as double;

      return (bid * value).toString();
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
      return "0";
    }
  }
}
