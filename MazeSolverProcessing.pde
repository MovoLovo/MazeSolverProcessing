// Global variables for access to buttons and maze objects
Button stack, queue, reset;
MazeSolver m;

// File location variable (slightly janky but it works, adding animation in post is hard)
String file = "input.txt";

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
  
  // Initialize MazeSolver so that it draws a gui to the screen
  m = new MazeSolver("stack", file);
  
  // Stop animation for now
  noLoop();
}

// Animation step
void draw(){
  // Step the maze solver forward
  m.step();
}

// Detect mouse presses for the buttons
void mousePressed(){
  // If the stack button is pressed
  if(stack.isInBound()){
    // Set the mode to be a stack search of the maze
    m = new MazeSolver("stack", file);
    loop(); // Begin animation
  }else if(queue.isInBound()){ // If the queue button is pressed
    // Set the mode to a queue search of the maze
    m = new MazeSolver("queue", file);
    loop(); // Begin animation
  }else if(reset.isInBound()){ // If the reset button is pressed
    // Reset the maze
    m = new MazeSolver("stack", file); // Creating a new mode for just displaying an empty maze is redundant so i just have it display a maze that is stuck at initialization
    redraw(); // Redraw the maze, don't restart animation
  }
}
