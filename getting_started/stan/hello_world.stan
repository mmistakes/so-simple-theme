functions {
  void helloWorld() {
    print("functions{} hello world! from any block that one can print from");
  }
}

data {
  
}

transformed data {
  print("transformed data{} hello world! once per program run");
  helloWorld(); 
} 

parameters {
  real<lower=0,upper=1> estimate_me;
}

transformed parameters {
  print("transformed parameters {} hello world! every leap frog step");
}

model { 
  print("model{} hello world! every leap frog step: estimate_me=",estimate_me);
  1 ~ bernoulli(estimate_me);
}

generated quantities {
  print("generated quantities{} per sample (not warmup) step, have to include 'estimate_me' to run: ",estimate_me);
} 
