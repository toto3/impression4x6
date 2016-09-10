
//Debut : 9 sept 2016

//http://fr.wikipedia.org/wiki/Image_num%C3%A9rique#Images_.C3.A0_palettes.2C_images_en_256_couleurs_.288_bits.29


//Plan de travail pour le système d'impression des codes 4x6 de GM:

//-Construire un prototype en processing 

//-pouvoir selectionner le fichier de code selon l'année.
//FAIT-pouvoir redimentionner l'affichage (ajustement horisontal)
//-pouvoir essayer des configuration de Hue et saturation
//-pouvoir ajuster la grosseur des pixel selon la résolution et le nombre de pixel par année(fichier par an)
//FAIT-pouvoir sauvegarde en fichier jpg ou tif sans compression


//Phase1 :
//Prototype en Processing avec données dans  fichier txt




//http://processingjs.org/reference/font/
String[] dataMatice;
int longeur=10;
int nbLignes=100;
int tt=1;
int j=0;
int offsetX=120;
int offsetY=0;


boolean tuggle=false;
boolean bloke=false;

void setup() {
  size(1200, 668);
  surface.setResizable(true);
  //dataMatice= loadStrings("pascaltext.txt");
  dataMatice= loadStrings("01_codebinaire_2013.txt");
  //noStroke();

  background(120);
}

void draw() 
{
  if (bloke==false)
  {nbLignes=mouseX+1;}


  //longeur=20;
  //  nbLignes=27;
println(nbLignes+" lon:"+longeur);
  background(120);
  for (int i=0; i<dataMatice.length; i++)
  {
    textSize(longeur /2);
  
    //text(str(i), (1*longeur), (1+((i+1)*longeur)-(longeur+(longeur/2)))  );//350
    //text(dataMatice[i*1], (2*longeur),  (1+((i+1)*longeur)-(longeur+(longeur/2)))  );//350
    color rrr = color(  decodeCouleur(dataMatice[i]), decodeCouleur(dataMatice[i]), decodeCouleur(dataMatice[i]));
    if (!tuggle)  colorMode(RGB, 255);
    if (tuggle) colorMode(HSB, tt, 255, 255);//1024
    fill(rrr);
    if (i % nbLignes == 0)
    {
      j=1; 
    }
    rect(((j-1)*longeur), ((i/(nbLignes))*longeur), longeur, longeur);  // Draw gray rect using CENTER mode

    j++;
  }
}






//retourne un int de 0..255
//selon un input : 10101011
int decodeCouleur(String mot)
{
  int p1, p2, p3, p4, p5, p6, p7, p8;
  p8=int(mot.substring(0, 1))*128;
  p7=int(mot.substring(1, 2))*64;
  p6=int(mot.substring(2, 3))*32;
  p5=int(mot.substring(3, 4))*16;
  p4=int(mot.substring(4, 5))*8;
  p3=int(mot.substring(5, 6))*4;
  p2=int(mot.substring(6, 7))*2;
  p1=int(mot.substring(7, 8));
  return p8+p7+p6+p5+p4+p3+p2+p1;
}


void keyPressed() {
  if ((key=='A')||(key=='a'))
  {
     bloke=true;
   longeur=20;
   nbLignes=27;
   surface.setSize(540,360);

 }
 
   if ((key=='B')||(key=='b'))
  {
     bloke=true;
   longeur=20;
   nbLignes=18;
   surface.setSize(360,540);
  
 }
 
  if ((key=='W')||(key=='w'))
  {
   stroke(0); 
 }
   if ((key=='E')||(key=='e'))
  {
   noStroke();  
 }
 
  if ((key=='s')||(key=='S'))
  {
      bloke=false; 
   saveFrame("image.tif");//modif Pascal
 }
  
  if (key == CODED) {
    if (keyCode == UP) {
      longeur=longeur+2;
    } else if (keyCode == DOWN) {
      longeur=longeur-2;
    }
  } else {
  }


  if (longeur>100) longeur=100;
  if (longeur<5) longeur=5;


  if (key == CODED) {
    if (keyCode == LEFT) {
      tt=tt+2;
    } else if (keyCode == RIGHT) {
      tt=tt-2;
      
    
    }
  } else {
  }
  if (tt<5) tt=5;
  if (tt>1024) tt=1024;




  if (key == CODED) {
    if (keyCode == SHIFT) {
      tuggle=false;
    } else if (keyCode ==  CONTROL) {
      tuggle=true;
    }
  } else {
  }
  

}