// Global variables for access to buttons and maze objects
Button stack, queue, reset;
MazeSolver m;

void setup(){
  // Setup the window
  size(1000, 1000);
  textSize(16);
  textAlign(CENTER);
  
  // Set the background color
  background(0, 0, 255);
  
  // Initializing buttons
  stack = new Button("Stack", width/4, 75, 100, 50);
  queue = new Button("Queue", width/2, 75, 100, 50);
  reset = new Button("Reset", 3 * width/4, 75, 100, 50);
  
  // Initialize MazeSolver
  m = new MazeSolver("stack", "input2.txt");
}
