
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BorrowBooksScreen extends StatelessWidget {
  const BorrowBooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Borrow Books',
          style: TextStyle(
              fontSize: 40, fontFamily: 'BebasNeue', color: Colors.black),
        ),
        leading: IconButton(
            iconSize: 30, onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 30, right: 60, left: 60),
            child:
            launchButton(title:('Programing 1') ,icon:Icons.ice_skating ,
                onPressed: () {
                  launchUrl(

                    Uri.parse(
                        'https://mrcet.com/downloads/digital_notes/CSE/II%20Year/DATA%20STRUCTURES%20DIGITAL%20NOTES.pdf'),
                    mode: LaunchMode.externalApplication,

                  );
                }
              // async{
              //   final url = '';
              //   if(await canLaunch())
              //
              // }

            ),),

          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 30, right: 60, left: 60),
            child:
            launchButton(title:('Programing 2') ,icon:Icons.ice_skating ,
                onPressed: () {
                  launchUrl(

                    Uri.parse(
                        'https://courses.minia.edu.eg/Attach/16036flowchart-algorithm-manual.pdf'),
                    mode: LaunchMode.externalApplication,

                  );
                }
              // async{
              //   final url = '';
              //   if(await canLaunch())
              //
              // }

            ),),
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 30, right: 60, left: 60),
            child:
            launchButton(title:('Programing 3') ,icon:Icons.ice_skating ,
                onPressed: () {
                  launchUrl(

                    Uri.parse(
                        'https://www.bu.edu/tech/files/2018/06/intro2DB20180611.pdf'),
                    mode: LaunchMode.externalApplication,

                  );
                }
              // async{
              //   final url = '';
              //   if(await canLaunch())
              //
              // }

            ),),
        ],
      ),

    );
  }
  Widget launchButton({required String title,required IconData icon ,required Function()onPressed,
  }){
    return Container(
      child:  ElevatedButton(style: ButtonStyle(),
          onPressed:onPressed,
          // async{
          //   final url = '';
          //   if(await canLaunch())
          //
          // }

          child: Row(children: [
            Icon(Icons.language),
            const SizedBox(width: 30,),
            Text(title,style: TextStyle(fontSize: 18,color: Colors.black),)


          ],



          )

      ),
    );

      // SingleChildScrollView(
      //   physics: const BouncingScrollPhysics(),
      //   padding: EdgeInsets.all(20),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       ListTile(
      //         title: Text('Datastructure'),
      //         selected: true,
      //         tileColor: Colors.grey,
      //         trailing: IconButton(
      //             onPressed: () async{
      //               try{
      //                 await launch('https://mrcet.com/downloads/digital_notes/CSE/II%20Year/DATA%20STRUCTURES%20DIGITAL%20NOTES.pdf');
      //               }catch(e){
      //                 debugPrint(e.toString());
      //               }
      //             },
      //             icon: const Icon(Icons.link)),
      //         leading: Icon(Icons.my_library_books),
      //       ),
      //
      //       ListTile(
      //         title: Text('Algorithms'),
      //         selected: true,
      //         tileColor: Colors.grey,
      //         trailing: IconButton(
      //             onPressed: () async{
      //               try{
      //                 await launch('https://courses.minia.edu.eg/Attach/16036flowchart-algorithm-manual.pdf');
      //               }catch(e){
      //                 debugPrint(e.toString());
      //               }
      //             },
      //             icon: const Icon(Icons.link)),
      //         leading: Icon(Icons.my_library_books),
      //       ),
      //
      //       ListTile(
      //         title: Text('Databse'),
      //         selected: true,
      //         tileColor: Colors.grey,
      //         trailing: IconButton(
      //             onPressed: () async{
      //               try{
      //                 await launch('https://www.bu.edu/tech/files/2018/06/intro2DB20180611.pdf');
      //               }catch(e){
      //                 debugPrint(e.toString());
      //               }
      //             },
      //             icon: const Icon(Icons.link)),
      //         leading: Icon(Icons.my_library_books),
      //       ),
      //     ],
      //   ),
      // ),


  }
}
