class SintomasModel {
  late bool _ativo = false;
  late int _id = 0;
  late String _sintoma;

  SintomasModel(
      {required bool ativo, required int id, required String sintoma}) {
    this._ativo = ativo;
    this._id = id;
    this._sintoma = sintoma;
  }

  SintomasModel.fromJson(Map<String, dynamic> json) {
    _ativo = json['ativo'];
    _id = json['id'];
    _sintoma = json['sintoma'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ativo'] = this._ativo;
    data['id'] = this._id;
    data['sintoma'] = this._sintoma;
    return data;
  }
}
