import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mktp_service/datas/profissionais.dart';
import 'package:mktp_service/models/professional_model.dart';
import 'package:mktp_service/screens/search_dialog.dart';
import 'package:mktp_service/tiles/professional_tile.dart';
import 'package:provider/provider.dart';


class ProfessionalScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const ProfessionalScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          //floatingActionButton: FavoriteButton(),
          appBar: AppBar(
            title: Consumer<ProfessionalModel>(
              builder: (_, professionalModel, __){
                if(professionalModel.search.isEmpty){
                  return Text(snapshot.data["title"]);
                }else{
                 return LayoutBuilder(
                   builder: (_, constraints){
                     return GestureDetector(
                       onTap: ()async {
                         final search = await showDialog<String>(
                             context: context,
                             builder: (_) => SearchDialog(
                               professionalModel.search
                             ));
                         if (search != null) {
                           professionalModel.search = search;
                         }
                       },
                       child: Container(
                         width: constraints.biggest.width,
                         child: Text(
                           professionalModel.search,
                           textAlign: TextAlign.center,
                         ),
                       ),
                     );
                   },
                 );
                }
              },
            ),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.list)),
              ],
            ),
            actions: [
              Consumer<ProfessionalModel>(
                builder: (_, professionalModel, __){
                  if(professionalModel.search.isEmpty){
                    return IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async{
                          final search = await showDialog<String>(context: context,
                              builder: (_) => SearchDialog(professionalModel.search));
                          if(search != null){
                            //context.read<ProfessionalModel>().search = search;
                            professionalModel.search = search;
                          }
                        }
                    );
                  }else {
                    return IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () async{
                          professionalModel.search = '';

                        }
                    );
                  }
                },
              )
            ],
          ),
          body: Consumer<ProfessionalModel>(
            builder: (_, professionalModel, __){
              switch(snapshot.documentID){
                case "enfermagem":{
                  final filteredPersons = professionalModel.filteredEnfermagemPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;
                case "estetica":{
                  final filteredPersons = professionalModel.filteredEsteticaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;
                case "fisioterapia":{
                  final filteredPersons = professionalModel.filteredFisioterapiaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;
                case "medicina":{
                  final filteredPersons = professionalModel.filteredMedicinaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;
                case "nutricao":{
                  final filteredPersons = professionalModel.filteredNutricaoPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;
                case "odontologia":{
                  final filteredPersons = professionalModel.filteredOdontologiaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "professor":{
                  final filteredPersons = professionalModel.filteredProfessorPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "trainer":{
                  final filteredPersons = professionalModel.filteredTrainerPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "arquitetura":{
                  final filteredPersons = professionalModel.filteredArquiteturaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "advocacia":{
                  final filteredPersons = professionalModel.filteredAdvocaciaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "assistencia":{
                  final filteredPersons = professionalModel.filteredAssistenciaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "digital":{
                  final filteredPersons = professionalModel.filteredDigitalPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "diarista":{
                  final filteredPersons = professionalModel.filteredDiaristalPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "pet":{
                  final filteredPersons = professionalModel.filteredPetPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "foto":{
                  final filteredPersons = professionalModel.filteredFotoPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "designer":{
                  final filteredPersons = professionalModel.filteredDesignerPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "marciais":{
                  final filteredPersons = professionalModel.filteredMarciaisPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "barbearia":{
                  final filteredPersons = professionalModel.filteredBarbeariaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "costura":{
                  final filteredPersons = professionalModel.filteredCosturaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "encanador":{
                  final filteredPersons = professionalModel.filteredEncanadorPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "engenharia":{
                  final filteredPersons = professionalModel.filteredEngenhariaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "eletricista":{
                  final filteredPersons = professionalModel.filteredEletricistaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "festa":{
                  final filteredPersons = professionalModel.filteredFestaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "hotelaria":{
                  final filteredPersons = professionalModel.filteredHotelariaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "jardinagem":{
                  final filteredPersons = professionalModel.filteredJardinagemPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "marcenaria":{
                  final filteredPersons = professionalModel.filteredMarcenariaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "limpeza":{
                  final filteredPersons = professionalModel.filteredLimpezaPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                case "ti":{
                  final filteredPersons = professionalModel.filteredTIPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;

                default: {
                  final filteredPersons = professionalModel.filteredAlimentacaoPersons;
                  return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        GridView.builder(
                            padding: EdgeInsets.all(4.0),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                childAspectRatio: 0.65),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("grid", data);
                            }),
                        ListView.builder(
                            padding: EdgeInsets.all(4.0),
                            itemCount: filteredPersons.length,
                            itemBuilder: (context, index) {
                              ProfessionalData data =
                              filteredPersons[index];
                              data.category = this.snapshot.documentID;
                              return ProfessionalTile("list", data);
                            }),
                      ]);
                }break;
              }
            },
          )

      ),
    );
  }
}
