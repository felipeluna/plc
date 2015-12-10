import java.util.concurrent.locks.*;
import java.util.List;
import java.util.ArrayList;
class SyncChan
{

    List<Integer> lista = new ArrayList<Integer>();
    Lock l = new ReentrantLock(true);
    Condition cond =  l.newCondition(); //condicao para apenas uma thread entrar
    Boolean cheio = false; //começa com a lista vazia
    int max = 10;
    //metodo para add na thread
    public void push(int tId, int a)
    {
        l.lock();
        try
        {
            while(cheio)
            {
                try
                {
                    System.out.printf("%d nao conseguiu entrar, lista cheia\n",tId);
                    cond.await();
                }catch(InterruptedException e){}
            }
            lista.add(a);
            System.out.printf("%d adicionou %d\n",tId, lista.get(0));
            cheio = true;
            cond.signalAll();
        }
        finally
        {
            l.unlock();
        }
    }

    public void pop(int tId)
    {
        l.lock();
        try
        {
            while(!cheio)
            {
                try
                {
                    System.out.printf("%d nao conseguiu entrar, lista vazia\n",tId);
                    cond.await();
                }catch(InterruptedException e){}
            }
            System.out.printf("%d removeu %d \n",tId,lista.get(0));
            lista.remove(0);
            cheio = false;
            cond.signalAll();
        }
        finally
        {
            l.unlock();
        }
    }

    public int peek()
    {
        int ret = lista.get(0);
        return ret;
    }


    public static void main(String [] args)
    {
        SyncChan s = new SyncChan();

        produtor p = new produtor(1,s);
        produtor p2 = new produtor(2,s);
        consumidor c = new consumidor(3,s);
        consumidor c2 = new consumidor(4,s);
        p.start();
        p2.start();
        c.start();
        c2.start();
    }
}



class produtor extends Thread
{
    SyncChan s;
    int i;
    public produtor(int id,SyncChan s)
    {
         this.i = id;
        this.s = s;
    }
    public void run()
    {
        while(s.max > 0)
        {
            s.push(i,s.max);
            s.max--;
        }
    }
}


class consumidor extends Thread
{
    int i;
    SyncChan s;
    public consumidor(int id,SyncChan s)
    {
        this.i = id;
        this.s = s;
    }
    public void run()
    {
        while(s.max > 0)
        {
            s.pop(i);
            s.max--;
        }
    }
}
