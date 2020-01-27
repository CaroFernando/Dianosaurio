obs o;
player p;
int cont = 0;
int update;
ArrayList<obs> os = new ArrayList<obs>(15);

void setup() {
  size(800, 600);
  p = new player(70, 300);
  nupdate();
}

void draw() {
  background(0);
  stroke(255);
  line(0, 300, width, 300);
  text(update + " " + cont, 20,340);
  text(frameRate, width - 50, 25);
  
  if(cont == update){
    nupdate();
    cont = 0;
    os.add(new obs(300));
  }else cont++;
  
  for(int i = 0; i < os.size(); i++){
    os.get(i).act();
    os.get(i).show();
  }
  
  for(int i = os.size() - 1; i >= 0; i--){
    if(outc(os.get(i))) os.remove(i);
  }
  
  p.act();
  p.show();
  
  if(os.size() > 0){
    float c[] = closest(p);
    
    boolean res = p.pred(c);
    text(String.valueOf(res), 20, 20);
    
    float w[] = p.p.getWeights();
    text(w[0] + "  " + w[1], 300,500);
    
    println(c[0]+"  "+c[1]);
    
  }else text("false", 20, 20);
  
  if(random(0,1) < 0.3) p.mutate();
}

void mousePressed() {
  p.jump();
}

boolean outc(obs o) {
  return o.posx < 0;
}

void nupdate(){
  update = (int)random(70,90);
}

float []closest(player p){
  float men[] = new float[2];
  men[0] = os.get(0).posx - p.posx;
  men[1] = os.get(0).vel;
  
  for(int i = 0; i < os.size(); i++){
    float ac = os.get(0).posx - p.posx;
    if(ac < men[0]){
      men[0] = ac;
      men[1] = os.get(i).vel;
    }
  }
  
  men[0] /= width;
  men[1] /= 7;
  
  return men;
}
