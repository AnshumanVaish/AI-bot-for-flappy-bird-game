class pipe{
  
//int top=height/2-//floor(random(height/2));

float x=width,w=50,speed=3;

int helight=0,spacing=100;//floor(random(50,height/2));
int center=floor(random(spacing,height-spacing));//floor(random(20,height/2));
int top=center -spacing/2;//floor(random(height/2));
int bottom=height-(center+spacing/2);//floor(random(height/2));
pipe(){}
void show(){
fill(255);
if(helight==1)
fill(255,0,0); 
rect(x,0,w,top);
rect(x,height-bottom,w,bottom);
}
void update(){
x -=speed;

}
int hits(bird q){
 int e=0;
if(q.y<top || q.y>height-bottom){
 if(q.x>x&&q.x<x+w){
   e=1;
   helight=1;
 
 }

}
//helight=0;
return e;

}


}