// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:boilerplate/components/app_container/app_container.dart';
import 'package:boilerplate/constants/app.dart';
import 'package:boilerplate/constants/hairstyles.dart';
import 'package:boilerplate/constants/navigator/page_route_effect.dart';
import 'package:boilerplate/constants/style_name.dart';
import 'package:boilerplate/hairstyle/service/hairstyle_service.dart';
import 'package:boilerplate/task_result/view/hairstyle_result.dart';
import 'package:boilerplate/hairstyle/viewmodel/state.dart';
import 'package:boilerplate/helpers/device_info/device_info.dart';
import 'package:boilerplate/hairstyle/viewmodel/cubit.dart';
import 'package:boilerplate/hairstyle/viewmodel/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../helpers/navigator/navigator.dart';

class HairStyleSelectorScreen extends StatefulWidget {
  const HairStyleSelectorScreen({super.key});

  @override
  State<HairStyleSelectorScreen> createState() => _HairStyleSelectorScreenState();
}

class _HairStyleSelectorScreenState extends State<HairStyleSelectorScreen> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  int selected = -1;
  String _selectedHairStyle = "";

  Future getImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
      print('Image Path: ${_image!.path}');
    } else {
      print('No image selected.');
    }
  }

  Widget get _pickImage {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _image == null
              ? Text('Upload a Photo!')
              : Expanded(
                  child: Image.file(File(_image!.path)),
                ),
          SizedBox(height: DeviceInfo.height(2)),
          FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
          SizedBox(height: DeviceInfo.height(2)),
        ],
      ),
    );
  }

  Widget get _hairstyles {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 3 / 4,
      children: List.generate(HairStyle.values.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selected = index;
              _selectedHairStyle = HairStyle.values[index].name;
            });
            if (_image != null) {
              print(_image);
            }
            print(_selectedHairStyle);
          },
          child: Container(
            height: DeviceInfo.height(10),
            width: DeviceInfo.width(10),
            margin: EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selected == index ? Colors.blue : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                    child: Image.asset(
                      'assets/hairstyles/${HairStyle.values[index].name}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    HairStyleName.values[index].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                    maxLines: 2,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget styleButton(BuildContext context) {
    return BlocConsumer<HairStyleCubit, HairStyleState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ElevatedButton(
          onPressed: context.watch<HairStyleCubit>().isLoading
              ? null
              : () {
                  context.read<HairStyleCubit>().updateImageAndHairStyle(_image!.path, _selectedHairStyle);

                  context.read<HairStyleCubit>().styleHair();
                },
          child: context.watch<HairStyleCubit>().isLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              : Text("Start to Style"),
        );
      },
    );
  }

  Widget _body(BuildContext context, HairStyleState state) {
    return Column(
      children: [
        Expanded(child: _pickImage),
        Expanded(child: _hairstyles),
        styleButton(context),
        SizedBox(height: DeviceInfo.height(2)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: BlocProvider(
          create: (context) => HairStyleCubit(
                image: _image != null ? _image!.path : null,
                hairStyle: _selectedHairStyle,
                taskType: "async",
                service: HairStyleService(Application.apiBaseUrl),
              ),
          child: BlocConsumer<HairStyleCubit, HairStyleState>(
            builder: (context, state) {
              return _body(context, state);
            },
            listener: (context, state) {
              if (state is ResponseHairStyleState) {
                AppNavigator.push(screen: HairStyleResultScreen(response: state.response), effect: AppRouteEffect.rightToLeft);
              }
              if (state is ErrorHairStyleState) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Error"),
                    content: Text(state.message),
                    actions: [
                      TextButton(onPressed: () => AppNavigator.pop(), child: Text("Kapat")),
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
