/*
press the key 'a' to produce an aleatory state of the game
press the up arrow to increase speed
press the down arrow to decrease speed
press the space to pause/resume the game
when the game is paused you can click in cells of matrix to become them alive or dead
Inicially the game is paused
*/

int N = 40;
int delt = 20;
int alf = 1;
int x, y;

int [][] mat = new int[N][N];
int [] L = {-1,-1,-1,0,0,1,1,1};
int [] R = {-1,0,1,-1,1,-1,0,1};
int vel = 10;

void pintar(){
  for (int i = 0; i < N; ++i) {
     for (int j = 0; j < N; ++j) {
         if (mat[i][j] > 0) fill(0,255,0);
         else fill(0);
         stroke(255);
         rect(i*delt, j*delt, (i+1)*delt, (j+1)*delt);
     }
  }
}

void alive() {
    int [][] aux = new int[N][N];
    for (int i = 0; i < N; ++i) {
       for (int j = 0; j < N; ++j) {
          int neig = 0;
          for (int k = 0; k < 8; ++k) {
             int newi = i + L[k];
             int newj = j + R[k];
             if (min(newi, newj) < 0 || max(newi, newj) >= N) continue;
             if (mat[newi][newj] > 0) neig++;
          }
          aux[i][j] = mat[i][j];
          if (mat[i][j] > 0 && (neig < 2 || neig > 3)) aux[i][j] = 0;
          if (mat[i][j] == 0 && neig == 3) aux[i][j] = 1;
       }
    }
    for (int i = 0; i < N; ++i) {
       for (int j = 0; j < N; ++j) mat[i][j] = aux[i][j]; 
    }
    pintar();
}

void aleatory() {
  for (int i = 0; i < N; ++i) {
     for (int j = 0; j < N; ++j) mat[i][j] = 1-min(1,int(random(3))); 
  }
  pintar();
}

void setup() {
   background(0);
   size(800,800);
   pintar();
}

void draw() { 
  print(frameCount, " ", vel, "\n");
  if(frameCount % vel == 0) {
    if(alf == 0) alive();
  }
}

void keyPressed(){
   if (key == ' ') alf = 1-alf; 
   else if (key == 'a') {
      aleatory(); 
   }
   else if (key == CODED){
      if (keyCode == UP) vel++;
      else if(keyCode == DOWN) vel--;
      vel = max(vel, 1);
   }
}

void mouseClicked(){
   x = mouseX;
   y = mouseY;
   if (alf > 0) {
      mat[x/delt][y/delt] = 1-mat[x/delt][y/delt];
      pintar();
   }
}
