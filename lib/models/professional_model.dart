import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mktp_service/datas/profissionais.dart';

class ProfessionalModel extends ChangeNotifier{


  ProfessionalModel(){
    _loadAllProfessional();
    _loadEnfermagemProfessional();
    _loadEsteticaProfessional();
    _loadFisioterapiaProfessional();
    _loadMedicinaProfessional();
    _loadNutricaoProfessional();
    _loadOdontologiaProfessional();
    _loadTrainerProfessional();
    _loadProfessorProfessional();
    _loadArquiteturaProfessional();
    _loadAssistenciaProfessional();
    _loadAdvocaciaProfessional();
    _loadAlimentacaoProfessional();
    _loadDigitalProfessional();
    _loadDiaristaProfessional();
    _loadPetProfessional();
    _loadFotoProfessional();
    _loadDesignerProfessional();
    _loadMarciaisProfessional();
    _loadBarbeariaProfessional();
    _loadCosturaProfessional();
    _loadEncanadorProfessional();
    _loadEngenhariaProfessional();
    _loadEletricistaProfessional();
    _loadFestaProfessional();
    _loadHotelariaProfessional();
    _loadJardinagemProfessional();
    _loadMarcenariaProfessional();
    _loadLimpezaProfessional();
    _loadTIProfessional();
  }

  final Firestore firestore = Firestore.instance;

  List<ProfessionalData> allPersons = [];
  List<ProfessionalData> enfermagemPersons = [];
  List<ProfessionalData> esteticaPersons = [];
  List<ProfessionalData> fisioterapiaPersons = [];
  List<ProfessionalData> medicinaPersons = [];
  List<ProfessionalData> nutricaoPersons = [];
  List<ProfessionalData> odontologiaPersons = [];
  List<ProfessionalData> trainerPersons = [];
  List<ProfessionalData> professorPersons = [];
  List<ProfessionalData> arquiteturaPersons = [];
  List<ProfessionalData> advocaciaPersons = [];
  List<ProfessionalData> assistenciaPersons = [];
  List<ProfessionalData> alimentacaoPersons = [];
  List<ProfessionalData> digitalPersons = [];
  List<ProfessionalData> diaristaPersons = [];
  List<ProfessionalData> petPersons = [];
  List<ProfessionalData> fotoPersons = [];
  List<ProfessionalData> designerPersons = [];
  List<ProfessionalData> marciaisPersons = [];
  List<ProfessionalData> barbeariaPersons = [];
  List<ProfessionalData> costuraPersons = [];
  List<ProfessionalData> encanadorPersons = [];
  List<ProfessionalData> engenhariaPersons = [];
  List<ProfessionalData> eletricistaPersons = [];
  List<ProfessionalData> festaPersons = [];
  List<ProfessionalData> hotelariaPersons = [];
  List<ProfessionalData> jardinagemPersons = [];
  List<ProfessionalData> marcenariaPersons = [];
  List<ProfessionalData> limpezaPersons = [];
  List<ProfessionalData> tiPersons = [];

  String _search = '';

  String get search => _search;

  set search(String value){
    _search = value;
    notifyListeners();
  }

  List<ProfessionalData> get filteredPersons{
    final List<ProfessionalData> filteredPersons = [];

    if(search.isEmpty){
      filteredPersons.addAll(allPersons);
    }else{
      filteredPersons.addAll(allPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredPersons;
  }

  List<ProfessionalData> get filteredEnfermagemPersons{
    final List<ProfessionalData> filteredEnfermagemPersons = [];

    if(search.isEmpty){
      filteredEnfermagemPersons.addAll(enfermagemPersons);
    }else{
      filteredEnfermagemPersons.addAll(enfermagemPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredEnfermagemPersons;
  }

  List<ProfessionalData> get filteredEsteticaPersons{
    final List<ProfessionalData> filteredEsteticaPersons = [];

    if(search.isEmpty){
      filteredEsteticaPersons.addAll(esteticaPersons);
    }else{
      filteredEsteticaPersons.addAll(esteticaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredEsteticaPersons;
  }

  List<ProfessionalData> get filteredFisioterapiaPersons{
    final List<ProfessionalData> filteredFisioterapiaPersons = [];

    if(search.isEmpty){
      filteredFisioterapiaPersons.addAll(fisioterapiaPersons);
    }else{
      filteredFisioterapiaPersons.addAll(fisioterapiaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredFisioterapiaPersons;
  }

  List<ProfessionalData> get filteredMedicinaPersons{
    final List<ProfessionalData> filteredMedicinaPersons = [];

    if(search.isEmpty){
      filteredMedicinaPersons.addAll(medicinaPersons);
    }else{
      filteredMedicinaPersons.addAll(medicinaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredMedicinaPersons;
  }

  List<ProfessionalData> get filteredNutricaoPersons{
    final List<ProfessionalData> filteredNutricaoPersons = [];

    if(search.isEmpty){
      filteredNutricaoPersons.addAll(nutricaoPersons);
    }else{
      filteredNutricaoPersons.addAll(nutricaoPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
        || p.specialty.toLowerCase().contains(search.toLowerCase())
      ));
    }
    return filteredNutricaoPersons;
  }

  List<ProfessionalData> get filteredOdontologiaPersons{
    final List<ProfessionalData> filteredOdontologiaPersons = [];

    if(search.isEmpty){
      filteredOdontologiaPersons.addAll(odontologiaPersons);
    }else{
      filteredOdontologiaPersons.addAll(odontologiaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredOdontologiaPersons;
  }

  List<ProfessionalData> get filteredTrainerPersons{
    final List<ProfessionalData> filteredTrainerPersons = [];

    if(search.isEmpty){
      filteredTrainerPersons.addAll(trainerPersons);
    }else{
      filteredTrainerPersons.addAll(trainerPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredTrainerPersons;
  }

  List<ProfessionalData> get filteredProfessorPersons{
    final List<ProfessionalData> filteredProfessorPersons = [];

    if(search.isEmpty){
      filteredProfessorPersons.addAll(professorPersons);
    }else{
      filteredProfessorPersons.addAll(professorPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredProfessorPersons;
  }

  List<ProfessionalData> get filteredArquiteturaPersons{
    final List<ProfessionalData> filteredArquiteturaPersons = [];

    if(search.isEmpty){
      filteredArquiteturaPersons.addAll(arquiteturaPersons);
    }else{
      filteredArquiteturaPersons.addAll(arquiteturaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredArquiteturaPersons;
  }

  List<ProfessionalData> get filteredAdvocaciaPersons{
    final List<ProfessionalData> filteredAdvocaciaPersons = [];

    if(search.isEmpty){
      filteredAdvocaciaPersons.addAll(advocaciaPersons);
    }else{
      filteredAdvocaciaPersons.addAll(advocaciaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredAdvocaciaPersons;
  }

  List<ProfessionalData> get filteredAssistenciaPersons{
    final List<ProfessionalData> filteredAssistenciaPersons = [];

    if(search.isEmpty){
      filteredAssistenciaPersons.addAll(assistenciaPersons);
    }else{
      filteredAssistenciaPersons.addAll(assistenciaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredAssistenciaPersons;
  }

  List<ProfessionalData> get filteredDigitalPersons{
    final List<ProfessionalData> filteredDigitalPersons = [];

    if(search.isEmpty){
      filteredDigitalPersons.addAll(digitalPersons);
    }else{
      filteredDigitalPersons.addAll(digitalPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredDigitalPersons;
  }

  List<ProfessionalData> get filteredDiaristalPersons{
    final List<ProfessionalData> filteredDiaristalPersons = [];

    if(search.isEmpty){
      filteredDiaristalPersons.addAll(diaristaPersons);
    }else{
      filteredDiaristalPersons.addAll(diaristaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredDiaristalPersons;
  }

  List<ProfessionalData> get filteredPetPersons{
    final List<ProfessionalData> filteredPetPersons = [];

    if(search.isEmpty){
      filteredPetPersons.addAll(petPersons);
    }else{
      filteredPetPersons.addAll(petPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredPetPersons;
  }

  List<ProfessionalData> get filteredFotoPersons{
    final List<ProfessionalData> filteredFotoPersons = [];

    if(search.isEmpty){
      filteredFotoPersons.addAll(fotoPersons);
    }else{
      filteredFotoPersons.addAll(fotoPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredFotoPersons;
  }

  List<ProfessionalData> get filteredDesignerPersons{
    final List<ProfessionalData> filteredDesignerPersons = [];

    if(search.isEmpty){
      filteredDesignerPersons.addAll(designerPersons);
    }else{
      filteredDesignerPersons.addAll(designerPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredDesignerPersons;
  }

  List<ProfessionalData> get filteredAlimentacaoPersons{
    final List<ProfessionalData> filteredAlimentacaoPersons = [];

    if(search.isEmpty){
      filteredAlimentacaoPersons.addAll(alimentacaoPersons);
    }else{
      filteredAlimentacaoPersons.addAll(alimentacaoPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredAlimentacaoPersons;
  }

  List<ProfessionalData> get filteredMarciaisPersons{
    final List<ProfessionalData> filteredMarciaisPersons = [];

    if(search.isEmpty){
      filteredMarciaisPersons.addAll(marciaisPersons);
    }else{
      filteredMarciaisPersons.addAll(marciaisPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredMarciaisPersons;
  }

  List<ProfessionalData> get filteredBarbeariaPersons{
    final List<ProfessionalData> filteredBarbeariaPersons = [];

    if(search.isEmpty){
      filteredBarbeariaPersons.addAll(barbeariaPersons);
    }else{
      filteredBarbeariaPersons.addAll(barbeariaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredBarbeariaPersons;
  }

  List<ProfessionalData> get filteredCosturaPersons{
    final List<ProfessionalData> filteredCosturaPersons = [];

    if(search.isEmpty){
      filteredCosturaPersons.addAll(costuraPersons);
    }else{
      filteredCosturaPersons.addAll(costuraPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredCosturaPersons;
  }

  List<ProfessionalData> get filteredEncanadorPersons{
    final List<ProfessionalData> filteredEncanadorPersons = [];

    if(search.isEmpty){
      filteredEncanadorPersons.addAll(encanadorPersons);
    }else{
      filteredEncanadorPersons.addAll(encanadorPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredEncanadorPersons;
  }

  List<ProfessionalData> get filteredEngenhariaPersons{
    final List<ProfessionalData> filteredEngenhariaPersons = [];

    if(search.isEmpty){
      filteredEngenhariaPersons.addAll(engenhariaPersons);
    }else{
      filteredEngenhariaPersons.addAll(engenhariaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredEngenhariaPersons;
  }

  List<ProfessionalData> get filteredEletricistaPersons{
    final List<ProfessionalData> filteredEletricistaPersons = [];

    if(search.isEmpty){
      filteredEletricistaPersons.addAll(eletricistaPersons);
    }else{
      filteredEletricistaPersons.addAll(eletricistaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredEletricistaPersons;
  }

  List<ProfessionalData> get filteredFestaPersons{
    final List<ProfessionalData> filteredFestaPersons = [];

    if(search.isEmpty){
      filteredFestaPersons.addAll(festaPersons);
    }else{
      filteredFestaPersons.addAll(festaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredFestaPersons;
  }

  List<ProfessionalData> get filteredHotelariaPersons{
    final List<ProfessionalData> filteredHotelariaPersons = [];

    if(search.isEmpty){
      filteredHotelariaPersons.addAll(hotelariaPersons);
    }else{
      filteredHotelariaPersons.addAll(hotelariaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredHotelariaPersons;
  }

  List<ProfessionalData> get filteredJardinagemPersons{
    final List<ProfessionalData> filteredJardinagemPersons = [];

    if(search.isEmpty){
      filteredJardinagemPersons.addAll(jardinagemPersons);
    }else{
      filteredJardinagemPersons.addAll(jardinagemPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredJardinagemPersons;
  }

  List<ProfessionalData> get filteredMarcenariaPersons{
    final List<ProfessionalData> filteredMarcenariaPersons = [];

    if(search.isEmpty){
      filteredMarcenariaPersons.addAll(marcenariaPersons);
    }else{
      filteredMarcenariaPersons.addAll(marcenariaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredMarcenariaPersons;
  }

  List<ProfessionalData> get filteredLimpezaPersons{
    final List<ProfessionalData> filteredLimpezaPersons = [];

    if(search.isEmpty){
      filteredLimpezaPersons.addAll(limpezaPersons);
    }else{
      filteredLimpezaPersons.addAll(limpezaPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredLimpezaPersons;
  }

  List<ProfessionalData> get filteredTIPersons{
    final List<ProfessionalData> filteredTIPersons = [];

    if(search.isEmpty){
      filteredTIPersons.addAll(tiPersons);
    }else{
      filteredTIPersons.addAll(tiPersons.where((p)
      => p.name.toLowerCase().contains(search.toLowerCase())
          || p.specialty.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredTIPersons;
  }

  Future<void> _loadAllProfessional() async{
    final QuerySnapshot snapProfessional =
      await firestore.collection("persons").getDocuments();

    allPersons = snapProfessional.documents.map((d)
      => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadEnfermagemProfessional() async{
    final QuerySnapshot snapEnfermagemProfessional = await firestore.collection("careers").document("enfermagem").collection("professional").orderBy("name").getDocuments();

    enfermagemPersons = snapEnfermagemProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }


  Future<void> _loadEsteticaProfessional() async{
    final QuerySnapshot snapEsteticaProfessional = await firestore.collection("careers").document("estetica").collection("professional").orderBy("name").getDocuments();

    esteticaPersons = snapEsteticaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadFisioterapiaProfessional() async{
    final QuerySnapshot snapFisioterapiaProfessional = await firestore.collection("careers").document("fisioterapia").collection("professional").orderBy("name").getDocuments();

    fisioterapiaPersons = snapFisioterapiaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadMedicinaProfessional() async{
    final QuerySnapshot snapMedicinaProfessional = await firestore.collection("careers").document("medicina").collection("professional").orderBy("name").getDocuments();

    medicinaPersons = snapMedicinaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadNutricaoProfessional() async{
    final QuerySnapshot snapNutricaoProfessional = await firestore.collection("careers").document("nutricao").collection("professional").orderBy("name").getDocuments();

    nutricaoPersons = snapNutricaoProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadOdontologiaProfessional() async{
    final QuerySnapshot snapOdontologiaProfessional = await firestore.collection("careers").document("odontologia").collection("professional").orderBy("name").getDocuments();

    odontologiaPersons = snapOdontologiaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadTrainerProfessional() async{
    final QuerySnapshot snapTrainerProfessional = await firestore.collection("careers").document("trainer").collection("professional").orderBy("name").getDocuments();

    trainerPersons = snapTrainerProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadProfessorProfessional() async{
    final QuerySnapshot snapProfessorProfessional = await firestore.collection("careers").document("professor").collection("professional").orderBy("name").getDocuments();

    professorPersons = snapProfessorProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadArquiteturaProfessional() async{
    final QuerySnapshot snapArquiteturaProfessional = await firestore.collection("careers").document("arquitetura").collection("professional").orderBy("name").getDocuments();

    arquiteturaPersons = snapArquiteturaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadAdvocaciaProfessional() async{
    final QuerySnapshot snapAdvocaciaProfessional = await firestore.collection("careers").document("advocacia").collection("professional").orderBy("name").getDocuments();

    advocaciaPersons = snapAdvocaciaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadAssistenciaProfessional() async{
    final QuerySnapshot snapAssistenciaProfessional = await firestore.collection("careers").document("assistencia").collection("professional").orderBy("name").getDocuments();

    assistenciaPersons = snapAssistenciaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadDigitalProfessional() async{
    final QuerySnapshot snapDigitalProfessional = await firestore.collection("careers").document("digital").collection("professional").orderBy("name").getDocuments();

    digitalPersons = snapDigitalProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadDiaristaProfessional() async{
    final QuerySnapshot snapDiaristaProfessional = await firestore.collection("careers").document("diarista").collection("professional").orderBy("name").getDocuments();

    diaristaPersons = snapDiaristaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadPetProfessional() async{
    final QuerySnapshot snapPetProfessional = await firestore.collection("careers").document("pet").collection("professional").orderBy("name").getDocuments();

    petPersons = snapPetProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadFotoProfessional() async{
    final QuerySnapshot snapFotoProfessional = await firestore.collection("careers").document("foto").collection("professional").orderBy("name").getDocuments();

    fotoPersons = snapFotoProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadDesignerProfessional() async{
    final QuerySnapshot snapDesignerProfessional = await firestore.collection("careers").document("designer").collection("professional").orderBy("name").getDocuments();

    designerPersons = snapDesignerProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadAlimentacaoProfessional() async{
    final QuerySnapshot snapAlimentacaoProfessional = await firestore.collection("careers").document("alimentacao").collection("professional").orderBy("name").getDocuments();

    alimentacaoPersons = snapAlimentacaoProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadMarciaisProfessional() async{
    final QuerySnapshot snapMarciaisProfessional = await firestore.collection("careers").document("marciais").collection("professional").orderBy("name").getDocuments();

    marciaisPersons = snapMarciaisProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadBarbeariaProfessional() async{
    final QuerySnapshot snapBarbeariaProfessional = await firestore.collection("careers").document("barbearia").collection("professional").orderBy("name").getDocuments();

    barbeariaPersons = snapBarbeariaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadCosturaProfessional() async{
    final QuerySnapshot snapCosturaProfessional = await firestore.collection("careers").document("costura").collection("professional").orderBy("name").getDocuments();

    costuraPersons = snapCosturaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadEncanadorProfessional() async{
    final QuerySnapshot snapEncanadorProfessional = await firestore.collection("careers").document("encanador").collection("professional").orderBy("name").getDocuments();

    encanadorPersons = snapEncanadorProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadEngenhariaProfessional() async{
    final QuerySnapshot snapEngenhariaProfessional = await firestore.collection("careers").document("engenharia").collection("professional").orderBy("name").getDocuments();

    engenhariaPersons = snapEngenhariaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadEletricistaProfessional() async{
    final QuerySnapshot snapEletricistaProfessional = await firestore.collection("careers").document("eletricista").collection("professional").orderBy("name").getDocuments();

    eletricistaPersons = snapEletricistaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadFestaProfessional() async{
    final QuerySnapshot snapFestaProfessional = await firestore.collection("careers").document("festa").collection("professional").orderBy("name").getDocuments();

    festaPersons = snapFestaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadHotelariaProfessional() async{
    final QuerySnapshot snapHotelariaProfessional = await firestore.collection("careers").document("hotelaria").collection("professional").orderBy("name").getDocuments();

    hotelariaPersons = snapHotelariaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadJardinagemProfessional() async{
    final QuerySnapshot snapJardinagemProfessional = await firestore.collection("careers").document("jardinagem").collection("professional").orderBy("name").getDocuments();

    jardinagemPersons = snapJardinagemProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadMarcenariaProfessional() async{
    final QuerySnapshot snapMarcenariaProfessional = await firestore.collection("careers").document("marcenaria").collection("professional").orderBy("name").getDocuments();

    marcenariaPersons = snapMarcenariaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadLimpezaProfessional() async{
    final QuerySnapshot snapLimpezaProfessional = await firestore.collection("careers").document("limpeza").collection("professional").orderBy("name").getDocuments();

    limpezaPersons = snapLimpezaProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  Future<void> _loadTIProfessional() async{
    final QuerySnapshot snapTIProfessional = await firestore.collection("careers").document("ti").collection("professional").orderBy("name").getDocuments();

    tiPersons = snapTIProfessional.documents.map((d)
    => ProfessionalData.fromDocument(d)).toList();

    notifyListeners();
  }

  ProfessionalData findPersonById(String id, String category){
    try{
        if(category == 'enfermagem'){
          return enfermagemPersons.firstWhere((p) => p.id == id);
        }else if(category == 'estetica'){
          return esteticaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'fisioterapia'){
          return fisioterapiaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'medicina'){
          return medicinaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'nutricao'){
          return nutricaoPersons.firstWhere((p) => p.id == id);
        }else if(category == 'odontologia'){
          return odontologiaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'trainer'){
          return trainerPersons.firstWhere((p) => p.id == id);
        }else if(category == 'professor'){
          return professorPersons.firstWhere((p) => p.id == id);
        }else if(category == 'outros'){
          return alimentacaoPersons.firstWhere((p) => p.id == id);
        }else if(category == 'arquitetura'){
          return arquiteturaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'advocacia'){
          return advocaciaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'assistencia'){
          return assistenciaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'digital'){
          return digitalPersons.firstWhere((p) => p.id == id);
        }else if(category == 'pet'){
          return petPersons.firstWhere((p) => p.id == id);
        }else if(category == 'foto'){
          return fotoPersons.firstWhere((p) => p.id == id);
        }else if(category == 'diarista'){
          return diaristaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'marciais'){
          return marciaisPersons.firstWhere((p) => p.id == id);
        }else if(category == 'barbearia'){
          return barbeariaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'costura'){
          return costuraPersons.firstWhere((p) => p.id == id);
        }else if(category == 'encanador'){
          return encanadorPersons.firstWhere((p) => p.id == id);
        }else if(category == 'eletricista'){
          return eletricistaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'festa'){
          return festaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'hotelaria'){
          return hotelariaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'jardinagem'){
          return jardinagemPersons.firstWhere((p) => p.id == id);
        }else if(category == 'marcenaria'){
          return marcenariaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'limpeza'){
          return limpezaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'engenharia'){
          return engenhariaPersons.firstWhere((p) => p.id == id);
        }else if(category == 'designer'){
          return designerPersons.firstWhere((p) => p.id == id);
        }else {
          return tiPersons.firstWhere((p) => p.id == id);
        }
    }catch(e){
      return null;
    }
  }

}
