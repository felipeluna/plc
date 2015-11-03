/*
  Implemente um programa que imprime todos os números entre 1 e 2 bilhões 
  usando várias threads para particionar o trabalho.
 */

// eu uso quatro threads.
public class Bilhoes extends Thread{
    int min;
    int max;

    public Bilhoes (int min, int max)
    {
        this.min = min;
        this.max = max;
    }


    public void run()
    {
        for(int a = min; a <= max; a++)
        {
            System.out.println(a);
        }
    }

    public static void main(String[] args)
    {

        (new Bilhoes(1,500000000)).start();
        (new Bilhoes(500000000,1000000000)).start();
        (new Bilhoes(1000000000,1500000000)).start();
        (new Bilhoes(1500000000,2000000000)).start();

            
        }

        

}
