public class Primos extends Thread
{
    int min;
    int max;
    public Primos (int min, int max)
    {
        this.min = min;
        this.max = max; 
    }

    public void run()
    {
        for(int i = min; i <= max; i++)
        {
            if(isPrime(i))
            {
                System.out.println(i); 
            } 
        } 
    }
    
    public boolean isPrime(int n)
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

    public static void main (String[] args)
    {
        int maxPrimos = 11;
        int qntThread = 3;
        int a = maxPrimos/qntThread;
        int min = 2;
        int max;
        Thread [] ts = new Thread[qntThread];
        for(int i = 0; i < qntThread; i++)
        {
            max = min + a;
            if(max > maxPrimos)
            { 
                max = maxPrimos; 
            }
            //System.out.print(min + " " + max + "\n");

            ts[i] = new Primos(min,max);
            min = max + 1;
            ts[i].start();
        } 
         for(int i = 0; i < qntThread; i++)
        {
            try 
            {
                ts[i].join();
            } 
            catch (InterruptedException ie)
            {
             Thread.currentThread().interrupt();  // set interrupt flag
             System.out.println("Failed to thread");
            }
        }
        
        System.out.println("Jonas");
    }
}
