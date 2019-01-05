//import java.util.*

String[] msg;
String[] iv;
PImage img;
int[][] iv2;
int[][] msg2;

void setup()
{
  size(500, 500);
  background(255);
  msg = loadStrings("test1.txt");
  iv = loadStrings("test2.txt");
  PImage img = createImage(100, 100, RGB);
  img.loadPixels();
  iv2 = getPixelArr(iv);
  msg2 = getPixelArr(msg);
  print(iv2);
  for (int i = 0; i<iv2.length; i++) {
    for ( int j = 0; j<iv2[0].length; j++) {
      print(iv2[i][j]);
    }
  }
  generateImage(iv2, msg2);
}

private static String removeLastChar(String str) {
  return str.substring(0, str.length() - 1);
}
private static String removeFirstChar(String str) {
  return str.substring(1, str.length());
}

public static int[][] getPixelArr(String[] arr) {
  int[][] pixelsList = new int[arr.length][3];
  for (int i = 0; i<arr.length; i++) {
    arr[i] = removeLastChar(arr[i]);
    arr[i] = removeFirstChar(arr[i]);
    String[] vals = arr[i].split(",");
    pixelsList[i] = convertToArr(vals);
  }
  return pixelsList;
}

public void generateImage(int[][] iv, int[][] msg) {
  drawPixels(iv, 0);
  int[][] zeros = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};
  drawPixels(zeros, iv.length);
  drawPixels(msg, iv.length+zeros.length);
  image(img, 0, 0);
}

public void drawPixels(int[][] pixelsList, int start) {
  print(pixelsList[2][0]);
  for (int i = start; i<start+pixelsList[0].length; i++) {
    set(pixelsList[i][0], pixelsList[i][1], pixelsList[i][2]);
  }
  img.updatePixels();
}

public static int[] convertToArr(String[] list) {
  int[] newArr = new int[list.length];
  for (int i = 0; i<list.length; i++)
  {
    newArr[i] = int(list[i]);
  }
  return newArr;
}

void draw() {
}
