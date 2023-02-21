import 'dart:io';
import 'package:amazon/common/widget/custom_button.dart';
import 'package:amazon/common/widget/custom_textfield.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/screen/admin/service/admin_service.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController productNameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController quantityController;
  final AdminService adminService = AdminService();

  final List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  String category = 'Mobiles';

  List<File> images = [];

  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    productNameController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    quantityController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    productNameController.dispose;
    descriptionController.dispose;
    priceController.dispose;
    quantityController.dispose;
    super.dispose();
  }

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminService.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    images = res;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Text(
            'Add Product',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images
                            .map((e) => Builder(
                                  builder: (context) => Image.file(
                                    e,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ))
                            .toList(),
                        options:
                            CarouselOptions(viewportFraction: 1, height: 200))
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.folder_open, size: 40),
                                const SizedBox(height: 15),
                                Text(
                                  'Select Product Images',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                CustomTextField(
                    controller: productNameController,
                    hintText: 'Product Name'),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: descriptionController, hintText: 'Description'),
                const SizedBox(height: 10),
                CustomTextField(controller: priceController, hintText: 'Price'),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: quantityController,
                  hintText: 'Quantity',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      category = newVal!;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Sell',
                  onTap: sellProduct,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
