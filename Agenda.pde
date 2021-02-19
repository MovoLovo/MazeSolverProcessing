class Agenda{ // Turns the the stack and queue into one thing to reduce the logical overhead of coding this
  
  // Variables for stack or queue
  ArrayStack stack;
  ArrayQueue queue;
  
  // Boolean that turns the user input into something that is easier to use for code
  boolean isStack;
  
  // Constructor
  Agenda(String type){
    if(type.equals("stack")){ // If stack:
      this.isStack = true; // Set isStack to true
      stack = new ArrayStack(); // Initialize the stack
    }else if(type.equals("queue")){ // 
      this.isStack = false; // Set isStack to false
      queue = new ArrayQueue(); // Initialize the queue
    }else{
      // This only happens if something is spelt wrong
      println("The agenda only accepts modes 'queue' or 'stack'");
    }
  }
  
  // Common function for adding objects to the queue (loosely following ArrayList standard)
  public boolean add(Object e){
    if(isStack){ // Checks the type of the datatype being stored
      return stack.push(e); // If stack, add to the stack
    }else{ // The else{} here is keep throughout this script for readability and style reasons
      return queue.add(e); // If queue add to the queue
    }
  }
  
  // Common function for clearing the top or front item of the data structures
  public Object get(){
    if(isStack){
      return stack.pop(); // Pop the stack if it is a stack
    }else{
      return queue.poll(); // Poll the queue if it is a queue
    }
  }
  
  // Common function for peeking at the top/front item of the data structure
  public Object peek(){
    if(isStack){
      return stack.peek(); // If stack, peek at the stack
    }else{
      return queue.peek(); // If queue, peek at the queue
    }
  }
  
  // Common function for the length of the data structures
  public int length(){
    if(isStack){
      return stack.length(); // Come on, just look at this code. It's so fricken obvious what this function does. 
      // Gets the length of the stack if the mode is stack
    }else{
      return queue.length(); // Gets the length of the queue if the mode is queue
    }
  }
  
  // Common function for checking of the agenda is empty
  public boolean empty(){ // I've explained the same thing like 4 times
    if(isStack){
      return stack.empty(); // Blah blah if stack return boolean for if stack empty 
    }else{
      return queue.empty(); // Same thing but for queues
    }
  }
}
