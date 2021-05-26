boolean rotateRight, rotateLeft, zoomOut, zoomIn, lightUp, lightDown, pause, shaderOff;
PVector posCam;
float camMov, z, x, light;
PImage ballTexture;
PShape ball;
PShader sh;

PShape sun, mercury, venus, earth, mars, moon, jupiter, saturno, ganimedes, calisto, urano, pluton, neptuno;

float generalAngle;


PImage sunImage, mercuryImage, venusImage, earthImage, moonImage, jupiterImage, marsImage, galaxia, saturnImage, ganimedesImage, calistoImage, uranoImage, plutonImage, neptunoImage;



void setup() {
  //fullScreen(P3D);
  size(920,600,P3D);
  x = width/2.0;
  z = width;
  light = x;
  camMov=0;
  posCam = new PVector(width/2, height/2-180, -width/2);
  pause = true;
  sunImage=loadImage("./images/sol.png");
  mercuryImage = loadImage("./images/mercurio.png");
  venusImage = loadImage("./images/venus.png");
  earthImage = loadImage("./images/tierra.png");
  moonImage = loadImage("./images/luna.png");
  marsImage = loadImage("./images/marte.png");
  jupiterImage = loadImage("./images/jupiter.png");
  saturnImage = loadImage("./images/saturno.png");
  ganimedesImage = loadImage("./images/ganimedes.png");
  calistoImage = loadImage("./images/calisto.png");
  uranoImage = loadImage("./images/urano.png");
  plutonImage = loadImage("./images/pluton.png");
  neptunoImage = loadImage("./images/neptuno.png");
  drawSolarSystem();
  shaderOff = false;
  sh = loadShader("./shader/ColoreaInput.glsl");
}

void draw() {
  setCamera();
  if (pause) showLegend();
  else {
    background(50);
    lightControl();
    setLight();
    cameraControl();
    drawBalls();
  }
}

void drawSolarSystem() {

  beginShape();

  sun = createShape(SPHERE, 60);
  sun.setStroke(255);
  sun.setTexture(sunImage);

  earth = createShape(SPHERE, 60);
  earth.setStroke(255);
  earth.setTexture(earthImage);

  mercury = createShape(SPHERE, 60);
  mercury.setStroke(255);
  mercury.setTexture(mercuryImage);

  venus = createShape(SPHERE, 60);
  venus.setStroke(255);
  venus.setTexture(venusImage);

  moon = createShape(SPHERE, 15);
  moon.setStroke(255);
  moon.setTexture(moonImage);

  ganimedes = createShape(SPHERE, 15);
  ganimedes.setStroke(255);
  ganimedes.setTexture(ganimedesImage);
  
  calisto = createShape(SPHERE, 15);
  calisto.setStroke(255);
  calisto.setTexture(calistoImage);
  
  jupiter = createShape(SPHERE, 60);
  jupiter.setStroke(255);
  jupiter.setTexture(jupiterImage);

  mars = createShape(SPHERE, 60);
  mars.setStroke(255);
  mars.setTexture(marsImage);

  saturno = createShape(SPHERE, 60);
  saturno.setStroke(255);
  saturno.setTexture(saturnImage);
  
  urano = createShape(SPHERE, 60);
  urano.setStroke(255);
  urano.setTexture(uranoImage);
  
  pluton = createShape(SPHERE, 60);
  pluton.setStroke(255);
  pluton.setTexture(plutonImage);
  
  neptuno = createShape(SPHERE, 60);
  neptuno.setStroke(255);
  neptuno.setTexture(neptunoImage);
  
  endShape();
}

void showLegend() {
  background(255);
  fill(0);

  textAlign(CENTER, CENTER);

  background(255);
  fill(0);

  textAlign(CENTER, CENTER);

  textFont(createFont("Arial", 30));
  text("ACTIVAR O DESACTIVAR SHADER", width/2, height/2 - 160);
  text("MODIFICAR ILUMINACIÓN SHADER", width/2, height/2);
  text("ENTER - Start/Pause", width/2, height/2 + 160);

  textFont(createFont("Arial", 24));
  text("CLICK MOUSE", width/2, height/2 - 120);
  text("MOVE MOUSE", width/2, height/2 + 40);
}

void setCamera() {
  if (pause) camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  else camera(posCam.x, posCam.y, posCam.z, x, height/2.0, 75*8+20, 0, 1, 0);
}

void lightControl() {
  if (lightUp) light = (light < 5000)? light+40 : 5000;
  if (lightDown) light = (light > -5000)? light-40 : -5000;
}

void setLight() {
  if (shaderOff) {
    shader(sh);
    sh.set("u_resolution", float(width), float(height));
    sh.set("u_time", float(millis())/float(1000));
  } else {
    float dirY = (mouseY / float(height) - 0.5) * 6;
    float dirX = (mouseX / float(width) - 0.5) * 6;
    directionalLight(240, 240, 240, -dirX, -dirY, -1); 
  }
}

void cameraControl() {
  if (rotateRight) {
    camMov--;
    camMov %= 360;
  }
  if (rotateLeft) {
    camMov++;
    camMov %= 360;
  }
  if (zoomOut) {
    if (posCam.sub(new PVector(0, 0, 5)).z<-width)posCam.z=width;
    posCam.sub(new PVector(0, 0, 5));
  }
  if (zoomIn) {
    if (posCam.add(new PVector(0, 0, 5)).z>width)posCam.z=-width;
    posCam.add(new PVector(0, 0, 5));
  }

  x = (width/2.0)*(1 + sin(radians(camMov)));
  z = -(width/2.0)*(1 + cos(radians(camMov)));
}

void drawBalls() {

  noStroke();
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(radians(generalAngle));
  generalAngle=(generalAngle%360)+0.2;
  shape(mercury);
  popMatrix();

 
  pushMatrix();
  translate(width/2+75, height/2, 75*2+20);
  rotateY(radians(generalAngle));
  generalAngle=(generalAngle%360)+0.2;
  shape(venus);

  popMatrix();

  
  pushMatrix();
  translate(width/2-75*2, height/2, 75*4+20);
  rotateY(radians(generalAngle));
  generalAngle=(generalAngle%360)+0.2;
  shape(jupiter);
  popMatrix();

  pushMatrix();
  translate(width/2+75, height/2, 75*6+20);
  rotateY(radians(generalAngle));
  generalAngle=(generalAngle%360)+0.2;
  shape(urano); 
  popMatrix();

  
  pushMatrix();
  translate(width/2-75, height/2, 75*6+20);
  rotateY(radians(generalAngle));
  generalAngle=(generalAngle%360)+0.2;
  shape(saturno);
  popMatrix();

  //Centro
  pushMatrix();
  translate(width/2, height/2, 75*4+20);
  rotateY(radians(generalAngle));
  shape(sun);
  generalAngle=(generalAngle%360)+0.2;
  popMatrix();


  pushMatrix();
  translate(width/2-75, height/2, 75*2+20);
  rotateY(radians(generalAngle));
  generalAngle=(generalAngle%360)+0.2;
  shape(earth);
  
  rotateY(radians(generalAngle));
  translate(90, 0);
  shape(moon);
  generalAngle=(generalAngle%360)+0.2;
  popMatrix();

  pushMatrix();
  translate(width/2+75*2, height/2, 75*4+20);
  rotateY(radians(generalAngle));
  generalAngle=(generalAngle%360)+0.2;
  shape(mars);
  popMatrix();

  //ultimo izquierda
  pushMatrix();
  translate(width/2+75*3, height/2, 75*6+20);
  rotateY(radians(generalAngle));
  generalAngle=(generalAngle%360)+0.2;
  shape(saturno);
  popMatrix();

  //ultimo derecha
  pushMatrix();
  translate(width/2-75*3, height/2, 75*6+20);
  rotateY(radians(generalAngle));
  generalAngle=(generalAngle%360)+0.2;
  shape(pluton);
  popMatrix();

  
}

void keyPressed() {
  if (keyCode == ENTER) pause=!pause;
}

void mousePressed() {
  if (!pause) shaderOff = !shaderOff;
}
