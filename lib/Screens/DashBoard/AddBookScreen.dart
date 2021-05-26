import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bluepad_app/Model/Book.dart';
import 'package:bluepad_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

class AddBookScreen extends StatefulWidget {
  @override
  _AddProductWidgetState createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddBookScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  String dropDownValue = "Romance";
  TextEditingController _bookNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  var _daysAvailable = List.filled(7, true);
  bool _markUpAllowed = false;
  bool _everyDay = true;
  File _image;
  bool _isLoading = false;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 100,
        maxHeight: 100,
        imageQuality: 50);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 100,
        maxHeight: 100,
        imageQuality: 50);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  getImage() {
    if (_image != null) {
      return FileImage(File(_image.path));
    }
    return NetworkImage(
        "https://cdn3.iconfinder.com/data/icons/photo-tools/65/select-512.png");
  }

  getImageName() {
    if (_image != null) {
      return _image.path.split('/').last;
    }
    return "No Image selected";
  }

  handleMarkupSwitch(value) {
    setState(() {
      _markUpAllowed = value;
    });
  }

  handleDailyAvailableSwitch(value) {
    setState(() {
      _everyDay
          ? _daysAvailable = List.filled(7, false)
          : _daysAvailable = List.filled(7, true);
      _everyDay = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  showSnackBarMsg(msg) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(duration: Duration(seconds: 5), content: new Text(msg)));
  }

  handleAdd() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      showAwesomeDialog();
    }
  }

  showAwesomeDialog() {
    int id = Random().nextInt(999);
    Book book = Book(
      id: id,
      name: _bookNameController.text,
      image: _image.path,
      authorName: _authorController.text,
      description: _descriptionController.text,
    );
    AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Add Book',
      desc: 'Are you sure to Add Book?',
      customHeader: null,
      btnOkText: "Confirm",
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        setState(() {
          getBooks().add(book);
          Navigator.of(context).pop();
        });
      },
    )..show();
  }

  void _showDialog(item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:
              new Text("Product price is ${"0"} click on Ok to Continue.."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
                showAwesomeDialog();
              },
            ),
          ],
        );
      },
    );
  }

  handleCheckBox(value, item) {
    print(value);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: kPrimaryColor,
        title: Text("Add Book"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Container(
                            height: 150,
                            width: 130,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: getImage())),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please Enter Book Name';
                            }
                            return null;
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.deny('  ')
                          ],
                          controller: _bookNameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.book),
                            hintText: 'Book Name*',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please Enter Author Name';
                            }
                            return null;
                          },
                          controller: _authorController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Author Name*',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Please Enter Description';
                            }
                            return null;
                          },
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.description),
                            hintText: 'Description*',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Select Genres",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
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
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(child: _isLoading ? Container() : Container())
        ],
      ),
      bottomNavigationBar: Container(
        color: kPrimaryColor,
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
            onPressed: () {
              handleAdd();
            },
            textColor: Colors.white,
            child: Text(
              "Add",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
