import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:url_launcher/url_launcher.dart';



import '../../colorsfile.dart';


class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
 
}

class _CoursesState extends State<Courses> {
  List a = [
     'assets/bhuj.png',
     'assets/dhan.png',
     'assets/mayur.png',
     'assets/vira.png',
  ];
   List data = [
    'Bhujangasana',
     'Dhanurasana',
    'Mayurasana',
    'Dhanurasana',

  ];

  
  dis(String text, String txt)
  {
     return Expanded(
        child: Column( 
          children: [
  Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 20, top: 0, bottom: 10),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                 InkWell(
                  onTap: () {
                    setState(() {
                      const url = 'https://www.youtube.com/watch?v=eNjdNJ8PRbk';
                      launchURL(url);
                    });
                  },
                  child:Text(
                  '$text',
                  style:GoogleFonts.playfairDisplay(
                  
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  
                ),),),
                 InkWell(
                  onTap: () {
                    setState(() {
                      const url = 'https://www.youtube.com/watch?v=eNjdNJ8PRbk';
                      launchURL(url);
                    });
                  },
                  child: Text(
                    '$txt',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: primary),
                  ),
                )]),),
                
            Expanded(
              
             child:ScrollSnapList(
                    itemBuilder: _buildItemList,
                    itemSize: 150,
                  dynamicItemSize: true,
                  onReachEnd: (){
                      print('Done!');
                  },
                  itemCount: a.length, onItemFocus: (int ) {  },
                )),]));
  }
  Widget _buildItemList(BuildContext context, int index,){
    if(index == a.length)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 120, width: 130,
            child:Card(
        
            color: Colors.white,
          
            child:
            Column(children:[
          Center(
          child: Container(
            
            child: Image(
              width: 70,
              height: 80,
              image: AssetImage('${a[index]}'),
            ),
          ),
        ),
        Row(
        children:[
          Container(margin: const EdgeInsets.only(top:10, left: 12), 
        child:  InkWell(
                             onTap: _launchURL,      
           child:Text('${data[index]}',
           style:GoogleFonts.roboto (fontSize: 15.0,color: Colors.black,),),
       
            ))])]
          ),)
           ) ],
      ),
    );
  }
   
    _launchURL() async {
      var url = 'https://www.youtube.com/watch?v=EIqsDkpzOgo';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

   /* return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 20),
      child: Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.1),
                  blurRadius: 30.0,
                  offset: Offset(10, 15))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            children: [
              Container(
                width: size.width * 0.25,
                height: size.height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    image: AssetImage(course.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.45,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding / 2, top: appPadding / 2.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Row(
                        children: [
                          Container(
                            child: InkWell(
                             // onTap: _launchURL,
                              child: Icon(
                                Icons.all_inclusive,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            course.students,
                            style: TextStyle(
                              color: black.withOpacity(0.4),
                            ),
                            maxLines: 2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: black.withOpacity(0.4),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            course.time.toString() + ' min',
                            style: TextStyle(
                              color: black.withOpacity(0.4),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }*/

  @override
  Widget build(BuildContext context) {
       return Expanded(
     
        
     
          child:Column( 
          children: [
         
            dis('Asanas for Asthma', 'Know More'),
             dis('Asanas for Fatigue', 'Know More'),
             dis('Asanas for weight loss', 'Know More'),
              
        
          ],
     )
    );
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
