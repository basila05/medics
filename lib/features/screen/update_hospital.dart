import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradients/gradients.dart';
import 'package:medics/features/controllers/user_controller.dart';
import 'package:medics/features/screen/hsptlDetails.dart';
import 'package:medics/features/screen/medicine2.dart';
import 'package:medics/models/hospitalModel.dart';
import '../../../core/constants/colorpage.dart';
import '../../../main.dart';
import '../../models/doctormodel.dart';

// class UpdateHospital extends ConsumerStatefulWidget {
//   final HsptlModel details;
//   const UpdateHospital(this.details, {super.key});
//
//   @override
//   ConsumerState createState() => _UpdateHospital();
// }
class UpdateHospital extends ConsumerStatefulWidget {
  final HsptlModel details;
  const UpdateHospital( {super.key,
    required this.details});

  @override
  ConsumerState createState() => _UpdateHospitalState();
}

class _UpdateHospitalState extends ConsumerState<UpdateHospital> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  final formKey=GlobalKey<FormState>();
  bool toggle = false;

  PlatformFile? pickFile;
  UploadTask? uploadTask;
  String? hsptlImage;

  Future selectFileToMessage(String name) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    pickFile = result.files.first;

    // String? ext = pickFile?.name?.split('.')?.last;
    final fileBytes = result.files.first.bytes;

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Uploading...")));
    uploadFileToFireBase(name, fileBytes);

    setState(() {});
  }

  Future uploadFileToFireBase(String name, fileBytes) async {
    uploadTask = FirebaseStorage.instance
        .ref('hospital/${DateTime.now().toString()}-$name')
        .putData(fileBytes,SettableMetadata(
        contentType: 'image/jpeg'
    ));
    final snapshot = await uploadTask?.whenComplete(() {});
    hsptlImage = (await snapshot?.ref?.getDownloadURL())!;

    // ignore: use_build_context_synchronously
    // showUploadMessage(context, '$name Uploaded Successfully...');
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    // ScaffoldMessenger.of(context).clearSnackBars();
    setState(() {});
    print(hsptlImage);
  }
  hsptlDetails(){
    ref.read(HsptlControllerProvider).addHsptlData(HsptlModel(
        name: nameController.text,
        image: hsptlImage.toString(),
        id: idController.text)
    );

  }


  updateddata(HsptlModel details) {
    ref.watch(HsptlControllerProvider).updateData(details.copyWith(
        name: nameController.text,
        image: hsptlImage
    ));
  }
  @override
  void initState() {
    nameController.text=widget.details.name;
    hsptlImage=widget.details.image;

    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height*1,
            width: width*1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      ColorPage.secondarycolor,
                      ColorPage.primarycolor,
                    ],
                    stops: [0.5,0.5],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: height*0.85,
                      width: width*0.65,
                      decoration: BoxDecoration(
                        color: ColorPage.fourthcolor,
                        borderRadius: BorderRadius.circular(width*0.02),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height*0.07,),
                          Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  toggle=!toggle;
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  height: height*0.07,
                                  width: width*0.4,
                                  decoration: BoxDecoration(
                                      color: ColorPage.color3,
                                      border: Border.all(
                                          color: ColorPage.color1,
                                          width: width*0.001
                                      ),
                                      borderRadius: BorderRadius.circular(width*0.014)
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: Duration(
                                    milliseconds: 200
                                ),
                                left:toggle? width*0.16:width*0.001,
                                right:toggle?width*0.001: width*0.16,
                                curve: Curves.easeIn,
                                child: AnimatedContainer(
                                  curve: Curves.easeIn,
                                  duration:  Duration(
                                      milliseconds: 200
                                  ),
                                  height: height*0.07,
                                  width: width*0.2,
                                  decoration: BoxDecoration(
                                      color: ColorPage.primarycolor,
                                      border: Border.all(
                                          color: ColorPage.color1,
                                          width: width*0.001
                                      ),
                                      borderRadius: BorderRadius.circular(width*0.014)
                                  ),
                                  child: toggle?Center(
                                    child: Text("Hospital",style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: ColorPage.secondarycolor,
                                        fontSize: width*0.012
                                    ),),
                                  ):Center(
                                    child: Text("Add",style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: ColorPage.secondarycolor,
                                        fontSize: width*0.012
                                    ),),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: Duration(
                                    milliseconds: 200),
                                left: toggle?width*0.015:width*0.18,
                                right: toggle?width*0.18:width*0.0015,
                                top: width*0.007,
                                child: toggle?Center(
                                  child: Text("Add",style: TextStyle(
                                    fontSize: width*0.012,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.color5,
                                  ),),
                                ):Center(
                                  child: Text("Hospital",style: TextStyle(
                                    fontSize: width*0.012,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPage.color5,
                                  ),),
                                ),)
                            ],
                          ),
                          SizedBox(height: height*0.1,),
                          toggle? Column(
                            children: [
                              SizedBox(height: height*0.1,),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HsptlDetails(),));
                                },
                                child: Container(
                                  height: height*0.08,
                                  width: width*0.25,
                                  decoration: BoxDecoration(
                                      color: ColorPage.color3,
                                      border: Border.all(
                                          color: ColorPage.color1,
                                          width: width*0.001
                                      ),
                                      borderRadius: BorderRadius.circular(width*0.014)
                                  ),
                                  child: Center(child: Text("Hospital with Details",style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: ColorPage.color5,
                                      fontSize: width*0.012
                                  ),)),
                                ),
                              ),
                            ],
                          ):
                          Column(
                            children: [
                              hsptlImage != null? Container(
                                height: height*0.2,
                                width: width*0.1,
                                decoration: BoxDecoration(
                                    boxShadow:[
                                      BoxShadow(
                                        color: ColorPage.thirdcolor.withOpacity(0.10),
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                        offset:Offset(0, 4),
                                      )
                                    ] ,
                                    borderRadius: BorderRadius.circular(width*0.01),
                                    image: DecorationImage(image: NetworkImage(hsptlImage!))
                                ),
                              ):Container(
                                height: height*0.2,
                                width: width*0.1,
                                decoration: BoxDecoration(
                                  gradient: LinearGradientPainter(
                                    colors: <Color>[ColorPage.primarycolor, ColorPage.fifthcolor],
                                  ),
                                  boxShadow:[
                                    BoxShadow(
                                      color: ColorPage.thirdcolor.withOpacity(0.10),
                                      blurRadius: 3,
                                      spreadRadius: 2,
                                      offset:Offset(0, 4),
                                    )
                                  ] ,
                                  border: Border.all(
                                      color: ColorPage.primarycolor
                                  ),
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),
                                child: InkWell(
                                    onTap: () {
                                      selectFileToMessage("hospital");
                                    },
                                    child: Icon(CupertinoIcons.camera_on_rectangle,size: width*0.03,color: ColorPage.secondarycolor,)),
                              ),
                              SizedBox(height: height*0.05,),
                              Container(
                                height: height*0.06,
                                width: width*0.23,
                                decoration: BoxDecoration(
                                  color: ColorPage.color3,
                                  borderRadius: BorderRadius.circular(width*0.01),
                                ),
                                child: TextFormField(
                                  controller: nameController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: width*0.012,fontWeight: FontWeight.w500,color: ColorPage.thirdcolor),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(width*0.005),
                                      child: Icon(CupertinoIcons.table,color: ColorPage.primarycolor,),
                                    ),
                                    labelText: "Hospital name",
                                    labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.012, color: ColorPage.color1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorPage.primarycolor,
                                        ),
                                        borderRadius: BorderRadius.circular(width*0.01)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorPage.primarycolor
                                      ),
                                      borderRadius: BorderRadius.circular(width*0.01),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: height*0.05,),
                              InkWell(
                                onTap: () async {
                                await  updateddata(widget.details);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HsptlDetails(),));

                                },
                                child: Container(
                                  height: height*0.06,
                                  width: width*0.17,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradientPainter(
                                      colors: <Color>[ColorPage.primarycolor, ColorPage.fifthcolor],
                                    ),
                                    borderRadius: BorderRadius.circular(width*0.01),
                                  ),
                                  child: Center(
                                    child: Text("Update",style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: ColorPage.secondarycolor,
                                        fontSize: width*0.012
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
