class Maze {
  // Private variable to store the height and width of the maze
  private int wide, tall;
  
  // Private variable to store the maze's raw text data
  private char[][] maze;
  
  // Private variable to keep track of solve mode
  private String solveMode = null;
  
  // Constructor of the Maze
  public Maze(String input) {
    
    // Temp variable to store the data from the loadStrings() function
    String[] lines = loadStrings(input);
    
    // Initialize the height and width variables of the maze with info from the input
    wide = Integer.parseInt(lines[0].split(" ")[0]);
    tall = Integer.parseInt(lines[0].split(" ")[1]);
    
    // Define the maze
    maze = new char[tall][wide];
    
    // Initialize the maze variable
    for(int i = 1; i < lines.length; i++){
      for(int j = 0; j < lines[i].length(); j++){
        maze[i-1][j] = lines[i].charAt(j);
      }
    }
    
    // Print maze data for diagnostic 
    print(this);
  }
  
  // Turns the maze into a string
  public String toString(){
    // Setup StringBuilder to construct the string
    StringBuilder result = new StringBuilder();
    
    // Add characters and formatting to the string
    for(char[] a : maze){
      for(char c : a){
        result.append(c);
      }
      result.append('\n');
    }
    
    // Return constructed string
    return result.toString();
  }
  
  // Set the solveMode of the maze
  public void setSolveMode(String mode) throws Exception {
    // Check if input string is value
    if(!(mode.equals("stack") || mode.equals("queue"))){
      // If input is not correct, throw an exception
      throw new Exception("Solve mode must either be 'stack' or 'queue'.");
    }
    // If input is correct something 
    solveMode = mode;
  }
  
  // Get the solve mode of the maze
  public String getSolveMode() {
    return solveMode;
  }
  
  // Display the maze
  public void display(int x, int y, int displayWide, int displayTall){
    
    // Calculate the start position for drawing the maze
    int x1 = x - displayWide/2;
    int y1 = y - displayTall/2;
    
    // Calculate the displacement between rectangles
    int boxWidth = displayWide / wide;
    int boxHeight = displayTall / tall;
    
    // Set the color of the rectangle 
    stroke(0);
    rectMode(CORNERS);
    
    // Loop through each character in the maze and draw a rectangle
    for(int i = 0; i < maze.length; i++){
      for(int j = 0; j < maze[i].length; j++){
        
        // Set the color of the rectangle based on the character
        if(maze[i][j] == '#'){
          fill(0);
        }else if(maze[i][j] == '.'){
          fill(255);
        }else if(maze[i][j] == 'o'){
          fill(0, 255, 0);
        }else{
          fill(255, 0, 0);
        }
        
        // Draw the rectangle based on the variables
        rect(x1 + boxWidth * j, y1 + boxHeight * i, x1 + boxWidth * (j + 1), y1 + boxHeight * (i + 1));
      }
    }
  }
}
