class player{
  float posx;
  float posy;
  float vel;
  float posini;
  float g = 0;
  float tam  = 30;
  boolean cjump;
  
  Perceptron p;
 
  player(int x, int y){
    this.posx = x;
    this.posy = y;
    this.posini = y;
    this.vel = 0;
    this.cjump = true;
    p = new Perceptron(2, 0.1);
  }
  
  void jump(){
    if(cjump){
      this.g = -15;
      this.cjump = false;
    }
  }
  
  void act(){
    this.posy = this.posy + this.g;
    if(this.posy >= this.posini){
      this.posy = this.posini;
      this.g = 0;
      this.cjump = true;
    }else{
      this.g+=1;
    }
  }
  
  void show(){
    fill(250);
    noStroke();
    rect(this.posx, this.posy - this.tam, this.tam, this.tam);
  }
  
  boolean pred(float inp[]){
    if(this.p.predict(inp) == 1){
      this.jump();
      return true;
    }
    return false;
  }
  
  void mutate(){
    this.p.mutate();
  }
}
