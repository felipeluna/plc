public class ContadoresLoucos 
{
    public static void main (String [] args) throws Exception
    {
        int N = 100;
        Work w1 = new Work(N);
        w1.start();
        Work w2= new Work(N);
        w2.start();
    }


}

class Work extends Thread
{
    int contador = 0;
    int max;
    public Work(int max)
    {
        this.max = max;
    }

    public void run()
    {
        while(contador <= max)
        {
            System.out.println(contador);
            contador++;
        } 

    }

}

