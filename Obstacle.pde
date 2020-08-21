public class Obstacle{ // klasa przeszkoda
  float x;    //  wspolrzedne
  float y;    //  przeszkody
  private float xx;  //poczatkowe wspolrzedne
  private float yy;  //przeszkody
  private float size;  
  private int move;  //predkosc ruchu
  private int reach; //zasieg poruszania sie przeszkody
  private boolean status=true;
  boolean bezObstacle;    //zmienna ktora sie daje do kontruktora zeby stworzyc przeszkode
                          //dzialajaca na bezierze
  
  public Obstacle(float x,float y, int move, int reach,int size,boolean bezObstacle){    //konstruktor
   this.x=x;
   this.y=y;
   this.yy=y;
   this.xx=x;
   this.move=move;
   this.reach=reach;
   this.size=size;
  }
  public Obstacle(float x,float y)  //konstruktor delegujacy
  {
   this(x,y,1,50,30,false); 
  }
  public Obstacle(float x,float y, boolean bezObstacle)  //konstruktor delegujacy
  {
    this(x,y,1,50,30,bezObstacle);
  }
   void movement(char direction){    //metoda poruszajaca przeszkoda prawo/lewo albo gora/dol
    float xActual;
      float position;
     if(direction=='u')
     {
      position=this.yy;
      xActual=this.y; 
     }
      else
      {
      xActual=this.x;
      position=this.xx;
      }
     
       
     if(xActual+move<=position+this.reach*this.move&&status){
   if(direction=='u')    
   this.y+=this.move;
   else
   this.x+=this.move;
   
   if(xActual+move==position+this.reach*this.move)
   status=false;
     }

     
   if(xActual-move>=position-this.reach*this.move&&!status){
    if(direction=='u')    
   this.y-=this.move;
   else
   this.x-=this.move;
   if(xActual-move==position-this.reach*this.move)
   status=true;
   }
     
  }
 
  void movementBezier(float x, float y)    //metoda ktora zmienia wspolrzedne przeszkody na wpolrzedne punktu tworzenia krzywej
  {                                        //wedlug algorytmu Casteljeu
   this.x=x;
   this.y=y;
  }
   void display(){      //metoda wyswietlajaca przeszkode
     strokeWeight(0);
   fill(255,0,0,255);
     rect(x,y,size,size);
   
 }
void startObstacle(char direction)  //metoda dla przeszkod prostych(tj. ruszajacych sie prawo lewo)     
    {                                //ktora zaczyna ruch oraz wyswietla przeszkode
     display();
 movement(direction); 
    }
}
