  Player player =new Player(25, 25);      //tworzenie obiektu gracz oraz mapy
  Tutorial tutorial =new Tutorial();       // dzialanie poszczegolnych metod opisane jest w klasach   
           
                                        //Niestety nie wiem dlaczego w processingu nie dzialaja zmienne oraz metody STATYCZNE!!!!!!!!
                                        //Zmienilo to moja koncepcje dlatego te przeszkody sa tworzone tutaj w mainie jedna po drugiej
                                        // Niestety nie mozna bylo z nich zrobic np tablicy (tablica obiektow typu Obstacle) z roznymi 
                                        //wspolrzednymi gdyz pojawial sie nullPionterException, mimo ze obiekt nie byl rowny NULL byl 
                                        //normalnie tworzony przez konstruktor niestety nie udalo mi sie rozwiazac tego problemu przez
                                        // co musialem tworzyc obiekty w mainie.
  // poziom 1
  Obstacle obstacle =new Obstacle(280, 310);
  Obstacle obstacle1 =new Obstacle(380, 310);      //  Tworzenie przeszkod do poziomu 1
  Obstacle obstacle2 =new Obstacle(480, 310);       
  Obstacle obstacle3 =new Obstacle(580, 310);
  Obstacle obstacle4 =new Obstacle(680, 310);
  Obstacle obstacle5 =new Obstacle(280, 410);
  Obstacle obstacle6 =new Obstacle(380, 410);
  Obstacle obstacle7 =new Obstacle(480, 410);
  Obstacle obstacle8 =new Obstacle(580, 410);
  Obstacle obstacle9 =new Obstacle(680, 410);
  Obstacle obstacle10 =new Obstacle(340, 360);
  Obstacle obstacle11 =new Obstacle(540, 265);
  Obstacle obstacle12 =new Obstacle(540, 455);
  // poziom 2
  Bezier bezier =new Bezier(390, 230, 230, 390, 260, 310, 430, 470, 1);
  Bezier bezier1 =new Bezier(211,467,661,809,365,248,533,405,1);              //Tworzenie krzywych Beziera oraz 
  Bezier bezier2 =new Bezier(316,357,626,762,302,471,553,313,-1);             // oraz przeszkod do poziomu 2
  Bezier bezier3 =new Bezier(455,391,756,763,486,231,230,496,-1);
  Obstacle obstBez =new Obstacle(1, 1, true);
  Obstacle obstBez1 =new Obstacle(1, 1, true);
  Obstacle obstBez2 =new Obstacle(1, 1, true);
  Obstacle obstBez3 =new Obstacle(1, 1, true);
  Obstacle obstacle13 = new Obstacle(640,360);
  Obstacle obstacle14 = new Obstacle(540,360);
  
  void setup() {
    size(1000, 800); //rozmiar okna
    background(100);
  }
  
  boolean lv1=true;
  boolean lv2=true;
  boolean options=false;
  boolean speedUp=false;
  boolean speedDown=false;    //Zmienne sluzace do zmiany lvl
  boolean directory=false;    // oraz zmienne wlaczajace opcje w grze
  boolean onlyB=false;
  int level=0;
  int counter=0;
  
  
  void draw() {
    if(level!=2){   //  if(level..) sa to warunki w zaleznosci od lvl w funkcji draw pokazuja sie te przeszkody oraz napisy ktore maja sie pokazac
    background(150);
    tutorial.mapCreator();
    player.collisionMap(tutorial.mapX, tutorial.mapY, tutorial.sizeX, tutorial.sizeY);     
    player.display();
    }
    if (lv1) {
      player.restart(tutorial.startX, tutorial.startY);
      lv1=false;
    }
    if (level==0) {
      textSize(24);
      fill(255);
      text("Witaj w Tutorialu! Aby przejść do kolejnego poziomu nalezy przemieścić się", 50, 580);
      text("do zielonego pola, uważaj by nie zderzyć sie z przeszkodami, jeśli do tego", 50, 610);
      text("dojdzie cofniesz się do pola startowego. W prawym górnym rogu znajduję się", 50, 640);
      text("ilość Twoich prób.  POWODZENIA! (W przypadku gdy nie reagują", 50, 670);
      text("należy dwukrotnie nacisnąć LPM w oknie gry.", 50, 700);
      text("(Sterowanie strzałkami. Staraj się naciskać jedną strzałkę jednocześnie)", 50, 730);
      textSize(40);
      text("Wykorzystanie krzywych Beziera", 50, 100);
      text("na nastepnym poziomie.", 50, 150);
      textSize(70);
      text(player.tries, 900, 100);
  
      obstacle.startObstacle('u');                                      //urachamianie przeszkod
      player.collision(obstacle, tutorial.startX, tutorial.startY);
      obstacle1.startObstacle('u');
      player.collision(obstacle1, tutorial.startX, tutorial.startY);
      obstacle2.startObstacle('u');
      player.collision(obstacle2, tutorial.startX, tutorial.startY);
      obstacle3.startObstacle('u');
      player.collision(obstacle3, tutorial.startX, tutorial.startY);
      obstacle4.startObstacle('u');
      player.collision(obstacle4, tutorial.startX, tutorial.startY);
      obstacle5.startObstacle('u');
      player.collision(obstacle5, tutorial.startX, tutorial.startY);
      obstacle6.startObstacle('u');
      player.collision(obstacle6, tutorial.startX, tutorial.startY);
      obstacle7.startObstacle('u');
      player.collision(obstacle7, tutorial.startX, tutorial.startY);
      obstacle8.startObstacle('u');
      player.collision(obstacle8, tutorial.startX, tutorial.startY);
      obstacle9.startObstacle('u');
      player.collision(obstacle9, tutorial.startX, tutorial.startY);
      obstacle10.startObstacle('s');
      player.collision(obstacle10, tutorial.startX, tutorial.startY);
      obstacle11.startObstacle('s');
      player.collision(obstacle11, tutorial.startX, tutorial.startY);
      obstacle12.startObstacle('s');
      player.collision(obstacle12, tutorial.startX, tutorial.startY);
      level=player.win(tutorial.winX, tutorial.winY, tutorial.winSize, level);
    }
    if (level==1)
    { 
      if (lv2) {
        textSize(100);
        text("GRATULACJE!", 150, 200);
        textSize(60);
        text("UKOŃCZYŁEŚ PIERWSZY POZIOM!", 30, 610);
        counter++;
        player.tries=0;
        if (counter>=200) {
          player.restart(tutorial.startX, tutorial.startY);
          lv2=false;
        }
      } else {
  
  
  
        fill(255);
        textSize(70);
        text(player.tries, 900, 100);
        textSize(50);
        text("Wciśnij 'o' żeby otworzyć opcje.", 50, 70);
  
        bezier.drawBezier();
        obstBez.movementBezier(bezier.bezPointX(), bezier.bezPointY());
        obstBez.display();
        player.collision(obstBez, tutorial.startX, tutorial.startY);
  
        bezier1.drawBezier();
        obstBez1.movementBezier(bezier1.bezPointX(), bezier1.bezPointY());
        obstBez1.display();
        player.collision(obstBez1, tutorial.startX, tutorial.startY);
        
        bezier2.drawBezier();
        obstBez2.movementBezier(bezier2.bezPointX(), bezier2.bezPointY());
        obstBez2.display();
        player.collision(obstBez2, tutorial.startX, tutorial.startY);
  
        bezier3.drawBezier();
       obstBez3.movementBezier(bezier3.bezPointX(), bezier3.bezPointY());
        obstBez3.display();
        player.collision(obstBez3, tutorial.startX, tutorial.startY);
        
        if(!onlyB){    //warunek czy w poziomie drugim maja byc same krzywe beziera
         obstacle11.startObstacle('s');
      player.collision(obstacle11, tutorial.startX, tutorial.startY);
      obstacle12.startObstacle('s');
      player.collision(obstacle12, tutorial.startX, tutorial.startY);
       obstacle5.startObstacle('u');
      player.collision(obstacle5, tutorial.startX, tutorial.startY);
      obstacle4.startObstacle('u');
      player.collision(obstacle4, tutorial.startX, tutorial.startY);
        obstacle9.startObstacle('u');
      player.collision(obstacle9, tutorial.startX, tutorial.startY);
      obstacle14.startObstacle('s');
      player.collision(obstacle14, tutorial.startX, tutorial.startY);
        }
        if (options)        // jesli warunek options==true to pokazuja sie opce w tym ifie sa pokazane jakie
        {textSize(30);
        fill(0,255,0,255);
          text("Teraz możesz konfigurować krzywe Beziera!", 30, 110);
          text("Za pomocą myszki zmieniasz położenie wierzchołków wieloboku.", 30, 145);
          text("Wspolrzedne przesuwanych punktow wyswietlaja sie w konsoli", 30, 180);
          text("(Wciśnij ponownie 'o' żeby wyłączyć menu opcji)", 30, 215);
          text("'u' - przyspieszenie",50,580);
          text("'i' - spowolnienie",50,650);
          text("'p' - zmiana kierunku ruchu",500,580);
          text("'y' - zostaw same krzywe Beziera",500,650);
            bezier.strokeValue=1;
            bezier.colorValue=255;
            bezier1.strokeValue=1;
            bezier1.colorValue=255;
            bezier2.strokeValue=1;
            bezier2.colorValue=255;
            bezier3.strokeValue=1;
            bezier3.colorValue=255;
          if (speedUp)      //przyspieszneie
              {
                
                bezier.v+=0.002;
                bezier1.v+=0.002;
                bezier2.v+=0.002;
                bezier3.v+=0.002;
                speedUp=false;
              }
              if (speedDown)      //spowolnienie
              {
                bezier.v-=0.002;
                bezier1.v-=0.002;
                bezier2.v-=0.002;
                bezier3.v-=0.002;
                speedDown=false;
              }
              if(directory)      //zmiana kierunku ruchu
              {
               if(bezier.dir==1)
               bezier.dir=-1;
               else
               bezier.dir=1;
               if(bezier1.dir==1)
               bezier1.dir=-1;
               else
               bezier1.dir=1;
               if(bezier2.dir==1)
               bezier2.dir=-1;
               else
               bezier2.dir=1;
               if(bezier3.dir==1)
               bezier3.dir=-1;
               else
               bezier3.dir=1;
               
               directory=false;
              }
              
          for (int i=0; i<bezier.pts; i++) {
            if (bezier.Przesuniecie[i]) {  
              bezier.x[i] = mouseX;
              bezier.y[i] = mouseY;
              println(bezier.x[i]+" "+bezier.y[i]);
  
            }
          }
          for (int i=0; i<bezier1.pts; i++) {
            if (bezier1.Przesuniecie[i]) {  
              bezier1.x[i] = mouseX;
              bezier1.y[i] = mouseY;
              println(bezier1.x[i]+" "+bezier1.y[i]);
  
            }
          }
           for (int i=0; i<bezier2.pts; i++) {
            if (bezier2.Przesuniecie[i]) {  
              bezier2.x[i] = mouseX;
              bezier2.y[i] = mouseY;
              println(bezier2.x[i]+" "+bezier2.y[i]);
  
            }
          }
           for (int i=0; i<bezier3.pts; i++) {
            if (bezier3.Przesuniecie[i]) {  
              bezier3.x[i] = mouseX;
              bezier3.y[i] = mouseY;
              println(bezier3.x[i]+" "+bezier3.y[i]);
  
            }
          }
        }
        else
        
        {
          bezier.strokeValue=0;
          bezier.colorValue=0;
          bezier1.strokeValue=0;
          bezier1.colorValue=0;
          bezier2.strokeValue=0;
          bezier2.colorValue=0;
          bezier3.strokeValue=0;
          bezier3.colorValue=0;
        }
        
  
  
  level=player.win(tutorial.winX, tutorial.winY, tutorial.winSize, level);
      }
    }
  
    
    if(level==2)
    {
      textSize(100);
        text("GRATULACJE!", 150, 200);
        textSize(90);
        text("KONIEC GRY!", 200, 610);
      
    }
    
    if (keyPressed) {                //Poruszanie sie pionka jednoczesnie jego blokowanie w danym kierunku
          if (keyCode==UP&&player.up)
            player.moveUp();
          if (keyCode==DOWN&&player.down)
            player.moveDown();
          if (keyCode==LEFT&&player.left)
            player.moveLeft();
          if (keyCode==RIGHT&&player.right)
            player.moveRight();
        
      }
  }
  void keyReleased()      // funkcja sluzaca do dzialania w opcjach
  {
    if (key=='o')
      if (options)
        options=false;
      else
        options=true;
  
    if (key=='u'&& options)
    {
      speedUp=true;
    }
    if(key=='i'&& options)
    {
      speedDown=true;
    }
    if(key=='p'&&options)
    {
     directory=true; 
    }
    if(key=='y'&&options)
    {  if(onlyB)
       onlyB=false;
       else
       onlyB=true;
    }
  }
  void mousePressed() {        // zmiana wspolrzednych
    for (int i=0; i<bezier.pts; i++) {
      //sprawdzenie warunków, który punkt ma być odblokowany
      if (mouseX>=bezier.x[i]-5&&mouseX<=bezier.x[i]+ bezier.ptRozmiar +5 &&
        mouseY>=bezier.y[i]-5&&mouseY<=bezier.y[i]+ bezier.ptRozmiar +5) {
        //odblokowanie wybranego punktu
        bezier.Przesuniecie[i]=true;
      }
    }
    for (int i=0; i<bezier1.pts; i++) {
      //sprawdzenie warunków, który punkt ma być odblokowany
      if (mouseX>=bezier1.x[i]-5&&mouseX<=bezier1.x[i]+ bezier1.ptRozmiar +5 &&
        mouseY>=bezier1.y[i]-5&&mouseY<=bezier1.y[i]+ bezier1.ptRozmiar +5) {
        //odblokowanie wybranego punktu
        bezier1.Przesuniecie[i]=true;
      }
    }
    for (int i=0; i<bezier2.pts; i++) {
      //sprawdzenie warunków, który punkt ma być odblokowany
      if (mouseX>=bezier2.x[i]-5&&mouseX<=bezier2.x[i]+ bezier2.ptRozmiar +5 &&
        mouseY>=bezier2.y[i]-5&&mouseY<=bezier2.y[i]+ bezier2.ptRozmiar +5) {
        //odblokowanie wybranego punktu
        bezier2.Przesuniecie[i]=true;
      }
    }
    for (int i=0; i<bezier3.pts; i++) {
      //sprawdzenie warunków, który punkt ma być odblokowany
      if (mouseX>=bezier3.x[i]-5&&mouseX<=bezier3.x[i]+ bezier3.ptRozmiar +5 &&
        mouseY>=bezier3.y[i]-5&&mouseY<=bezier3.y[i]+ bezier3.ptRozmiar +5) {
        //odblokowanie wybranego punktu
        bezier3.Przesuniecie[i]=true;
      }
    }
  }
  //zwolnienie przycisku myszy
  void mouseReleased() {
    //zablokowanie punktu
    for (int i=0; i<bezier.pts; i++) {
      bezier.Przesuniecie[i]=false;
    }
     for (int i=0; i<bezier1.pts; i++) {
      bezier1.Przesuniecie[i]=false;
    }
    for (int i=0; i<bezier2.pts; i++) {
      bezier2.Przesuniecie[i]=false;
    }
    for (int i=0; i<bezier3.pts; i++) {
      bezier3.Przesuniecie[i]=false;
    }
  }
