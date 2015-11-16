public class ContadoresLoucos 
{
   
    
    

    
    public static void main (String [] args) throws Exception
    {
        int N = 100;
        Work w1 = new Work(N);
        Work w2 = new Work(N);
        Work w3 = new Work(N);
        Work w4 = new Work(N);
        w1.join();
        w2.join();
        w3.join();
        w4.join();
       
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
}
