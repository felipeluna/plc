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
    public static void main (String[] args)
    {
        int maxPrimos = 30;
        int qntThread = 2;
        (new Primos
    }
}
