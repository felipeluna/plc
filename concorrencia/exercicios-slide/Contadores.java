public class Contadores extends Thread
{
	int limite;
	//static int contador;
	public Contadores(int limite)
	{
		this.limite = limite;
	}

	public void run()
	{
		for(int i = 0; i < limite; i++)
		{
			//System.out.println(Contadores.contador++);
			System.out.println(i);
			/*
			try
			{			
				Thread.sleep(1);
			}
			catch(Exception e)
			{			
			    
			}
			*/
		}	
	}

	public static void main (String[] args)
	{
		int N = 10;
		int limite = 100;
		for(int i = 0; i < N; i++)
		{
			(new Contadores(limite)).start();

		}
	}
}
