Button stack, queue, reset;
Maze maze;

void setup(){
  size(1000, 1000);
  textSize(16);
  textAlign(CENTER);
  background(0, 0, 255);
  stack = new Button("Stack", width/4, 75, 100, 50);
  queue = new Button("Queue", width/2, 75, 100, 50);
  reset = new Button("Reset", 3 * width/4, 75, 100, 50);
  maze = new Maze("input2.txt");
  maze.display(width/2, height/2 + 50, 900, 800);
}
