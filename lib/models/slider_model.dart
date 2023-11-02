class SliderModel {
  String? image;
  String? text;
  String? altText;
  String? bAltText;
  String? productImage;
  int? kBackgroundColor;

  SliderModel(this.image, this.text, this.altText, this.bAltText,
      this.productImage, this.kBackgroundColor);

  SliderModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    kBackgroundColor = json['kBackgroundColor'];
    text = json['text'];
    altText = json['altText'];
    bAltText = json['bAltText'];
    productImage = json['productImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['kBackgroundColor'] = kBackgroundColor;
    data['text'] = text;
    data['altText'] = altText;
    data['bAltText'] = bAltText;
    data['productImage'] = productImage;
    return data;
  }
}

List<SliderModel> slides =
    slideData.map((item) => SliderModel.fromJson(item)).toList();

var slideData = [
  {
    "image": "assets/slides/background-1.jpeg",
    "kBackgroundColor": 0xFF2c614f,
    "text": "Chào mừng bạn đến với bảng quản trị của BlackRose",
    "altText": "Truy cập và theo dõi các dịch vụ theo thời gian thực.",
    "bAltText": "Bảng điều khiển hỗ trợ AI đang được triển khai",
    "productImage": "assets/images/blackRose_logo.png"
  },
  {
    "image": "assets/slides/background-2.jpeg",
    "kBackgroundColor": 0xFF8a1a4c,
    "text": "Tài khoản quản trị phải được Admin cấp quyền",
    "altText": "Không chia sẻ tài khoản cho bất cứ ai",
    "bAltText": "Vui lòng liên hệ với bộ phận kỹ thuật nếu có sự cố!",
    "productImage": "assets/images/blackRose_logo.png"
  },
  {
    "image": "assets/slides/background-3.jpeg",
    "kBackgroundColor": 0xFF0ab3ec,
    "text": "Bảo mật thông tin khách hàng",
    "altText": "Đảm bảo tuân thủ các quy tắc nghề nghiệp",
    "bAltText": "Mọi hành động đều sẽ được ghi nhận lại",
    "productImage": "assets/images/blackRose_logo.png"
  }
];
