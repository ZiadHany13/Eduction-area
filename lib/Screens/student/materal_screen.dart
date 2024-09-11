import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';
import 'package:url_launcher/url_launcher.dart';


class MateralScreen extends StatefulWidget {
  final String courseId;
  final String courseName;
  const MateralScreen({super.key, required this.courseId, required this.courseName});

  @override
  State<MateralScreen> createState() => _MateralScreenState();
}

class _MateralScreenState extends State<MateralScreen> {

  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getSubject(id: widget.courseId);
    super.initState();
  }

  void back() {
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          centerTitle: true,
          title: Text( 'Materal',
            style: const TextStyle(
                fontSize: 40, fontFamily: 'BebasNeue', color: Colors.white),
          ),
          leading: IconButton(
              iconSize: 30, onPressed: back, icon: Icon(Icons.arrow_back)),
        ),
        body: BlocBuilder<AppCubit,AppState>(
          builder: (context,state){
            var cubit=AppCubit.get(context);
            return (state is LoadingGetSubjectState)?
            const Center(child: CircularProgressIndicator())
                :ListView.builder(
                itemCount: cubit.subList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cubit.subList[index].uploadName??''),
                    selected: true,
                    tileColor: Colors.grey,
                    trailing: IconButton(
                        onPressed: () async{
                          try{
                            await launch(cubit.subList[index].fileUrl??'');
                          }catch(e){
                            debugPrint(e.toString());
                          }
                        },
                        icon: const Icon(Icons.link)),
                    leading: const Icon(Icons.my_library_books),
                  );
                });
          },
        )
    );
  }
}
