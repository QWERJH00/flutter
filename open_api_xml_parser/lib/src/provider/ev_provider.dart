import 'package:flutter/material.dart';
import 'package:open_api_xml_parser/src/model/ev.dart';
import 'package:open_api_xml_parser/src/repository/ev_repository.dart';

class EvProvider extends ChangeNotifier {
  // EvRepository를 접근(데이터를 받아와야 하기 때문)
  final EvRepository _evrepository = EvRepository();

  List<Ev> _evs = [];
  List<Ev> get evs => _evs;

  // 데이터 로드
  loadEvs() async {
    // EvRepository 접근해서 데이터를 로드
    // listEvs에 _evs를 바로 작성해도 되지만 예외 처리와 추가적인
    // 가공을 위해 나눠서 작성한다.
    List<Ev>? listEvs = await _evrepository.loadEvs();
    _evs = listEvs!;
    notifyListeners();
  }
}