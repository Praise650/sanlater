import 'package:flutter/cupertino.dart';
import 'package:sanlater/models/homepage-model.dart';
import 'package:sanlater/util/assets.dart';

class HomepageViewModelData extends ChangeNotifier {
  List<HomepageModel> item = [
    HomepageModel(
        itemName: 'Scott Jacket',
        price: '₦15,000',
        imageLink: ItemAssets.blackjacket,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio elit suscipit mattis massa ut pellentesque sed.'
            ' Eu condimentum rutrum amet integer turpis dui. Porttitor blandit'
            ' vitae erat habitant diam. Sed donec condimentum dolor et lacus eu eget sit at. Phasellus donec potenti porta nam aliquet duis eros.'
            ' Nibh justo est interdum in suspendisse amet, semper non eget.'
            'Ultricies netus in accumsan neque hendrerit facilisis aliquet cum.'
            'Nisi, ut sagittis, molestie convallis.'),
    HomepageModel(
        itemName: 'Sony Headphone',
        price: '₦4,000',
        description: '',
        imageLink: ItemAssets.headset),
    HomepageModel(
        description: '',
        itemName: 'Black Backpack',
        price: '₦3,600',
        imageLink: ItemAssets.blackBackPack),
    HomepageModel(
        description: '',
        itemName: 'Smart Watch',
        price: '₦310,500',
        imageLink: ItemAssets.smartWatch),
    HomepageModel(
        description: '',
        itemName: 'Suede Shoe',
        price: '₦15,000',
        imageLink: ItemAssets.suedeShoe),
    HomepageModel(
        description: '',
        itemName: 'Blue polo shirt',
        price: '₦1,500',
        imageLink: ItemAssets.poloShirt),
    HomepageModel(
        description: '',
        itemName: '500gb Hard disk',
        price: '₦15,000',
        imageLink: ItemAssets.hardDisk),
    HomepageModel(
        description: '',
        itemName: 'Logitech Mouse',
        price: '₦3,500',
        imageLink: ItemAssets.mouse),
  ];
  int get taskCount => item.length;
  int productSelectedIndex = 0;

  updateCategoryIndex(int index) {
    productSelectedIndex = index;
    notifyListeners();
  }
}
