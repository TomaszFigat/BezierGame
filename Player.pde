public class Player{    //Klasa gracz ktora przedstawia kwadrat ktorym sie poruszamy
  private float x;    //    wpolrzedne 
  private float y;    //     gracza
  private int move;    //  predkosc gracza
  private float size;  
  boolean left;
  boolean right;      // booleany sprawdzajace czy ruch w danym kierunku jest mozliwy czy tez nie
  boolean up;
  boolean down;
  int tries=0;      // zmienna przechowujaca liczbe prob
  public Player(int x,int y, int move,int size)      //konstruktor
  
  {
   this.x=x;
   this.y=y;
   this.move=move;
   this.size=20;
  }
  public Player(int x,int y)    // konstruktor delegujacy
  {
   this(x,y,2,20);
   
  }
  public float[] corners()        // metoda zwracaja wspolrzedne wierzcholkow gracza
  {
     float arrPosPl[]={x,y,x+this.size,y,x,y+this.size,x+this.size,y+this.size};
  return arrPosPl;  
}
 public void moveRight(){      //metody odopwiadajace za ruch naszego gracza
   
    
     this.x+=move;
   
 }
 public void moveLeft(){
  
     this.x+=-move;
   
 }
   public void moveUp(){
     
    
     this.y+=-move;
   
 }
   public void moveDown(){
   
     this.y+=move;
   
 }
 public void display(){        //metoda wyswietlajaca naszego gracza
   fill(0,0,255,255);
   rect(x,y,size,size);
   }

public void collisionMap(float mapX,float mapY, float sizeX, float sizeY)      // metoda nie pozwalajaca graczowi wyjechac poza mape
 {

    if(!(mapX<this.x))
      this.left=false;
    else
      this.left=true;
    if(!(mapY<this.y))
      this.up=false;
    else
     this.up=true;
    if(!(mapY+sizeY>this.y+this.size))
      this.down=false;
    else
      this.down=true;
    if(!(mapX+sizeX>this.x+this.size))
      this.right=false;
    else
      this.right=true;
   
  }
  void collision(Obstacle ob,float startX,float startY)   // metoda odpowiedzialna za sprawdzanie czy nastepuje kolizja gracza z przeszkoda
{
  float []arrPosPl=corners();
 int crt=2;   // wspolczynnik korygujacy
    for(int i=0;i<arrPosPl.length;i+=2){
 if(((ob.x+crt<arrPosPl[i])&&(ob.x+ob.size-crt>arrPosPl[i]))&&
   ((ob.y+crt<arrPosPl[i+1])&&(ob.y+ob.size-crt>arrPosPl[i+1]))){
   ++tries;
  restart(startX,startY);
    }
  }
}
  void restart(float startX,float startY)    //metoda rastartujaca pozycje gracz
{
 // delay(1200);
 player.x=startX;
  player.y=startY; 
}
int win(float winX, float winY, float winSize, int level)    //metoda sprawdzajaca czy gracz 
{                                                            //doszedl do zielonego zwycieskiego pola
  float []arrPosPl=corners();
 int crt=5;   // wspolczynnik korygujacy
    for(int i=0;i<arrPosPl.length;i+=2){
 if(((winX+crt<arrPosPl[i])&&(winX+winSize-crt>arrPosPl[i]))&&
   ((winY+crt<arrPosPl[i+1])&&(winY+winSize-crt>arrPosPl[i+1]))){
   
     return ++level;
    
   
 }
 
}
return level;
 }
}
