class MazeSolver{
  String mode;
  
  Maze maze;
  
  ArrayStack stackLoc;
  // ArrayQueue queueLoc;
  
  MazeSolver(String mode, String fileLoc){
    this.mode = mode;
    this.maze = new Maze(fileLoc);
    this.maze.display(width/2, height/2 + 50, 900, 800);
  }
  
  public void step(){
    // TODO: Check if there are locations in the stack or queue to start at
    
    // TODO: Get the location of this step
    
    // TODO: Get location of next steps
    // TODO: Run calculations for end conditions of the search
    
    // TODO: Add next locations to stack or queue
    
    // TODO: Set the colors for the maze
  }
}
