class Button {
  private int x, y, wide, tall;
  private String text;
  private boolean pressed = false;
  
  public Button(String text, int x, int y, int wide, int tall){
    this.x = x;
    this.y = y;
    this.wide = wide;
    this.tall = tall;
    this.text = text;
    this.display();
  }
  
  public void display(){
    stroke(255);
    fill(255, 0, 0);
    rect(x, y, wide, tall);
    fill(255);
    text(text, x, y + 5);
  }
  
  public boolean isPressed(){
    return pressed;
  }
  
  public void setPressed(boolean pressed){
    this.pressed = pressed;
  }
  
  // Double check if this is right later
  public boolean isInBound(){
    return mouseX >= x - wide/2 && mouseX <= x + wide/2 && mouseY >= y - tall/2 && mouseY <= y + tall/2;
  }
}
