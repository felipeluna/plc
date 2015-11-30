import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.locks.*;

class Lanche
{
    String name;
    int price;
    public Lanche(String name, int price)
    {
        this.name = name;
        this.price = price;
    }

    public String toString()
    {
        return (name + " - " + price);
    }
}

class Produtor extends Thread
{
    Lanche L;
    public Produtor(Lanche L)
    {
        this.L = L;
    }
    public void run()
    {
        // add resource in Queue
        ProdutorConsumidor.lock.lock();
        try
        {
            // try put into the Queue
        	System.out.println("added: "+ L.toString());
            ProdutorConsumidor.fila.add(L);
        }
        finally
        {
            // unlock
            ProdutorConsumidor.lock.unlock();
        }
    }
}
class Consumidor extends Thread
{

    public void run()
    {
        // remove resource from Queue
        ProdutorConsumidor.lock.lock();
        try
        {
            while(ProdutorConsumidor.fila.isEmpty())
            {
               try
               {
            	   ProdutorConsumidor.isEmpty.await();
               }
               catch(InterruptedException e){}
            }
            System.out.println("Removed: " + ProdutorConsumidor.fila.get(0).toString());
            ProdutorConsumidor.fila.remove(0);
        }
        finally
        {
            ProdutorConsumidor.lock.unlock();
        }

    }
}

public class ProdutorConsumidor
{
    static List<Lanche> fila = new ArrayList<Lanche>();
    static Lock lock = new ReentrantLock();
    static Condition isEmpty = lock.newCondition();
    
    public static void main (String [] args) 
    {
    	 Lanche l = new Lanche("temaki",100);
    	 Produtor p = new Produtor(l);
         Consumidor c = new Consumidor();
         p.start();
         c.start();

    }
    
    public Lanche GerarLanche(String name, int preco)
    {
        Lanche ret = new Lanche(name, preco);
        return ret;
    }

}

