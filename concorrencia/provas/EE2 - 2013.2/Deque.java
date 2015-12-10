import java.util.LinkedList;
import java.util.concurrent.locks.*;
class Deque
{
    LinkedList<Integer> lista = new LinkedList<Integer>();
    Lock lesq = new ReentrantLock(true);
    Lock ldir = new ReentrantLock(true);
    Lock vazia = new ReentrantLock(true);
    Condition condVazia = vazia.newCondition();
    
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
                   System.out.println(i + " entrou numa lista vazia");
                   lista.addFirst(i);
               }
           }
           finally
           {
                vazia.unlock(); 
           }

           condVazia.signalAll(); 
        }
        finally
        {
            lesq.unlock();
        }
    }
    public void pop_left()
    {
        lesq.lock();
        try
        {
           vazia.lock();
           try
           {
               while(lista.size() == 0)
               {
                    try
                    {
                        condVazia.await();    
                    }catch(InterruptedException e) {}
               }
           }
           finally
           {
                vazia.unlock(); 
           }
           
           lista.removeFirst(); 
        }
        finally
        {
            lesq.unlock();
        }
    }
    
    public static void main(String [] args)
    {
        Deque d = new Deque();
        prod p = new prod(d,4);
        cons c = new cons(d);
        p.start();
        c.start();
    }
    
}


class prod extends Thread
{
    Deque d;
    int i;
    public prod(Deque d, int i)
    {
        this.d = d;
        this.i = i;
    }      
    public void run()
    {
        d.push_left(i);   
    }
}

class cons extends Thread
{
    Deque d;

    public cons(Deque d)
    {
        this.d = d;
    }      
    public void run()
    {
        d.pop_left();   
    }
}
