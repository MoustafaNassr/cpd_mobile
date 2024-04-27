
import 'package:apex_cpd/core/constant/assets.dart';
import 'package:apex_cpd/domain/entities/cpd/cpd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../bloc/cpd/get_cpd/get_cpd_cubit.dart';


class MyCpdSummary extends StatefulWidget {
  MyCpdSummary({Key? key, this.title}) : super(key: key);

  final String ?title;

  @override
  _MyCpdSummaryState createState() => _MyCpdSummaryState();
}

class _MyCpdSummaryState extends State<MyCpdSummary> {
 // CPDData cpdSummary;
  @override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    //  backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
       appBar: AppBar(
      backgroundColor: ResColors.primary,
      title: Text("My CPD Summary",
      style: AppTheme.lightTheme.textTheme.headlineSmall!
      .copyWith(
        fontSize: 20,
        color: ResColors.background),),),
     
      body: BlocBuilder<CpdFetchCubit, CpdFetchState>(
        builder: (context, state) {
           if(state is CpdFetchLoading){
            return  Center(child: CircularProgressIndicator(),);
           }
          if(state is CpdFetchLoading ) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               // Image.asset(kOrderDelivery),
                const  Center(child:Text("No cpd yet")),
                SizedBox(
                  height:
                  MediaQuery.of(context).size.height * 0.1,
                )
              ],
            );
          }
          if (state is CpdFetchSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.cpds.length,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: (10 + MediaQuery.of(context).padding.bottom),
                top: 10,
              ),
              itemBuilder: (context, index) => makeCard(state.cpds[index])
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 6,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: (10 + MediaQuery.of(context).padding.bottom),
                top: 10,
              ),
              itemBuilder: (context, index) =>  Container(),
            );
          }
        },
      ),
    

      //   ListView.builder(
      //   scrollDirection: Axis.vertical,
      //   shrinkWrap: true,
      //   itemCount: cpdData.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Padding(padding: EdgeInsets.all(10),
      //     child: makeCard(cpdData[index]));
      //   },
      // ),
      
    );
  }
  ListTile makeListTile(CPDData cpdData) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: ResColors.primary))),
            child: SvgPicture.asset(ResAssets.fileColored)
          ),
          title: Text(
            cpdData.title,
            style: TextStyle(color: ResColors.primary, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              // Expanded(
              //     flex: 1,
              //     child: Container(
              //       // tag: 'hero',
              //       child: LinearProgressIndicator(
              //           backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
              //           value: lesson.indicatorValue,
              //           valueColor: AlwaysStoppedAnimation(Colors.green)),
              //     )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(cpdData.date!,
                        style: TextStyle(color: ResColors.secondary))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: ResColors.secondary, size: 30.0),
          onTap: () {
          context.pushNamed("ViewCertificate");
          },
        );

    Widget makeCard( CPDData cpdData) => Container(
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: ResColors.secondary)),
            child:    makeListTile(cpdData));
          
        

}


