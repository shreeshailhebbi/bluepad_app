import 'package:bluepad_app/Model/Book.dart';
import 'package:bluepad_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;

  BookDetailScreen({this.book});

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  TextEditingController _commentController = TextEditingController();
  int _currentIndex = 0;
  bool _isDescription = true;
  bool _isFavariot;

  @override
  void initState() {
    _isFavariot = widget.book.favorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: CustomScrollView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(
                          widget.book.favorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 35,
                          color:
                              widget.book.favorite ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.book.favorite = !widget.book.favorite;
                          });
                        },
                      )
                    ],
                    backgroundColor: kPrimaryColor,
                    expandedHeight: MediaQuery.of(context).size.height * 0.3,
                    flexibleSpace: Center(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(widget.book.image))),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 15),
                        child: Text(
                          widget.book.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.book.authorName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.book.releaseDate,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 15),
                        child: Text(
                          widget.book.genres,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        margin: EdgeInsets.only(
                          top: 25.0,
                        ),
                        padding: const EdgeInsets.only(left: 15),
                        child: DefaultTabController(
                          length: 2,
                          child: TabBar(
                            labelPadding: const EdgeInsets.all(0),
                            indicatorPadding: const EdgeInsets.all(0),
                            isScrollable: true,
                            labelColor: Colors.black,
                            indicatorColor: kPrimaryColor,
                            unselectedLabelColor: Colors.grey,
                            onTap: (value) {
                              print(value);
                              setState(() {
                                _currentIndex = value;
                              });
                            },
                            tabs: [
                              Tab(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Text("Description",
                                      style: TextStyle(fontSize: 16)),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    "Reviews",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _currentIndex == 0
                          ? Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                child: Text(
                                  widget.book.description,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, right: 15.0),
                              child: reviewWidget(),
                            )
                    ]),
                  )
                ],
              ),
            ),
            _currentIndex == 1
                ? Positioned(
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                      height: 50,
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                                style: TextStyle(fontSize: 18),
                                onChanged: (text) {},
                                controller: _commentController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: "Post Comment...",
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    border: InputBorder.none)),
                          ),
                          FlatButton(
                              color: kPrimaryColor,
                              onPressed: () {},
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("Post"))
                        ],
                      ),
                    ))
                : Container()
          ],
        ),
      ),
    );
  }

  Widget reviewWidget() {
    return Container(
        child: ListView.builder(
            itemCount: 8,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: Icon(Icons.person,color: Colors.white,size: 30,),
                ),
                title: Text("user"),
                subtitle: Text("nice Book"),
                trailing: Text("5 m"),
              );
            }));
  }
}
