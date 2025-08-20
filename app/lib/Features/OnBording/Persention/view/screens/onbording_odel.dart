import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/constant/textconst.dart';

class Onbordingmodel {
  final String image;
  final String title;
  final String desc;

  Onbordingmodel({
    required this.image,
    required this.title,
    required this.desc,
  });
}

List<Onbordingmodel> ListOnbording = [];
List<Onbordingmodel> getOnbording() {
  var images = [
    ImageManager.slidingImage1,
    ImageManager.onBoarding2,
    ImageManager.onBoarding3,
  ];
  const titles = [
    Textconst.welcome,
    Textconst.easyToBuy,
    Textconst.wonderUserText,
  ];
  const desc = [
    Textconst.welcomdialog,
    Textconst.easydialog,
    Textconst.wonderdialog,
  ];
  return List.generate(images.length, (index) {
    return Onbordingmodel(
      image: images[index],
      title: titles[index],
      desc: desc[index],
    );
  });
}
