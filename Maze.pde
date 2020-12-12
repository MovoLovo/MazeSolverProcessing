class Maze {
  private int wide;
  private int tall;
  private char[][] maze;
  private String solveMode = null;

  public Maze(String input) {
    String[] lines = loadStrings(input);
        
    wide = Integer.parseInt(lines[0].split(" ")[0]);
    tall = Integer.parseInt(lines[0].split(" ")[1]);
        
    maze = new char[tall][wide];

    for(int i = 1; i < lines.length; i++){
      for(int j = 0; j < lines[i].length(); j++){
        maze[i-1][j] = lines[i].charAt(j);
      }
    }
        
    print(this);
  }

  public String toString(){
    StringBuilder result = new StringBuilder();
      for(char[] a : maze){
        for(char c : a){
          result.append(c);
        }
      result.append('\n');
    }
    return result.toString();
  }

  public void setSolveMode(String mode) throws Exception {
    if(!(mode.equals("stack") || mode.equals("queue"))){
      throw new Exception("Solve mode must either be 'stack' or 'queue'.");
    }
    solveMode = mode;
  }

  public String getSolveMode() {
    return solveMode;
  }
    
  public void display(int x, int y, int displayWide, int displayTall){
    
    int x1 = x - displayWide/2;
    int y1 = y - displayTall/2;
    int boxWidth = displayWide / wide;
    int boxHeight = displayTall / tall;
    println(x1 + " " + y1);
    println(boxWidth +  " " + boxHeight);
    
    stroke(0);
    rectMode(CORNERS);
    for(int i = 0; i < maze.length; i++){
      for(int j = 0; j < maze[i].length; j++){
        if(maze[i][j] == '#'){
          fill(0);
        }else if(maze[i][j] == '.'){
          fill(255);
        }else if(maze[i][j] == 'o'){
          fill(0, 255, 0);
        }else{
          fill(255, 0, 0);
        }
        rect(x1 + boxWidth * j, y1 + boxHeight * i, x1 + boxWidth * (j + 1), y1 + boxHeight * (i + 1));
        println(y1 + boxWidth * (y + 1));
      }
    }
  }
}
