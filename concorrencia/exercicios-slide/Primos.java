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
 
        int max = 500;
        int N = 10;
        Work wrks [] = new Work[N];
        for(int i = 0; i < N; i++)
        {
           wrks[i] = new Work(max);
        }

        for(int i = 0; i < N; i++)
        {
           wrks[i].start();
        }

        for(int i = 0; i < N; i++)
        {
           wrks[i].join();
        }

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

