class obs {
  float tam;
  float posx;
  float posy;
  float vel;

  obs(int y) {
    this.posy = y;
    this.tam = int(random(20, 30));
    this.posx = width;
    this.vel = random(5, 7);
  }

  void show() {
    fill(100);
    noStroke();
    rect(this.posx, this.posy - this.tam, this.tam, this.tam);
  }

  void act() {
    this.posx -= this.vel;
  }
}
