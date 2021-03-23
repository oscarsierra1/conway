int L;
int scd;
float R = 180;

void setup() {
  size(500, 500);
  stroke(0,255,255);
  L = 3;
  scd = 0;
}

void draw() {
  background(0);
  strokeWeight(2);
  scd++;
  if (scd % 40 == 0)   L++;
  draw_polygon(mouseX, mouseY, L,R);
}

int getx (float angle, float r) {
  return (int)(cos(angle) * r);
}

int gety (float angle, float r) {
  return (int)(sin(angle) * r);
}

void draw_polygon(int x, int y, int l, float r) {
  float pi = 3.1415;
  float angle = 2 * pi / l;
  float cur = 0;
  for (int i = 0; i < l; ++i) {
    line(x + getx(cur, r), y + gety(cur, r), x + getx(cur + angle, r), y + gety(cur + angle, r));
    cur += angle;
  }
}
