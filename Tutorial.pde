public class Tutorial{
 Obstacle numberOfObstacles[]=new Obstacle[4];
 boolean st;
 float mapX;    //
 float mapY;    //Wpsolrzedne oraz rozmiar mapy
 float sizeX;   //
 float sizeY;  //
 float greenX;    //wspolrzedne zielonego pola startowego oraz rozmiar
 float greenY;
 float greenSize;
 float winX;    //wspolrzdne oraz rozmiar zwycieskiego zielonego pola
 float winY;
 float winSize;
 
  // boolean left;
  //boolean right;
  //boolean up;
  //boolean down;
  float startX;   //wspolrzedne poczatkowe
  float startY;
  
 void mapCreator(){    //metoda konstruujaca mape 
  
   fill(246);
  strokeWeight(0);
  this.mapX=100;
  this.mapY=250;
  this.sizeX=800;
  this.sizeY=250;
  rect(mapX,mapY,sizeX,sizeY);
  fill(0,255,0);
  this.greenSize=60;
  this.greenX=mapX+50;
  this.greenY=mapY+sizeY/2-greenSize/2;
  this.startX=this.greenX+this.greenSize/2-player.size/2;
  this.startY=this.greenY+this.greenSize/2-player.size/2;
  rect(greenX,greenY,greenSize,greenSize);
  this.winY=this.greenY;
  this.winX=this.mapX+this.sizeX-100;
  this.winSize=this.greenSize;
  rect(this.winX,this.winY,this.winSize,this.winSize);
  
   
  
 }



 


}
