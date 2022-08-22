import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List dataStudent = [
  {
    "albumId": 1,
  "id": 1,
  "title": "Le Viet Hung",
  "avatar": "https://scontent.fhan3-1.fna.fbcdn.net/v/t39.30808-6/279646963_3128388857415653_6917723784232208239_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=1m4jMfykdRAAX_VjYNu&_nc_ht=scontent.fhan3-1.fna&oh=00_AT-TFCLwzqVyi2VknaYm6kpyvxKBu6wIl8mpKU8pteZzaw&oe=6300B33C",
    "date" : "13/01/1994",
    "group": "L",
    "address": "Tan Son",
  },
  {
  "albumId": 1,
  "id": 2,
  "title": "Dinh Van Thang",
  "avatar": "https://scontent.fhan3-2.fna.fbcdn.net/v/t1.6435-9/60342550_1732109616934177_3140512286205018112_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=ifknmoi-l5EAX_1ZlZo&_nc_ht=scontent.fhan3-2.fna&oh=00_AT8dVulnwAqEdBIV2nVXFH2K7DSD4ajKMsBmhbRcA0Ua3g&oe=63224580",
    "date" : "19/01/1994",
    "group": "D",
    "address": "Tan Son",
  },
  {
  "albumId": 1,
  "id": 3,
  "title": "Trinh Xuan Nam",
  "avatar": "https://scontent.fhan3-1.fna.fbcdn.net/v/t1.18169-9/28059112_1213068445495565_5581652811836222671_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=nluYXezU8x0AX8unP3w&_nc_ht=scontent.fhan3-1.fna&oh=00_AT8EQABdDoqS2aabxvmpDRj5b3HFpNX0V0G0VmnEgqhXyQ&oe=63209940",
    "date" : "13/02/1994",
    "group": "T",
    "address": "Le Ho",
  },
  {
  "albumId": 1,
  "id": 4,
  "title": "NGhe Tien Hiep",
  "url": "https://via.placeholder.com/600/d32776",
  "avatar": "https://scontent.fhan3-2.fna.fbcdn.net/v/t1.6435-9/117194453_2729774423913147_8382704366722056178_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=174925&_nc_ohc=hxSBeUyKNTsAX_eVkwW&tn=MAq-I87XZz-GJQWc&_nc_ht=scontent.fhan3-2.fna&oh=00_AT-fJaI2Pnz3PHuO_59VnaR0_Rzk0rCukiYYWW1iomJdTQ&oe=6320064C",
    "date" : "12/01/1994",
    "group": "N",
    "address": "Nguyen Uy",
  },
  {
  "albumId": 1,
  "id": 5,
  "title": "Duong Van Thanh",
  "avatar": "https://scontent.fhan3-2.fna.fbcdn.net/v/t39.30808-6/289001004_3229201847408049_2039602838660248475_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=PxKG_eUyy3YAX8CeGoe&_nc_ht=scontent.fhan3-2.fna&oh=00_AT83mkCiouN-iF9vzX8yobuI-OGcPuOdeC77AnPHC4k42A&oe=630202E6",
    "date" : "13/04/1994",
    "group": "D",
    "address": "Tan Son",
  },
  ];
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh Sach 12A2'),
      leading: Icon(Icons.perm_contact_cal),),
      body: GroupedListView<dynamic, String>(
        elements: dataStudent,
        groupBy: (element) => element['group'],
        groupSeparatorBuilder: (String groupByValue) => Padding(
            padding: EdgeInsets.all(10),
        child: Row(
            children: [
              Flexible(child: Row(
            children: [
              Container(
            margin: EdgeInsets.only(left: 10,right: 10),
              child: Text(
                groupByValue,
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),)
          ],
        ))
          ],
        ),),
        itemBuilder: (context, dynamic element) {
          return Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(child: ClipRRect(
                    child: Image(image: NetworkImage(element['avatar']), fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(5),
                  )),
                  Expanded(flex: 5,child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 15),
                          child: Text(
                            element['title'],
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                          ),),
                        Padding(padding: EdgeInsets.only(bottom: 5,top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.home,size: 14,),
                            Text(
                              element['address'],
                              style: TextStyle(fontSize: 13,color: Colors.blueAccent),
                            )
                          ],
                        )),
                        Padding(padding: EdgeInsets.only(bottom: 5,top: 5),
                            child: Row(
                              children: [
                                Icon(Icons.cake, size: 14,),
                                Text(
                                  element['date'],
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            ))
                      ],
                    ),
                  )),
                ],
                
              ),
            ),
          );
        },
        itemComparator: (item1, item2) => item1['title'].compareTo(item2['title']), // optional
        useStickyGroupSeparators: true, // optional
        floatingHeader: true, // optional
        order: GroupedListOrder.ASC, // optional
      ),
    );
  }
}
