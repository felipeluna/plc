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
    public void run()
    {
        // add resource in Queue
        ProdutorConsumidor.lock.lock();
        try
        {
        	while(ProdutorConsumidor.count < 1000)
        	{
        		Lanche L = new Lanche(Integer.toString((int) (Math.random()*100)),(int) (Math.random()*100));
        		// try put into the Queue
        		System.out.println("added: "+ L.toString());
        		ProdutorConsumidor.fila.add(L);
        		ProdutorConsumidor.count++;
        	}
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
    static int count = 0;
    public static void main (String [] args) 
    {
    	 Lanche l = new Lanche("temaki",100);
    	 Lanche l2 = new Lanche("sushi",50);
    	 Lanche l3 = new Lanche("tempura",70);

    	 
    	 Produtor p1 = new Produtor();
    	 Produtor p2 = new Produtor();
    	 Produtor p3 = new Produtor();
    	 p1.start();
    	 p2.start();
    	 p3.start();
    	 Consumidor [] array = new Consumidor[100];
    	 
    	 for(int i = 0; i < array.length;i++)
    	 {
    		 
    		 array[i] = new Consumidor();
    		 array[i].start();
    	 }



    }
    
    public Lanche GerarLanche(String name, int preco)
    {
        Lanche ret = new Lanche(name, preco);
        return ret;
    }

}

