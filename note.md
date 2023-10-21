String ? path;
Future <XFILE?> pickimage()
async {
    final picker = ImagePicker();
    return await picker.pickImage(
        source: ImageSource.gallery
    )
}

String myImage() async {
    final pickedFile = await pickImage();
    
}