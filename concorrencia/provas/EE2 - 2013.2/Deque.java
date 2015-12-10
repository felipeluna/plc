import java.util.LinkedList;
class Deque
{
    LinkedList<Integer> lista = new LinkedList<Integer>();
    Lock lesq = new ReentrantLock(true);
    Lock ldir = new ReentrantLock(true);
    Lock vazia = new ReentrantLock(true);

    
    public void push_left(int i)
    {
        lesq.lock();
        try
        {
           vazia.lock();
           try
           {
               if(lista.size() == 0)
               {
                   lista.addFirst(i);
               }
           }
           finally
           {
                vazia.unlock(); 
           }
           lista.addFirst(i); 
        }
        finally
        {
            lesq.unlock();
        }
    }
    
}
