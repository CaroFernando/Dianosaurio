class Perceptron {
  float[] weights;
  float c;

  Perceptron(int n, float c_) {
    weights = new float[n];
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1,1); 
    }
    c = c_;
  }

  void train(float[] inputs, int desired) {
    int guess = predict(inputs);
    float error = desired - guess;
    for (int i = 0; i < weights.length; i++) {
      weights[i] += c * error * inputs[i];         
    }
  }

  int predict(float[] inputs) {
    float sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum += inputs[i]*weights[i];
    }
    return activate(sum);
  }
  
  int activate(float sum) {
    if (sum > 0) return 1;
    else return -1; 
  }
  
  float[] getWeights() {
    return weights; 
  }
  
  void mutate(){
    for(int i = 0; i < weights.length; i++){
      if(random(0,1) < 0.05) this.weights[i] += random(-0.2,0.2);
    }
  }
}
