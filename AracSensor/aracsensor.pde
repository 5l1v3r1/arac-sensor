Map map;

MapBuilder mapBuilder;

Car car;


void setup() {
  size(800, 800);
  map = new Map();

  map.draw();


  Wall wall1 = new Wall(0, 10, 800, 10);
  Wall wall2 = new Wall(wall1.start.x, 700, wall1.end.x, 700);
  Wall wall3 = new Wall(0, 0, 0, 800);
  Wall wall4 = new Wall(800, 0, 800, 800);

  map.walls.add(wall1);
  map.walls.add(wall2);
  map.walls.add(wall3);
  map.walls.add(wall4);


  for (int x=100; x<600; x+=70) {
    Wall wallA = new Wall(x, 100, x, 300);
    Wall wallB = new Wall(x, 400, x, 600);
    map.walls.add(wallA);
    map.walls.add(wallB);
  }


  for (int x=100; x<600; x+=140) {
    Wall wallA = new Wall(x, 100, x+70, 100);
    Wall wallB = new Wall(x, 300, x+70, 300);
    Wall wallC = new Wall(x, 400, x+70, 400);
    Wall wallD = new Wall(x, 600, x+70, 600);
    map.walls.add(wallA);
    map.walls.add(wallB);
    map.walls.add(wallC);
    map.walls.add(wallD);
  }

  mapBuilder = new MapBuilder(map);
  mapBuilder.process();
  car  = new Car(20, 70, 70, 5, map);
  Sensor sensor = new Sensor(300, 0, car);
  car.Sensors.add(sensor);
  car.Sensors.add(new Sensor(300, -45, car));
  car.Sensors.add(new Sensor(300, 45, car));
  car.rudder = new RudderLR(car);
}

void keyPressed() {
  //
  if (key == 'k')
    map.save("track1.map");
  if (key == 'l')
    map.load("track1.map");
}

void draw() {
  background(0);
  map.draw();
  mapBuilder.process();
  car.draw();
}
