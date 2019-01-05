String[] OGdata = loadStrings("fileName.csv");
String[] OGotherStuff = loadStrings("fileName2.csv");
Integer[] data = (Integer)String[]; //honestly idk how to cast
Integer[] otherStuff = (Integer)String[];
color [] img = new color [(1.5*data.length)+otherStuff.length+5];
int rows = (data.length/data.length)+1;
int columns = rows+1;
PrintWriter output;

void setup()
{
  output = createWriter("decodedNums.csv");
  for (int i=0; i<img.length; i++)
  {
   img = color  
  }
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
  for (i=0; i<otherStuff.size(); i++)
  {
    pixels[i] = img [i];
  }
  int j = 0; //5 "black" placeholders
  for (j=i+1; j<i+1+5; j++)
  {
    pixels[j] = color(0, random(1, 255), random (1, 255));
  }
  int k = 0; //encoded message
  for (k=j+1; k<data.size(); k++) 
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