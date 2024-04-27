
import 'package:apex_cpd/core/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../bloc/cpd/get_cpd/get_cpd_cubit.dart';


class SwiperBuilder extends StatelessWidget {
  const SwiperBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> color=[ResColors.primary,ResColors.secondary,];
    List<Color> textcolor=[ResColors.grey,ResColors.primary,];
   
    return Flexible(
      child: Padding(
        padding:const EdgeInsets.only(top: 10,left: 10,right: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<CpdFetchCubit, CpdFetchState>(
        builder: (context, state) {
           if(state is CpdFetchLoading){
            return  Center(child: CircularProgressIndicator(color: Colors.black,),);
           }
          if(state.props.isEmpty ) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               // Image.asset(kOrderDelivery),
                const  Center(child:Text("No Document yet")),
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
              itemBuilder: (context, index) => Swiper(
              itemWidth: 400,
              itemHeight: 225,
              loop: true,
              duration: 1200,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  width:300,
                  height: 400,
                  decoration: BoxDecoration(
                   color: color[index],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:[
                      IconButton(icon: Icon(Icons.edit,color: textcolor[index]),
                      onPressed: (){context.pushNamed("ViewCertificate",extra:state.cpds[index]);},) ,
                      Padding(padding: EdgeInsets.only(
                        top: getProportionateScreenHeight(0),
                        right: getProportionateScreenWidth(30),
                        left:getProportionateScreenWidth(30) ),child:
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [  Column(
                     // mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                      children:[Text(state.cpds[index].date,
                  style: AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:textcolor[index]),),
                   SizedBox(height: getProportionateScreenHeight(10),),
                    Text(state.cpds[index].title,
                    style: AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:textcolor[index]),)]),
                   
        ])),

        SizedBox(height: getProportionateScreenHeight(30),),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [   Text("Date activity completed",style: AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:textcolor[index]),),
                     
                        Text("Hours logged",style: AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:textcolor[index]),),
                   ]),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [      Text(state.cpds[index].date_completed,style: AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:textcolor[index]),),
                                  Text(state.cpds[index].hours_logged.toString(),style: AppTheme.lightTheme.textTheme.headlineSmall!.copyWith(color:textcolor[index]),),
                  ])])
                );
              },
              itemCount: 2,
              layout: SwiperLayout.STACK,
            ));}else{return Container();}}
          ),
        ),
      ),
    ));
  }
}