public class Jantar 
{
	static int num = 5;
	static Object []garfos = new Object[num];
	
	public static void main(String[] args) 
	{
		for(int i = 0; i < garfos.length; i++)
		{
			garfos[i] = new Object();
		}
		Filosofo [] filos = new Filosofo[num];
		//cria threads
		for(int i = 0; i < filos.length-1; i++)
		{
			filos[i] = new Filosofo(i,garfos[i], garfos[i+1]);
		}
		// ultimo cara pega o garfo 1 primeiro e depois o 5
		filos[filos.length-1] = new Filosofo(filos.length-1,garfos[0],garfos[garfos.length-1]);
		
		for(int i = 0; i < filos.length; i++)
		{
			filos[i].start();
		}
	}
}

class Filosofo extends Thread
{

	Object garfo1;
	Object garfo2;
	int id;
	
	public Filosofo(int id, Object garfo1, Object garfo2)
	{
		this.id = id;
		this.garfo1 = garfo1;
		this.garfo2 = garfo2;
	}
	public void run()
	{
		while(true)
		{
			try
			{
				//pensa
				Thread.sleep(10);
			} 
			catch (InterruptedException e) 
			{
				
			}
			
			int x = (int) Math.random();
			if(x < 0.5){
				
				synchronized(garfo1)
				{
					synchronized(garfo2)
					{
						System.out.println("filosofo " + id + " comeu");
						break;
					}
				}
				
				
			}
			
		}
	}
}
