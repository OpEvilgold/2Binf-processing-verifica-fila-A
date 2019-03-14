Personaggio hermione;
Trasfigurabile piuma;
Trasfigurabile colibri;
void setup() {
  fullScreen(P3D);
  hermione = new Personaggio();
  piuma = new Trasfigurabile();
  colibri = new Trasfigurabile();
  hermione.formaPersonaggio = loadShape("witch.obj");
  piuma.formaTrasf = loadShape("quill.obj");
  // piuma.formaTrasf.setFill(color(0));
  colibri.formaTrasf = loadShape("colibri.obj");
  hermione.formaPersonaggio.rotateX(radians(180));
  hermione.formaPersonaggio.setFill(#712525);
}

void draw() {
  background(#87D6FC);
  lights();

  hermione.disegnaPersonaggio();
  piuma.disegnaTrasfigurabile();
  piuma.accio();
  piuma.trasfigura();
}


class Personaggio
{
  PShape formaPersonaggio;
  float posX = width* .1, posY = height/2;
  void disegnaPersonaggio()
  {
    shape(formaPersonaggio, posX, posY);
  }
}

class Trasfigurabile
{
  PShape formaTrasf;
  int changeTrasPiuma = 255;
  int changeTrasColi = 0;
  float posX = width * .9, posY = height/2;
  void disegnaTrasfigurabile()
  {
    shape(formaTrasf, posX, posY);
  }
  void accio()
  {
    posX -= 2;
    if (posX <= width* .3 ) posX +=2;
  }
  void trasfigura()
  {
    formaTrasf.setFill(color(41, 178, 215, changeTrasPiuma));

    if (keyPressed) 
    {
      if (key == ' ')
      { 
        changeTrasPiuma -=1;
        colibri.formaTrasf.setFill(color(0, 255, 0, changeTrasColi));
        changeTrasColi +=1;
        shape(colibri.formaTrasf, posX, posY);
      }
    }
  }
}
