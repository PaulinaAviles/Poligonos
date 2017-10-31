class Poligono implements Figura{
  int n;
  float v,angle;
  int x,y;
  char p;
  
  //valores de p; a- apotema, l-lado, r-radio, s-area
  //n -- numero de lados del poligono
  //v -- valor de la variable introducida (area, apotema, lado o radio)
  Poligono(int x_, int y_, int n_, float v_, char p_){
    x = x_;
    y = y_;
    n = n_;
    v = v_;
    p = p_;
    angle = TWO_PI/n;
    /*compRadio(p,n,v);
    compApotema(p,n,v);
    compLado(p,n,v);*/
  }
    
    
    
    float radio(){
      float respuesta=0;
      if(p=='l'){respuesta = (v/2)/cos(angle/2);}
      if(p=='a'){respuesta = v/sin(angle/2);}
      if(p=='r'){respuesta = v;}
      return respuesta;
    }
    float aphotem(){
      float respuesta=0;
      if(p=='l'){respuesta = (v/2)*tan(angle/2);}
      if(p=='a'){respuesta =  v;}
      if(p=='r'){respuesta =  sin(angle/2)*v;}
      return respuesta;
    }
    float lado(){
      float respuesta=0;
      if(p=='l'){respuesta = v;}
      if(p=='a'){respuesta = (v/tan(angle/2)*2);}
      if(p=='r'){respuesta = cos(angle/2)*v*2;}
      return respuesta;
    }
    float perimetro(){
      return v*n;
    }
    float area(){
      float respuesta=0;
      if(n==3){
        float h= sqrt(radio()*radio()-(lado()/2)*(lado()/2));
        respuesta = (lado()*h)/2;
      }
      if(p==4){respuesta = lado()*lado();}
      if(p>=5){respuesta = perimetro()*aphotem();}
      return respuesta;
    }
   
  
     void display(){
     polygon(x,y,radio(),n);}

}//class

   /*void compRadio(char P, int N, float V){
     float m;
         float angle= 360/N;
            if(P=='l'){m= (V/2)/cos(angle);}
            if(P=='a'){m= V/sin(angle);}
            if(P=='r'){m= V;}
      }
      void compApotema(char P, int N, float V){
        float m;
        float angle= 360/N;
            if(P=='l'){m= (V/2)*tan(angle);}
            if(P=='a'){m= V;}
            if(P=='r'){m= sin(angle);}
      }
      void compLado(char P, int N, float V){
        float m;
        float angle= 360/N;
            if(P=='l'){m= V;}
            if(P=='a'){m= (V/tan(angle)*2);}
            if(P=='r'){m= cos(angle)*V*2;}
      }*/
      
  void polygon(int px, int py, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = px + cos(a) * radius;
    float sy = py + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}//polygon