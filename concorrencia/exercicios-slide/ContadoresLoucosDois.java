public class ContadoresLoucosDois
{
    static int contador = 0;
    public static void main (String [] args) throws Exception
    {
        int N = 100;
        int T = 10;
        Work wrks [] = new Work[T];

        for(int i = 0; i < T; i++)
        {
           wrks[i] = new Work(N,i);
        }

        for(int i = 0; i < N; i++)
        {
           wrks[i].start();
        }

    }


}

class Work extends Thread
{
    int max;
    int name;
    public Work(int max, int name)
    {
        this.max = max;
        this.name = name;
    }

    public void run()
    {
        while(ContadoresLoucosDois.contador <= max)
        {
            System.out.println(ContadoresLoucosDois.contador);
            ContadoresLoucosDois.contador++;
        } 

        System.out.println(name + "terminou");

    }

}

