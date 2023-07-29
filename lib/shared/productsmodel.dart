class ProductsModel{
  String ? image;
  String ? name;
  String ? price;
  ProductsModel(
      {
        this.name,
        this.image,
        this.price,
      }
      );

  ProductsModel.fromJson(Map<String,dynamic> json)
  {
    image=json['image'];
    name=json['name'];
    price=json['price'];
  }
}