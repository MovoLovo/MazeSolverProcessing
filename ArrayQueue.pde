import java.util.Arrays;

public class ArrayQueue {
    // Private array managing internal data storage
    private Object[] arr;

    // Represents where new data is being added "the back of the line"
    private int back = 0;

    // Represents where data should be taken out "the front of the line"
    private int front = 0;

    // Constructor to instantiate the internal array
    public ArrayQueue(){
        arr = new Object[10];
    }

    /**
     * Expands the internal array to accommodate new incoming data
     */
    private void expand(){
        if(back + 1 == arr.length){
            Object[] temp = new Object[arr.length * 2];
            for(int i = 0; i < arr.length; i++){
                temp[i] = arr[i];
            }
            arr = temp.clone();
        }
    }

    /**
     * Adds an object of type E to the queue
     * @throws ClassCastException when trying to add wrong type to internal array
     * @param e Object being added to array
     * @return if adding to the internal array has changed it
     */
    public boolean add(Object e){
        Object[] temp = arr.clone();
        expand();

        try {
            arr[back++] = e;
        } catch (ClassCastException exception){
            throw new ClassCastException("Incorrect type when adding to ArrayQueue");
        }

        return !Arrays.equals(temp, arr);
    }

    /**
     * Offers an object to be added to the queue
     * @param e object being offered to the queue
     * @return true if object was added to th queue
     */
    public boolean offer(Object e){
        return add(e); // This here is professional copy-pasting
    }

    /**
     * Reveals the element that is at the front of the queue
     * @return element at front of the queue
     * @throws NoSuchFieldException when the queue is empty
     */
    public Object element() throws NoSuchFieldException {
        if(back == front) throw new NoSuchFieldException("element() failed when querying empty array");
        return arr[front];
    }

    /**
     * Reveals the element that is at the front of the queue
     * @return null if queue is empty, otherwise element at front of queue
     */
    public Object peek(){
        return back == front ? null : arr[front];
    }

    /**
     * Removes the item at the front of the queue and returns it
     * @return element at the front of the queue, if there is none return null
     */
    public Object poll(){
        return back == front ? null : arr[front++];
    }

    /**
     * Removes the item at the front of the queue and returns it
     * @return the item at the front of the queue
     * @throws NoSuchFieldException when queue is empty
     */
    public Object remove() throws NoSuchFieldException {
        if(back == front) throw new NoSuchFieldException("ArrayQueue is empty");
        return arr[front++];
    }

    /**
     * Function to find the length of the queue
     * @return the distance between the first and the last element in the virtual queue
     */
    public int length(){
        return back - front;
    }
    
    public boolean empty(){
      return back == front;
    }
}
