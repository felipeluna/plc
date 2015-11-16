import java.util.ArrayList;
public class Primos
{

    static int count = 1;
    static ArrayList<Integer> lista = new ArrayList<Integer>();
    
    public static synchronized int getCounter()
    {
        count = count + 1;
        return count;
    }
    
    public static synchronized void addList(int num)
    {
        lista.add(num);
    }
    
    public static boolean isPrime(int n)
    {
        for(int i = 2; i < n; i++)
        {
           if(n%i == 0)
           {
               return false;
           } 
        }
        return true;
    } 
    
    public static void main(String [] args) throws Exception    
    {
 
        int max = 1000000;
        Work t1 = new Work(max);
        Work t2 = new Work(max);
        Work t3 = new Work(max);
        Work t4 = new Work(max);
        Work t5 = new Work(max);
        Work t6 = new Work(max);
        Work t7 = new Work(max);
        Work t8 = new Work(max);
        Work t9 = new Work(max);
        Work t10 = new Work(max);
        Work t11 = new Work(max);
        
        
        t1.start();
        t2.start();
        t3.start();
        t4.start();
        t5.start();
        t6.start();
        t7.start();
        t8.start();
        t9.start();
        t10.start();
        t11.start();
        
        t1.join();
        t2.join();
        t3.join();
        t4.join();
        t5.join();
        t6.join();
        t7.join();
        t8.join();
        t9.join();
        t10.join();
        t11.join();
        
        for(int i = 0; i < lista.size(); i++)
        {
            System.out.println(lista.get(i));
        }
    }

}
    class Work extends Thread
    {
         int max;

         public Work(int max)
         {
            this.max = max;
 
         }
         
         public void run()
         {
             int count = Primos.getCounter();
             while(count < max)
             {
                if(Primos.isPrime(count))
                {

                    Primos.addList(count);
                }

                count = Primos.getCounter();
             }
         }
    }

