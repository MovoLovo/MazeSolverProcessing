class MazeSolver{ // It solves mazes
  // Variable to store mode it would be solving in
  String mode;
  
  // Stores the maze as an internal object make making changes to the maze and displaying it easier
  Maze maze;
  
  // The agenda to store the locations for maze solving
  Agenda agenda;
  
  // An ArrayList storing all of the explored locations
  ArrayList<PVector> explored;
  
  // Constructor
  MazeSolver(String mode, String file){
    this.mode = mode; // Initialize the mode
    this.maze = new Maze(file); // Initialize the maze from the file
    this.agenda = new Agenda(mode); // Initialize the agenda from the mode
    this.getStart(); // Get the start position and add it to the agenda
    explored = new ArrayList<PVector>(); // Initialize the explored spaces ArrayList
    this.maze.display(width/2, height/2 + 50, 900, 800); // Display the maze
  }
  
  // Get the start location
  public void getStart(){
    char[][] m = maze.getMaze(); // Get the maze into a char array
    
    for(int i = 0; i < m.length; i++){ // Loop through the maze
      for(int j = 0; j < m[i].length; j++){
        if(m[i][j] == 'o'){ // If you find the start location, add it to the agenda
          agenda.add(new PVector(j, i)); // I'm using PVectors for storing the locations of the things because it was the easiest way I could find
          return;
        }
      }
    }
    return;
  }
  
  // Step the search
  public void step(){
    if(agenda.empty()){ // Terminate program if nothing is in agenda (means it's not solvable)
      noLoop();
      // Report that maze is not solvable
      println("Not Solvable");
      return;
    }
    
    // Get the top/front location from the agenda
    PVector loc = (PVector) agenda.get(); // I pray to the spagetti monster every day that this works
    
    // Get the maze from the maze object (having the maze internal means that I won't have to pass around parameters or worse _global variables_
    char[][] m = maze.getMaze();
    
    // Add the location to the locations that have been searched
    explored.add(loc);
    
    // If the space is empty, note that it has been searched with a question mark
    if(m[(int)loc.y][(int)loc.x] == '.'){
      m[(int)loc.y][(int)loc.x] = '?';
    }
    
    // Check the surrounding four squares and if they aren't walls or haven't been explored yet, add them to the agenda
    if(!isExplored(new PVector(loc.x - 1, loc.y)) && m[(int)loc.y][(int)loc.x - 1] != '#'){
      agenda.add(new PVector(loc.x - 1, loc.y));
    }
    
    if(!isExplored(new PVector(loc.x + 1, loc.y)) && m[(int)loc.y][(int)loc.x + 1] != '#'){
      agenda.add(new PVector(loc.x + 1, loc.y));
    }
    
    if(!isExplored(new PVector(loc.x, loc.y - 1)) && m[(int)loc.y - 1][(int)loc.x] != '#'){
      agenda.add(new PVector(loc.x, loc.y - 1));
    }
    
    if(!isExplored(new PVector(loc.x, loc.y + 1)) && m[(int)loc.y + 1][(int)loc.x] != '#'){
      agenda.add(new PVector(loc.x, loc.y + 1));
    }
    
    // Give the char[][] back the maze so that it can display it
    this.maze.setMaze(m);
    // Display maze
    this.maze.display(width/2, height/2 + 50, 900, 800);
    
    // If the finish location is found, stop animation
    if(m[(int)loc.y][(int)loc.x] == '*'){
      noLoop();
      // Report that maze has been solved
      println("Solved");
    }
  }
  
  // Helper function to tell of a location has been search already
  public boolean isExplored(PVector v){
    for(PVector p : explored){ // Loop through the explored array
      if(p.x == v.x && p.y == v.y){ // If both values for the vectors match, the place has already been explored
        return true;
      }
    }
    return false;
  }
}
