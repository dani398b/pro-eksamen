int manB = 0;
int manH = 0;
boolean click = false;
int _q;
int _w;
int up;

void upgrade(int sted) {
  image(wood1, 100, 100);
  for (int i = 0; i < 5; i++) {
    image(lilleKnap, 125, 50 + ((i+1)*70));
    fill(255);
    text(i + 1, 145, 150+i*70);
    fill(0);
    text("Køb upgrade", 180, 150+i*70);
  }
  fill(255);
  image(knap, 200, 475);
  textAlign(CENTER);
  textSize(40);
  if (bygning[sted -1] == 1 || bygning[sted-1] == 5) {
    text("Arbejder", 350, 535);
  } else if (bygning[sted - 1] == 2|| bygning[sted - 1] == 3 || bygning[sted - 1] ==4) {
    text("Beboer", 350, 535);
  } else if (bygning[sted -1] == 6) {
    text("Fanger", 350, 535);
  }
}

void kobUp(int x, int y) {
  for (int i = 0; i < 5; i++) {
    if (x >=125 && x <= 175 && y >= 125 + i *70 && y <= 175 + i*70) {
      image(lilleKnap, 125, 50 + ((i+1)*70));
      upgrade = true;
      upPop = false;
      up = i;
    }
  }
}

void kobUpS(int sted) {
  image(wood3, 100, 100);
  if (bygning[sted-1] == 1) {
    textAlign(CENTER);
    textSize(40);
    text("Køb upgrade smed", 350, 150);
    textAlign(CORNER);
    textSize(25);
    text("Pris: " + (up + 1) * 1500, 120, 200);
    if (up == 4) {
      text("Plads til to extra medarbejdere: ", 120, 250);
    } else {
      text("Plads til en extra medarbejder: ", 120, 250);
    }
    text("Start omsætning øges \nmed 0,5 pr. sekund: ", 120, 300);
  }

  image(knap, 200, 475);
  textAlign(CENTER);
  textSize(40);
}

void beboer(int sted) {
  image(wood3, 100, 100);
  knapper(4, 4);
  text("vælg dine \n   mænd", 483, 525);
  manB = 0;
  manH = 0;
  for (mennesker b : Mennesker) {
    if (b.hus == sted) {
      manB++;
      image(qu, 120*manB, 120*(manH+1), 100, 100);
      if (manB == 4) {
        manH++;
        manB = 0;
      }
    }
  }
  if (bygning[sted -1] == 1) {
    if (bygning[sted + 99] == 0) {
      for (int q = 0; q < 4; q++) {
        for (int i = 0; i < 4; i++) {
          if (q > 0) {
            if (q == 3 && i == 3) {
              break;
            }
            //image(kryds, 120 + ((i) * 120), 120 + (q * 120), 100, 100);
          }
        }
      }
    }
  }
}

void stat() {
  image(wood3, 100, 100);
  image(lilleKnap1, 400, 150, 150, 150);
  Mennesker.get(_q).display();
  image(knap, 375, 450, 200, 100);
  image(knap, 125, 450, 200, 100);
  textAlign(CENTER);
  textSize(30);
  text("Sæt i hus", 475, 505);
  text("Lav barn", 225, 505);
}

void statClick(int x, int y, int sted) {
  int[] num = new int[100];
  int p = 0;
  if (maend == true) {
    for (mennesker b : Mennesker) {
      if (b.hus == 0) {
        num[p] = b.nummer;
        p++;
      }
    }
  } else {
    for (mennesker b : Mennesker) {
      if (b.hus == sted) {
        num[p] = b.nummer;
        p++;
      }
    }
  }
  for (int i = 0; i < 4; i++) {
    for (int q = 0; q < 3; q++) {
      if (x >= 120 * (i+1) && x <= 120 * (i+1) + 100 && y >= 120 * (q + 1)  && y <= 120 * (q + 1)  + 100) {
        _q = num[((q*4)+i)];
        click = true;
        stat = true;
        beboer = false;
      }
    }
  }
}

void knapper(int w, int o) {
  for (int q = 0; q < w; q++) {
    for (int i = 0; i < o; i++) {
      image(lilleKnap1, 120 + ((i) * 120), 120 + (q * 120), 100, 100);
    }
  }
}

void plads() {
  image(wood3, 100, 100); 
  image(wood3, 100, 100);
  knapper(3, 4);
  image(left, 200, 500);
  image(right, 400, 500);

  manB = 0;
  manH = 0;
  for (mennesker b : Mennesker) {
    if (b.hus == 0) {
      manB++;
      image(qu, 120*manB, 120*(manH+1), 100, 100);
      if (manB == 4) {
        manH++; 
        manB = 0;
      }
    }
  }
}

void pladsClick(int x, int y, int sted) {
  for (int i = 0; i < 4; i++) {
    for (int q = 0; q < 3; q++) {
      if (x >= 120 * (i+1) && x <= 120 * (i+1) + 100 && y >= 120 * (q+1)  && y <= 120 * (q+1)  + 100) {
        _w = Mennesker.get((q*4)+i).nummer;
        click = true;
        beboer = false;
        pop = false;
        ingenPenge = false;
        kobPop = false;
        upPop = false;
        dineMaend = false;
        stat = false;
        maend = false;
        plads = false;
        lukClick();
        Mennesker.add(new mennesker(Mennesker.get(_q), Mennesker.get(_w)));
      }
    }
  }
}

void setHus(int sted) {
  boolean ikkePlads = false;
  for (int i = 0; i < 10; i++) {
    if (bygning[sted - 1] == i) { 
      tjekPlads(sted, i);
      ikkePlads = true;
    } else if(ikkePlads == true) {
      ikkePlads = true;
    }
    set = false;
  }
}

void tjekPlads(int sted, int husHer) {
  int i = 0;
  if (bygning[sted - 1] == husHer) {
    for (mennesker b : Mennesker) {
      if (b.hus == sted) {
        i++;
      }
    }
    if (i < 4) {
      Mennesker.get(_q).hus = sted;
    } else{
      ikkePlads = true; 
    }
  }
}

void ikkeNokPlads() {
  image(wood3, 100, 100);
  textAlign(CENTER);
  fill(0);
  textSize(50);
  text("Ikke mere plads",350,200);
  
  image(knap,200,500);
}
