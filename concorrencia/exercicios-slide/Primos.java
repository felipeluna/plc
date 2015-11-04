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
        for(int i = 1; i <= qntThread; i++)
        {
            max = min + a;
            if(max > maxPrimos)
            { 
                max = maxPrimos; 
            }
            //System.out.print(min + " " + max + "\n");

            (new Primos(min,max)).start();
            min = max + 1;
        } 
        System.out.println("Jonas");
    }
}
