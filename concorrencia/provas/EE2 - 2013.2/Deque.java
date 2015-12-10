import java.util.LinkedList;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.Random;
class Deque
{

    LinkedList<Integer> listaE = new LinkedList<Integer>();
    LinkedList<Integer> listaD = new LinkedList<Integer>();     
    Lock lE = new ReentrantLock(true);
    Lock lD = new ReentrantLock(true);

    public void push_left(int i)
    {
         lE.lock();
         try
         {
            listaE.addFirst(i);
	                   System.out.println("add na esquerda");
         }
         finally
         {
            lE.unlock();
         }         
    }
    public void push_right(int i)
    {
         lD.lock();
         try
         {
            listaD.addLast(i);
                   System.out.println("add na dreita");
         }
         finally
         {
            lD.unlock();
         }         
    }
    public int pop_right()
    {
        boolean tryE = false;
        lD.lock();
	    int ret = -1;
        try
        {
            if(listaD.size() == 0 && listaE.size() > 0)
            {
		tryE = lE.tryLock();
                while(!tryE)
                {
		           lE.unlock();
		           tryE = lE.tryLock();
                   //esperar pegar o lock da outra parte da lista.    
                   System.out.println("nao conseguiu o lock na esquerda");                
                }
                ret = listaE.removeLast();                 
            }
            else if(listaD.size() == 0 && listaE.size() == 0)           
            {
                
                System.out.println("lista vazia direita");
            }
            else
            {
                ret = listaD.removeLast();    
            }
                
        }
        finally
        {
            if(tryE == true)
            {
                lE.unlock();    
            }
            lD.unlock();
        }
	    return ret;
    }
    public int pop_left()
    {
        boolean tryD = false;
        lE.lock();
	int ret =-1;
        try
        {
            if(listaE.size() == 0 && listaD.size() > 0)
            {
		tryD = lD.tryLock();
                while(!tryD)
                {
	           lD.unlock();
		   tryD =lD.tryLock();
                   //esperar pegar o lock da outra parte da lista.                    
                   System.out.println("nao conseguiu o lock na esquerda");
                }
                   ret = listaD.removeLast();                 
            }
            else if(listaE.size() == 0 && listaD.size() == 0)           
            {
                
                System.out.println("lista vazia esquerda");
            }
            else
            {
	                   System.out.println("removeu esquerda");
                ret = listaE.removeLast();    
            }
                
        }
        finally
        {
            if(tryD == true)
            {
                lD.unlock();    
            }
            lE.unlock();
        }
	return ret;
    }
    public void print()
    {
        for(int i = 0; i < listaE.size(); i++)
        {
            System.out.print(listaE.get(i) + " ");
        }
        for(int i = 0; i < listaD.size(); i++)
        {
            System.out.print(listaD.get(i) + " ");
        }
        System.out.println();
    }
    
    public static void main(String [] args)
    {
        Deque d = new Deque();
        int n = 4;

		while(n > 0){
			(new ThreadOperator(n,d)).start();
			n--;
		}
    }
   
}
class ThreadOperator extends Thread{
	Deque dq;
	Random randGen;
	int id;
 	public ThreadOperator(int id, Deque dq){
		this.id = id;
		this.dq = dq;
		this.randGen = new Random();
	}
	public void run(){
		while(true){
			int value = randGen.nextInt(50);
			int operation = randGen.nextInt(4);
			try{
				if(operation == 0){
					dq.push_left(value);
					System.out.println(value+" pushed left");
				}else if(operation == 1){
					dq.push_right(value);
					System.out.println(value+" pushed rigth");
				}else if(operation == 2){
					value = dq.pop_left();
					System.out.println(value+" poped from left");
				}else if(operation == 3){
					value = dq.pop_right();
					System.out.println(value+" poped from right");
				}
			}catch(Exception e){
				System.out.println("Ops! "+e.getMessage());				
			} 
		}
	}
}
class add extends Thread
{
    Deque d;
    int i;
    public add(Deque d, int i)
    {
        this.i = i;
        this.d = d;
    }
    
    public void run()
    {
        d.push_left(i);
       
        d.push_right(i+3);
    }
}

class rem extends Thread
{
    Deque d;
    int i;
    public rem(Deque d)
    {
        this.i = i;
        this.d = d;
    }
    
    public void run()
    {

       d.pop_right();
       d.pop_left();
        
    }
}

