PrintWriter output;
int rows;
int columns;
int[] data;
int[] otherStuff;
color [] img;
Table OGdata;
Table OGotherStuff;

void setup()
{
  String[] OGdata = loadStrings("test1.txt");
  String[] OGotherStuff = loadStrings("test2.txt");
  //OGdata = loadTable("test1.txt"); //you have to do things as a table
  //OGotherStuff = loadTable("test2.csv");
  //println(OGdata);

  output = createWriter("decodedNums.csv");

  //THE BIG LUMP OF CODE RELATED TO TURNING THINGS INTO ARRAYS THAT I DONT NEED
  //fuq i do neeed this
  otherStuff = new int[OGotherStuff.length];
  for (int i=0; i<OGotherStuff.length; i++)
  {
    otherStuff[i] = Integer.parseInt(OGotherStuff[i]);
  }
  data = new int[OGdata.length];
  for (int i=0; i<OGdata.length; i++)
  {
    data[i] = Integer.parseInt(OGdata[i]);
  }

  img = new color [(3*OGdata.length)+OGotherStuff.length+5];
  rows = ((2*OGdata.length)+OGotherStuff.length+5/(2*OGdata.length)+OGotherStuff.length+5)+1;
  columns = rows+1;
  size(300, 300);

  getPixelValues(OGdata, data);
  getPixelValues(OGotherStuff, otherStuff);
  for (int i=0; i<OGotherStuff.length; i+=3)
  {
    img[i]=color(data[i], data[i+1], data[i+2]);
  }

  for (int i=0; i<OGdata.length; i+=3)
  {
    img[i]=color(data[i], data[i+1], data[i+2]);
  }
}

void getPixelValues(String[] arr, int[] newArr)
{
  for (int i = 0; i<arr.length; i++)
  {
    newArr[i] = int(arr[i]);
  }
  print(newArr);
  return;
}



void draw()
{
  drawer();
  decoder();
}

void drawer()
{
  int counter = 0;
  for (int i=0; i<height; i++)
  {
    for (int j=0; j<width; j++)
    {
      if (counter<img.length)
      {
        set(j, i, img[counter]);
        counter++;
      } else
      {
        set(j, i, color(0, random(0, 255), random(0, 255)));
      }
    }
  }
}

//int i=0; //the key and other stuff (whatever that is)
//for (i=0; i<otherStuff.length; i++)
//{
//  set(i,i, img[i]);
//}
//int j = 0; //5 "black" placeholders
//for (j=i+1; j<i+1+5; j++)
//{
//  pixels[j] = color(0, random(1, 255), random (1, 255));
//}
//int k = 0; //encoded message
//for (k=j+1; k<data.length; k++) 
//{
//  pixels[k] = img [k];
//}
//int l = 0;
//for (l=k+1; l<rows*columns; l++)
//{
//  pixels[l] = color(0, random(1, 255), random (1, 255));
//}
// save("hackImage.jpg");


void decoder()
{
  for (int i=0; i<height; i++)
  {
    for (int j=0; j<width; j++)
    {
      output.println(get(j, i)); //idk how to make a csv file
      output.close();
    }
  }
}
