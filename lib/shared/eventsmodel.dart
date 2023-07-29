class EventsModel{
  String ? image;
  String ? name;
  String ?location;
  String ? description;
  String ? date;
  EventsModel(
      {
        this.name,
        this.date,
        this.image,
        this.location,
        this.description,
      }
      );
  EventsModel.fromJson(Map<String,dynamic> json)
  {
    image=json['image'];
    name=json['name'];
    location=json['location'];
    description=json['description'];
    date=json['date'];
  }
}