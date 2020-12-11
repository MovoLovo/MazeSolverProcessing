class Maze {
    private int width;
    private int height;
    private char[][] maze;
    private String solveMode = null;

    public Maze(String input) {
        String[] lines = loadStrings(input);
        
        width = Integer.parseInt(lines[0].split(" ")[0]);
        height = Integer.parseInt(lines[0].split(" ")[1]);
        
        maze = new char[height][width];

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
    
    public void display(int x, int y, int wide, int tall){
      
    }
}
