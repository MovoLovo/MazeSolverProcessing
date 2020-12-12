class Button {
  // Private variables store where the location of the buttons should be
  private int x, y, wide, tall;
  
  // Private variables store the text of the button
  private String text;
  
  // Private variable to keep track of the 
  private boolean pressed = false;
  
  // Constructor the buttons
  public Button(String text, int x, int y, int wide, int tall){
    
    // Initialize the private variables
    this.x = x;
    this.y = y;
    this.wide = wide;
    this.tall = tall;
    this.text = text;
    
    // Display button
    this.display();
  }
  
  // Function to display the button
  public void display(){
    // Set rectangle display mode
    rectMode(CENTER);
    
    // Set color of rectangle outline
    stroke(255);
    
    // Set internal color
    fill(255, 0, 0);
    
    // Draw rectangle
    rect(x, y, wide, tall);
    
    // Set color of text
    fill(255);
    
    // Draw text
    text(text, x, y + 5);
  }
  
  // Check if something 
  public boolean isPressed(){
    return pressed;
  }
  
  // Set the pressed state of the button
  public void setPressed(boolean pressed){
    this.pressed = pressed;
  }
  
  // Check if mouse in bounds of the button
  // Double check if this is right later
  public boolean isInBound(){
    return mouseX >= x - wide/2 && mouseX <= x + wide/2 && mouseY >= y - tall/2 && mouseY <= y + tall/2;
  }
}
