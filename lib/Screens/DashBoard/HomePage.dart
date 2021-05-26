import 'package:bluepad_app/Model/Book.dart';
import 'package:bluepad_app/Screens/DashBoard/AddBookScreen.dart';
import 'package:bluepad_app/Screens/DashBoard/BookDetailScreen.dart';
import 'package:bluepad_app/Screens/Login/login_screen.dart';
import 'package:bluepad_app/UserService.dart';
import 'package:bluepad_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserService _userService = UserService();
  TextEditingController _searchController = TextEditingController();
  List<Book> books;
  List<Book> allBooks;
  List<Book> searchedBooks;
  List<Book> mostPopularBooks;
  List<Book> favouriteBooks;
  String dropDownValue = "Romance";
  bool _isSearching = false;
  String username = "User";
  bool _isLoggedIn = false;

  @override
  void initState() {
    getCurrentUser();
    books = getBooks()
        .where((book) =>
            book.genres.toLowerCase().contains(dropDownValue.toLowerCase()))
        .toList();
    searchedBooks = books;
    favouriteBooks = getBooks().where((book) => book.favorite).toList();
  }

  handleLogout() async {
    await _userService.logout().then((value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        ));
  }

  getCurrentUser() async {
    String user = await _userService.getCurrentUser();
    if (user != null) {
      setState(() {
        _isLoggedIn = true;
        username = user;
      });
    }
  }

  handleSearchInput(text) {
    if (text != null || text != "") {
      setState(() => {
            _isSearching = true,
            searchedBooks = books
                .where((book) =>
                    book.name.toLowerCase().contains(text.toLowerCase()))
                .toList()
          });
    }
    if (text == null || text == "") {
      setState(() {
        searchedBooks = books;
      });
    }
  }

  handleClear() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isSearching = false;
      searchedBooks = books;
      _searchController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                  margin:
                      EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
                  child: ListView(physics: BouncingScrollPhysics(), children: <
                      Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hi, $username",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.grey),
                            ),
                            _isLoggedIn
                                ? InkWell(
                                    onTap: handleLogout,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.logout),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Text(
                                              "Logout",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return LoginScreen();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Icon(Icons.person),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            child: Text(
                                              "Login",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 5,
                              child: Text("Discover Latest Books",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  )),
                            ),
                            Flexible(
                              flex: 2,
                              child: DropdownButton<String>(
                                  isExpanded: true,
                                  underline: Container(),
                                  hint: Text('Select Type'),
                                  value: dropDownValue,
                                  items: <String>[
                                    'Horror',
                                    'Action and Adventure',
                                    'Fantasy',
                                    'Romance',
                                  ].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(
                                        value,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                            color: Colors.grey),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropDownValue = newValue;
                                      initState();
                                    });
                                  }),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(40, 40, 150, 0.4),
                                    blurRadius: 15,
                                    offset: Offset(0, 10))
                              ]),
                          child: TextFormField(
                            onChanged: (text) => {handleSearchInput(text)},
                            style: TextStyle(fontSize: 18),
                            controller: _searchController,
                            keyboardType: TextInputType.text,
                            decoration: buildInputDecoration(
                              Icons.search,
                              "Search Books..",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Most Popular Books",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 180,
                      child: ListView.builder(
                          itemCount: searchedBooks.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return BookDetailScreen(
                                        book: searchedBooks[index],
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                height: 180,
                                width: 153,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            searchedBooks[index].image))),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Books For You",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      shrinkWrap: true,
                      children: new List<Widget>.generate(searchedBooks.length,
                          (index) {
                        return new GridTile(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BookDetailScreen(
                                    book: searchedBooks[index],
                                  );
                                },
                              ),
                            );
                          },
                          child: new Container(
                            margin: EdgeInsets.only(right: 15, top: 15),
                            height: 200,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(100, 50, 100, 0.1),
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                        searchedBooks[index].image))),
                          ),
                        ));
                      }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Favourite Books",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      shrinkWrap: true,
                      children: new List<Widget>.generate(favouriteBooks.length,
                          (index) {
                        return new GridTile(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BookDetailScreen(
                                    book: favouriteBooks[index],
                                  );
                                },
                              ),
                            );
                          },
                          child: new Container(
                            margin: EdgeInsets.only(right: 15, top: 15),
                            height: 200,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(100, 50, 100, 0.1),
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                        favouriteBooks[index].image))),
                          ),
                        ));
                      }),
                    ),
                  ])),
            ],
          ),
        ),
        floatingActionButton: _isLoggedIn
            ? FloatingActionButton(
                backgroundColor: kPrimaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddBookScreen();
                      },
                    ),
                  ).then((value) => initState());
                },
                child: Icon(Icons.add),
              )
            : null);
  }

  InputDecoration buildInputDecoration(IconData icon, String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
        suffixIcon: IconButton(
            icon: Icon(
              _isSearching ? Icons.cancel : Icons.search,
              size: 25,
            ),
            onPressed: () => {_isSearching ? handleClear() : () {}}),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
        ),
        border: InputBorder.none);
  }
}
