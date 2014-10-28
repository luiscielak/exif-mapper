class Record {
  String filename;
  float altitude;
  float latitude;
  float longitude;  

  public Record(String[] pieces) {
    filename = pieces[0];
    altitude = float(pieces[1]);  
    latitude = float(pieces[3]);  
    longitude = float(pieces[5]);
  
  }
}
