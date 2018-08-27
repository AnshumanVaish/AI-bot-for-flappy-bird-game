class bird{
int y=height/2;
int x= 64;
float gravity= 0.6;
float velocity=0,lift=-15,score=0,fitness=0;
nuralNetwork brain;
bird(){
 brain=new nuralNetwork(5,4,2);
}
bird(nuralNetwork we){
 brain=new nuralNetwork(we);
}
void think(pipe[] p){
  
 pipe closest=null;
 float closestd=100000;
 for(int i=0;i<p.length;i++){
  float d=(p[i].x+p[i].w)-x;
  if(d<closestd&& d>0){
  closest=p[i];
  closestd=d;
  
  }
 
 
 
 
 }
 
 
 
float[] input=new float[5];
input[0]=y;///height;
input[1]=closest.top;///height;
input[2]=closest.bottom;///height;
input[3]=closest.x;///width;
input[4]=velocity*10;///width;
matrix o=brain.feedforward(input);
float output=o.m[0][0];
if(output<o.m[1][0])
up();

}

void show(){
  stroke(255);
fill(255,50);
ellipse(x,y,32,32);
}

void update(){
score++;
velocity += gravity; 
velocity *=0.9;
y+=velocity;
if(y>height){
y= height;
velocity=0;

}
if(y<0){
y  = 0;
velocity=0;
}
}

void up(){
velocity +=lift;

}
void mutate(){
  float x=random(0,1);
  if(x<.2)
brain.mutate();


}

}