int total=1000,counter=1; 
bird[] a=new bird[total],s=new bird[total];
//bird s;
static int q=1,w=0;
pipe[] pipes=new pipe[5]; 
void setup(){
size(400,600);
background(0);
for(int i=0;i<total;i++){
a[i]=new bird();
a[i].show();
}
for(int i=0;i<pipes.length;i++)
pipes[i]=new pipe();

println(counter);
}
void draw(){
background(0);
for(int i=0;i<q;i++){
 pipes[i].show();
 pipes[i].update(); 
 for (int j=0;j<a.length;j++){
   if(pipes[i].hits(a[j])==1){
     s[w]=a[j];
     
     w++;
     if(w==total)
     w=0;
    a[j]=a[a.length-1];
     a=(bird[])shorten(a); 
   
   }
 
 
 }
 //if(pipes[i].hits(a)==1){
 //println("hit");
 
 //}
 if (pipes[i].x<-pipes[i].w){
  for(int j=1;j<pipes.length;j++){
  pipes[j-1]=pipes[j];
  
  }
 pipes[4]=new pipe();
 q--;
 }
 
 }



for(int i=0;i<a.length;i++){
if(frameCount % 5==0||frameCount==1)  
a[i].think(pipes); 
a[i].update();
a[i].show();
}
if(a.length==0){
nextGeneration();
counter++;
println(counter);
for(pipe p:pipes){
p=null;
}
//pipes=null;

}
if(frameCount % 115==0){
q++;
}
 
}


void nextGeneration(){
 a= new bird[total];
 fitness();
for(int i=0;i<total;i++){
  a[i]=pick();
  }
}
void fitness(){
 int sum =0;
 for(int i=0;i<total;i++){
  sum += s[i].score;
 }
 for(int i=0;i<total;i++){
  s[i].fitness=s[i].score/sum;
 }
}
bird pick(){
int index=0;
float r=random(1);
while(r>0){
r=r-s[index].fitness;
index++;

}
index--;
bird x=new bird(s[index].brain);
x.mutate();
return x;
}