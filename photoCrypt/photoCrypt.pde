import java.util.*

String[] msg;
String[] iv;
PImage img;

void setup(){
		msg = loadStrings("msg.txt");
		iv = loadStrings("iv.txt");
    PImage img = createImage(100,100,RGB);
    img.loadPixels();
    generateImage(iv,msg);
}

private static String removeLastChar(String str) {
    return str.substring(0, str.length() - 1);
}
private static String removeFirstChar(String str) {
    return str.substring(1, str.length());
}

public static String[][] getPixelArr(String[] arr) {
    int[][] pixelsList = new int[arr.length][3];
    for(int i = 0; i<arr.length; i++){
      arr[i] = removeLastChar(arr[i]);
      arr[i] = removeFirstChar(arr[i]);
      List<String> vals = Arrays.asList(arr[i].split(","));
      pixelsList[i] = convertToArr(vals); 
    }
    return pixelsList;
}

public void generateImage(String[][] iv, String[][] msg){
    drawPixels(iv,0);
    int[][] zeros = {{0,0,0},{0,0,0},{0,0,0}};
    drawPixels(zeros,iv.length);
    drawPixels(msg,iv.length+zeros.length);
    Image(img,0,0);
}

public void drawPixels(String[][] pixels, int start){
  for(int i = 0; i<pixelsList[0].length; i++){
    img.pixels[i] = color(pixelsList[i][0],pixelsList[i][1],pixelsList[i][2]);
  }
  img.updatePixels();
}

public String[] convertToArr(ArrayList<String> list){
  String[] newArr = new String[list.size()];
  for(int i = 0; i<list.size(); i++)
  {
    newArr[i] = list.get(i);
  }
  return newArr;
}

void draw(){
}
