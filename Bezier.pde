public class Bezier{
 int pts=4; //liczba punktów
int ptRozmiar=7; //rozmiar punktów
private float []x=new float[pts];    //tablice punktow X i Y do beziera
private float []y=new float[pts];
boolean []Przesuniecie = new boolean[pts]; //przesuwanie punktów
float u;
float bezierPointX;  //wspolrzedne punktu tworzacego krzywa Beziera wyznaczone algorytmem Casteljeu
float bezierPointY;
int strokeValue=0;  //Zmienne ktore zmieniaja kolor lini
 int colorValue=0;  //oraz jej grubosc, zmieniane w opcjach
float dir;    //kierunek dzialania krzywej beziera
float v=0.005; //predkosc krzywej beziera jest to wpolczynnik zmieniania sie paramteru u w algorytmie Casteljeu
public Bezier(float x0, float x1, float x2, float x3, float y0, float y1, float y2, float y3, float dir)    //konstruktor
{ x[0] = x0;
 x[1] = x1;
 x[2] = x2;
 x[3] = x3;
 y[0] = y0;
 y[1] = y1;
 y[2] = y2;
 y[3] = y3;
 //for(int i=0;i<pts;i++)
 //Przesuniecie [i]=false; 
 //this.v=v;
 this.dir=dir;
 if(dir==1)
 this.u=1;
 else
 this.u=0;

}
public Bezier(float dir)  //konstruktor delegujacy
{
 this(500,600,700,800,400,200,200,400,dir); 
}

void drawBezier(){        //metoda rysujaca krzywa Beziera
 stroke(0, 0, 0, this.strokeValue);
//rysowanie krzywej Beziera
if(this.dir==1){
 u=u-v;
if(u<=0)
u=1;
}
if(this.dir==-1)
{
 u=u+v;
if(1<=u)
u=0;
}
fill(0,0,0,0);
bezier (x[0], y[0],x[1], y[1], x[2], y[2], x[3], y[3]);
//rysowanie linii pomiędzy wewnętrznymi punktami kontrolnymi
////a punktami krańcowymi
//strokeWeight(this.strokeValue);
strokeWeight(this.strokeValue);
if(this.strokeValue>0)
stroke(this.strokeValue);

fill(150); //kolor linii - czerwony
line(x[0],y[0],x[1],y[1]);
line(x[1],y[1],x[2],y[2]);
line(x[2],y[2],x[3],y[3]);
Casteljau(x[0],x[1],x[2],x[3],y[0],y[1],y[2],y[3]);

 
//stroke(strokeValue); //kontur punktów kontrolnych
for(int i=0;i<pts;i++){
 if (i==1 || i==2){
 //oznaczenie wewnętrznych punktów kontrolnych
 fill(0, 0, 0,this.colorValue);
 //rectMode(CENTER);
 rect(x[i],y[i],ptRozmiar, ptRozmiar); //kwadrat
 }else{
 //oznaczenie punktów krańcowych
 fill(this.colorValue,0,0,0);
 if(this.strokeValue>0)
stroke(this.strokeValue);
 ellipse(x[i], y[i], ptRozmiar, ptRozmiar); //okrąg
 }
 }
}

 public void Casteljau(float x0, float x1,float x2,float x3, float y0,float y1, float y2,float y3)  //metoda rysujaca dodatkowe proste oraz Casteljeu
{
float arr[]={x0,x1,x2,x3,y0,y1,y2,y3};
float arrL[]=new float[4];
for(int i=0;i<2;i++) {
float xTmp=u*(arr[i+1]-arr[i])+arr[i];
float xTmp1=u*(arr[i+2]-arr[i+1])+arr[i+1];
float yTmp=u*(arr[i+5]-arr[i+4])+arr[i+4];
float yTmp1=u*(arr[i+6]-arr[i+5])+arr[i+5];
if(i==0){
arrL[0]=u*(xTmp1-xTmp)+xTmp;
arrL[1]=u*(yTmp1-yTmp)+yTmp;
}
else{
 arrL[2]=u*(xTmp1-xTmp)+xTmp;
arrL[3]=u*(yTmp1-yTmp)+yTmp; 
}
line(xTmp,yTmp,xTmp1,yTmp1);
}
line(arrL[0],arrL[1],arrL[2],arrL[3]);

this.bezierPointX=u*(arrL[2]-arrL[0])+arrL[0];
this.bezierPointY=u*(arrL[3]-arrL[1])+arrL[1];
}
float bezPointX(){    //metoda zwraca wspolrzedna X krzywej skonstruowane algorytem Casteljeu, potrzebne do wyznaczenia gdzie ma byc przeszkoda
 return this.bezierPointX;
}
float bezPointY(){    //metoda zwraca wspolrzedna Y krzywej skonstruowane algorytem Casteljeu, potrzebne do wyznaczenia gdzie ma byc przeszkoda
 return this.bezierPointY;
}
}
