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
  //String[] OGdata = loadStrings("test1.csv");
  //String[] OGotherStuff = loadStrings("test2.csv");
  OGdata = loadTable("test1.csv"); //you have to do things as a table
  OGotherStuff = loadTable("test2.csv");

  output = createWriter("decodedNums.csv");

  //THE BIG LUMP OF CODE RELATED TO TURNING THINGS INTO ARRAYS THAT I DONT NEED

  //otherStuff = new int[OGotherStuff.length];
  for (int i=0; i<OGotherStuff.getRowCount(); i++)
  {
    for (int j=0; j<3; j++)
    {
      String oldOGotherStuff = OGotherStuff.getString(i,j);
      OGotherStuff.setInt(i,j,Integer.parseInt(oldOGotherStuff));
    }
  }
  //data = new int[OGdata.length];
  for (int i=0; i<OGdata.getRowCount(); i++)
  {
    for (int j=0; j<3; j++)
    {
     String oldOGdata = OGdata.getString(i,j);
      OGdata.setInt(i,j,Integer.parseInt(oldOGdata));
    }
  }

  img = new color [(2*OGdata.getRowCount())+OGotherStuff.getRowCount()+5];
  rows = ((2*OGdata.getRowCount())+OGotherStuff.getRowCount()+5/(2*OGdata.getRowCount())+OGotherStuff.getRowCount()+5)+1;
  columns = rows+1;

  //getPixelValues(OGdata, data);
  //getPixelValues(OGotherStuff, otherStuff);
  for (int i=0; i<OGotherStuff.getRowCount(); i++)
  {
    //img[i]=color(data[(3*i)], data[(3*i)+1], data[(3*i)+2]);
    img[i]=color(OGotherStuff.getInt(i, 1), OGotherStuff.getInt(i, 2), OGotherStuff.getInt(i, 3));
  }

  for (int i=0; i<OGdata.getRowCount(); i++)
  {
    //img[i]=color(data[(3*i)], data[(3*i)+1], data[(3*i)+2]);
    img[i]=color(OGdata.getInt(i, 1), OGdata.getInt(i, 2), OGdata.getInt(i, 3));
  }
}

//void getPixelValues(String[] arr, int[] newArr)
//{
//  for (int i = 0; i<arr.length; i++)
//  {
//    newArr[i] = int(arr[i]);
//  }
//  print(newArr);
//  return;
//}



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
  // save("hackImage.jpg");
}

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
