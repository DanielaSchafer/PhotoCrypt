String[] OGdata = loadStrings("fileName.csv");
String[] OGotherStuff = loadStrings("fileName2.csv");
int[] data = new int[OGdata.length]; //honestly idk how to cast
int[] otherStuff = new int[OGotherStuff.length];
color [] img = new color [(2*data.length)+otherStuff.length+5];
int rows = (data.length/data.length)+1;
int columns = rows+1;
PrintWriter output;

int[] arr = new int[OGdata.length];

void setup()
{
  output = createWriter("decodedNums.csv");
  for (int i=0; i<img.length; i++)
  {
   img[i]=color(data[(3*i)], data[(3*i)+1], data[(3*i)+2]);
  }
}

void getPixelValues(arr, newArr) //arr is string array
{
  for(int i = 0; i<arr.length;i++)
  {
    newArr[i] = int(arr[i]);
  }
  print(newArr);
}

void draw()
{
  drawer();
  decoder();
}

void drawer()
{
  size(columns, rows);
  int i=0; //the key and other stuff (whatever that is)
  for (i=0; i<otherStuff.length; i++)
  {
    pixels[i] = img [i];
  }
  int j = 0; //5 "black" placeholders
  for (j=i+1; j<i+1+5; j++)
  {
    pixels[j] = color(0, random(1, 255), random (1, 255));
  }
  int k = 0; //encoded message
  for (k=j+1; k<data.length; k++) 
  {
    pixels[k] = img [k];
  }
  int l = 0;
  for (l=k+1; l<rows*columns; l++)
  {
    pixels[l] = color(0, random(1, 255), random (1, 255));
  }
}

void decoder()
{
  for (int i=0; i<height; i++)
  {
    for (int j=0; j<width; j++)
    {
      output.println(get(j,i)); //idk how to make a csv file
      output.close();
    }
  }
}
