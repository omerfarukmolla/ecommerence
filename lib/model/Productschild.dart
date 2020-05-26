class Productschild{
  final int Prochid;
  final int Prochproid;
  final  String Prochmainimg ;
  final  String Prochimg1 ;
  final  String Prochimg2 ;
  final  String Prochimg3 ;

   Productschild({this.Prochid, this.Prochproid, this.Prochmainimg,this.Prochimg1,this.Prochimg2,this.Prochimg3});

factory Productschild.fromJson(Map<String, dynamic> json) {
    return Productschild(
      Prochid: json['prochid'] as int,
      Prochproid: json['prochproid'] as int,
      Prochmainimg: json['prochmainimg'] as String,
      Prochimg1: json['prochimg1'] as String,
      Prochimg2: json['prochimg2'] as String,
      Prochimg3: json['prochimg3'] as String,
    );

}
}