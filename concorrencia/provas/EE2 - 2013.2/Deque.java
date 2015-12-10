import java.util.LinkedList;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
class Deque
{

    LinkedList<Integer> listaE = new LinkedList<Integer>();
    LinkedList<Integer> listaD = new LinkedList<Integer>();     
    Lock lE = new ReentrantLock(true);
    Lock lD = new ReentrantLock(true);

    public void push_left(int i)
    {
         lE.lock();
         try
         {
            listaE.addFirst(i);

         }
         finally
         {
            lE.unlock();
         }         
    }
    public void push_right(int i)
    {
         lD.lock();
         try
         {
            listaD.addLast(i);

         }
         finally
         {
            lD.unlock();
         }         
    }
    public void pop_right()
    {
        boolean tryE = false;
        lD.lock();
        try
        {
            if(listaD.size() == 0 && listaE.size() > 0)
            {
                while(!lE.tryLock())
                {
                   //esperar pegar o lock da outra parte da lista.                    
                }
                    listaE.removeLast();                 
            }
            else if(listaD.size() == 0 && listaE.size() == 0)           
            {
                
                System.out.println("lista vazia");
            }
            else
            {
                listaD.removeLast();    
            }
                
        }
        finally
        {
            if(tryE == true)
            {
                lE.unlock();    
            }
            lD.unlock();
        }
    }
    public void pop_left()
    {
        boolean tryD = false;
        lE.lock();
        try
        {
            if(listaE.size() == 0 && listaD.size() > 0)
            {
                while(!lD.tryLock())
                {
                   //esperar pegar o lock da outra parte da lista.                    
                   System.out.println("deadlock na esquerda");
                }
                    listaD.removeLast();                 
            }
            else if(listaE.size() == 0 && listaD.size() == 0)           
            {
                
                System.out.println("lista vazia");
            }
            else
            {
                listaE.removeLast();    
            }
                
        }
        finally
        {
            if(tryD == true)
            {
                lD.unlock();    
            }
            lE.unlock();
        }
    }
    public void print()
    {
        for(int i = 0; i < listaE.size(); i++)
        {
            System.out.print(listaE.get(i) + " ");
        }
        for(int i = 0; i < listaD.size(); i++)
        {
            System.out.print(listaD.get(i) + " ");
        }
        System.out.println();
    }
    
    public static void main(String [] args)
    {
        Deque d = new Deque();
        
        
        add a = new add(d,3);
        add b = new add(d,4);
        add c = new add(d,2);
        add f = new add(d,6);                       
        rem r = new rem(d);
        a.start();
        b.start();
        c.start();
        f.start();
        r.start();
        try
        {
            a.join();
            b.join();
            c.join();
            f.join();                                    
            r.join();
        }catch(InterruptedException e){}
        d.print();
    }
   
}

class add extends Thread
{
    Deque d;
    int i;
    public add(Deque d, int i)
    {
        this.i = i;
        this.d = d;
    }
    
    public void run()
    {
        d.push_left(i);
       
        d.push_right(i+3);
    }
}

class rem extends Thread
{
    Deque d;
    int i;
    public rem(Deque d)
    {
        this.i = i;
        this.d = d;
    }
    
    public void run()
    {

       d.pop_right();
       d.pop_left();
        
    }
}

