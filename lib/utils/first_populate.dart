import 'package:projeto/providers/factor_provider.dart';
import 'package:projeto/providers/indicator_provider.dart';
import 'package:projeto/providers/score_provider.dart';

import '../models/factor_model.dart';
import '../models/indicator_model.dart';
import '../models/score_model.dart';

class FirstPopulate {
  //Preciso pegar o id do projeto para criar o fkIdProject
  // ScoreModel scoreData =
  //     ScoreModel(id: '3321', fkIdProject: '321', name: '321');
  // FactorModel factorModel;
  // IndicatorModel;
  Future init(
      {ScoreModel? scoreModel,
      FactorModel? factorModel,
      IndicatorModel? indicatorModel}) async {
    if (scoreModel != null) {
      return await ScoreProvider().addOne('scores', scoreModel.toJson());
    }
    if (factorModel != null) {
      return await FactorProvider().addOne('factors', factorModel.toJson());
    }
    if (indicatorModel != null) {
      return await IndicatorProvider()
          .addOne('indicators', indicatorModel.toJson());
    }
  }
}
