void clickEllers(int sted, int x,int y) {
  if (mouseX >= 476 && mouseX <= 574 && mouseY >= 478 && mouseY <= 568 && beboer == true) {
    beboer = false;
    dineMaend = true;
  } else if (mouseX >= 200 && mouseX <= 500 && mouseY >= 475 && mouseY <= 575 && upPop == true) {
    upPop = false;
    beboer = true;
  } else if (x >= 200 && x <= 500 && y >= 400 && y <= 450 && ingenPenge == true) {
    ingenPenge = false;
  } else if (kobPop == false && pop == false && bygning[sted-1] == 0) {
    kobPop = true; 
    bygning[sted-1] = 99;
  } else if (kobPop == true && pop == false &&
    x <= 600 && x >= 100 && y >= 100 && y <= 600) {
    pop = true;
    kobPop = false;
    mus1 = round((mouseY-100)/50)+1;
    // println(mus1);
    popUp(mus1);
  } else if (x <= 500 && x >= 200 && y <= 350 && y >= 250 && pop == true) {
    Penge(mus1);
    pop = false;
    kobPop = false;
  } else if (kobPop == false && pop == false && bygning[sted -1] >= 1 && bygning[sted -1] < 99) {
    upPop = true;
  } 
  if (kobPop == true || pop == true || upPop == true || beboer == true || dineMaend == true) {
    lukClick();
  }
}

void displayEllers() {
  for (int i = 0; i < bygning.length; i++) {
    if (bygning[i] != 0 && bygning[i] != 99) {
      image(byger[bygning[i]-1], ((i)%10)*70, (round(i/10))*70);
    }
  }
  if (ingenPenge == true) {
    ikkeNok();
  } 
  if (pop == true) {
    popUp(mus1);
  } else if (kobPop == true) {
    popUpKob();
  } else if (upPop == true) {
    upgrade();
  } else if (beboer == true) {
    beboer();
  } else if (dineMaend == true) {
    dinman();
  }
  if (upPop == true || kobPop == true || pop == true || beboer == true || dineMaend == true) {
    luk();
  }
}