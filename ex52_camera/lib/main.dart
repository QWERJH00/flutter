import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';  // 앨범과 카메라
import 'package:gallery_saver/gallery_saver.dart';  // 갤러리에 저장
import 'dart:io'; // File

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ex52_camera'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ImagePicker _picker = ImagePicker();
  // image_picker 모듈에서 File 객체 반환. IOS에서 에러
  // late File mphoto;  // <- 나중에 들어온다.(희망고문 후 에러)
  File? mphoto;     // 널일수도 있따.
  XFile? image;

  @override
  Widget build(BuildContext context) {
    late Widget photo;
    if(mphoto != null) {
      photo = Image.file(
                mphoto!,
                fit: BoxFit.contain,  // 작은 쪽에 맞춤. 큰 쪽에 여백남음
                );
    } else {
      photo = Text('EMPTY');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  ElevatedButton(
                child: const Text('Album',
                                  style: TextStyle(fontSize: 24)),
                onPressed: () => takePhoto(ImageSource.gallery), 
              ),
              SizedBox(width: 5,),
              ElevatedButton(
                child: const Text('Camera',
                                  style: TextStyle(fontSize: 24)),
                onPressed: () => takePhoto(ImageSource.camera), 
              ),
              SizedBox(width: 5,),
              ElevatedButton(
                child: const Text('Save',
                                  style: TextStyle(fontSize: 24)),
                onPressed: () => savePhoto(), 
              ),
              ],
            ),
            Expanded(
              child: photo
            ),
          ],
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    // 이미지 가져오기
    image = await _picker.pickImage(source: source);
    setState(() {
      mphoto = File(image!.path);
    });
  }

  void savePhoto() async {
    if(image != null) {
      GallerySaver.saveImage(image!.path)
      .then((bool? success) {
        print("Image saved on gallery...");
      });
    }
  }
}