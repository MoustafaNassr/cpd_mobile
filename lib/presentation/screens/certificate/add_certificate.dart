import 'package:animate_do/animate_do.dart';
import 'package:apex_cpd/core/constant/size_config.dart';
import 'package:apex_cpd/core/theme/app_theme.dart';
import 'package:apex_cpd/data/models/skills/skills_model.dart';
import 'package:apex_cpd/data/models/training/training_model.dart';
import 'package:apex_cpd/presentation/custom_widget/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;
import '../../../core/constant/colors.dart';
import '../../../data/models/cpd/cpd_model.dart';
import '../../../domain/usecases/cpd/add_cpd_usecase.dart';
import '../../bloc/cpd/add_cpd/add_cpd_cubit.dart';
import '../../bloc/skills/get_skills_cubit.dart';
import '../../bloc/training/get_training_cubit.dart';

class AddCertificate extends StatefulWidget {
  const AddCertificate({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddCertificateState createState() => _AddCertificateState();
}

class _AddCertificateState extends State<AddCertificate> {
   final TextEditingController _titleController = TextEditingController();
  final TextEditingController _hourLoggedController = TextEditingController();
  final TextEditingController _dateCompleteController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _whatYouLearnController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String? type;
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  SkillsModel? _selectedSkills;
TrainingFormatModel? _selectedTraining;
  @override
  void initState() {
     if (context.read<SkillsFetchCubit>().state is SkillsFetchSuccess) {
        context
            .read<SkillsFetchCubit>().getSkills();
           
      }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ResColors.primary,
          title: Text(
            "Log my CPD",
            style: AppTheme.lightTheme.textTheme.headlineSmall!
                .copyWith(fontSize: 20, color: ResColors.background),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              FadeInLeft(
                  duration: const Duration(milliseconds: 500),
                  child: TextFormField(
                    controller: _titleController,
                    style: const TextStyle(color: ResColors.primary),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ResColors.primary, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ResColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ResColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: "Activity title",
                        labelStyle:
                            AppTheme.lightTheme.textTheme.headlineSmall!),
                  )),
              SizedBox(
                height: 15,
              ),
              FadeInRight(
                  duration: const Duration(milliseconds: 550),
                  child: Text("CPD type")),
              FadeInLeft(
                  duration: const Duration(milliseconds: 600),
                  child: RadioListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text("Formal learning"),
                    value: "Formal learning",
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = value.toString();
                      });
                    },
                  )),
              FadeInLeft(
                  duration: const Duration(milliseconds: 600),
                  child: RadioListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text("Self-directed study"),
                    value: "Self-directed study",
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = value.toString();
                      });
                    },
                  )),
              FadeInLeft(
                  duration: const Duration(milliseconds: 600),
                  child: RadioListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text("Contributing to the profession"),
                    value: "Contributing to the profession",
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = value.toString();
                      });
                    },
                  )),
              SizedBox(
                height: 15,
              ),
              FadeInRight(
                  duration: const Duration(milliseconds: 650),
                  child: Text("Skills Area ")),
            BlocBuilder<SkillsFetchCubit, SkillsFetchState>(
        builder: (context, state) {
            dev.log(state.toString());
          //  if(state is SkillsFetchLoading){
          //   return  Center(child: CircularProgressIndicator(color: Colors.black,),);
          //  }
          if(state is SkillsFetchLoading ) {
               dev.log(state.toString());
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               // Image.asset(kOrderDelivery),
                const Text("no skills "),
                SizedBox(
                  height:
                  MediaQuery.of(context).size.height * 0.1,
                )
              ],
            );
          }
           if (state is SkillsFetchFail) {
            dev.log(state.toString());
            return  Center(child: Text(state.toString()),);
          
          }
          if (state is SkillsFetchSuccess) {
            dev.log('empty list ${state.toString()}');
            return  FadeInLeft(
                  duration: const Duration(milliseconds: 700),
                  child: Container(
                      height: 50,
                      child: DropdownButton<SkillsModel>(
                        hint:
                            Text('Skills Area '), // Not necessary for Option 1
                        value: _selectedSkills,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedSkills = newValue;
                            dev.log(_selectedSkills!.id.toString());
                          });
                        },
                        items: state.skills.map(( skill) {
                          return DropdownMenuItem<SkillsModel>(
                            child: new Text(skill.name),
                            value: skill,
                          );
                        }).toList(),
                      )));} else {
            return  Container();
          
          }}),
              SizedBox(
                height: 15,
              ),
              FadeInRight(
                  duration: const Duration(milliseconds: 700),
                  child: Text("Format of training ")),
               BlocBuilder<TrainMethodFetchCubit, TrainMethodFetchState>(
        builder: (context, state) {
          if(state is TrainMethodFetchLoading ) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               // Image.asset(kOrderDelivery),
                const Text("loading "),
                SizedBox(
                  height:
                  MediaQuery.of(context).size.height * 0.1,
                )
              ],
            );
          }
          if (state is TrainMethodFetchSuccess) {
            return FadeInLeft(
                  duration: const Duration(milliseconds: 750),
                  child: Container(
                      height: 50,
                      child: DropdownButton<TrainingFormatModel>(
                        hint: Text(
                            'Format of training'), // Not necessary for Option 1
                        value: _selectedTraining,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedTraining = newValue;
                          });
                        },
                        items: state.train.map((train) {
                          return DropdownMenuItem<TrainingFormatModel>(
                            child: new Text(train.name),
                            value: train,
                          );
                        }).toList(),
                      )));} else {
            return  Container();
            
          }}),
              SizedBox(
                height: 15,
              ),
              FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: TextFormField(
                    controller: _hourLoggedController,
                    style: const TextStyle(color: ResColors.primary),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ResColors.primary, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ResColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ResColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: "Hours logged ",
                        labelStyle:
                            AppTheme.lightTheme.textTheme.headlineSmall!),
                  )),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _dateCompleteController,
                style: const TextStyle(color: ResColors.primary),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ResColors.primary, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ResColors.primary, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ResColors.primary, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    labelText: "Date completed ",
                    labelStyle: AppTheme.lightTheme.textTheme.headlineSmall!),
              ),
              SizedBox(
                height: 15,
              ),
              FadeInLeft(
                  duration: const Duration(milliseconds: 850),
                  child: TextFormField(
                    controller: _costController,
                    style: const TextStyle(color: ResColors.primary),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ResColors.primary, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ResColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ResColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: "Cost of CPD ",
                        labelStyle:
                            AppTheme.lightTheme.textTheme.headlineSmall!),
                  )),
              SizedBox(
                height: 15,
              ),
              FadeInRight(
                  duration: const Duration(milliseconds: 900),
                  child: TextFormField(
                    controller: _whatYouLearnController,
                    style: const TextStyle(color: ResColors.primary),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ResColors.primary, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ResColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ResColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: "What did you learn notes ",
                        labelStyle:
                            AppTheme.lightTheme.textTheme.headlineSmall!),
                  )),
              SizedBox(
                height: 15,
              ),
              FadeInLeft(
                  duration: const Duration(milliseconds: 950),
                  child: TextFormField(
                    controller: _notesController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    style: const TextStyle(color: ResColors.primary),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ResColors.primary, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ResColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ResColors.primary, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: " Future development notes",
                        labelStyle:
                            AppTheme.lightTheme.textTheme.headlineSmall!),
                  )),
              SizedBox(height: 15),
              Center(
                  child: DefaultButton(
                      radius: 20,
                      containerColor: ResColors.secondary,
                      textcolor: Colors.white,
                      text: "submit",
                      width: getProportionateScreenWidth(250),
                      press: () {
                        context.read<CpdAddCubit>().addCpd(AddCpdDataModelParams(
                            date: _dateCompleteController.text,
                            title: _titleController.text,
                            type: type!,
                            skills_area:_selectedSkills!.id,
                            format_of_training: _selectedTraining!.id,
                            hours_logged:int.parse( _hourLoggedController.text),
                            date_completed: _dateCompleteController.text,
                            cost_of_cpd:int.parse( _costController.text),
                            what_did_you_learn: _whatYouLearnController.text,
                            future_dev_nots: _notesController.text,
                            file: "file"));
                      })),
            ],
          ),
        )));
  }
}
