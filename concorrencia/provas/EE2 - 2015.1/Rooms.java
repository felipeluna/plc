import java.util.Random;
import java.util.concurrent.locks.*;

public class Rooms
{
    static boolean ocupado;
    static int ocupadoId;
    static int contador; // se o contador chegar a zero o quarto esta livre
    static Lock l = new ReentrantLock();
    static Condition free = l.newCondition();
    static int maxQuartos;
    static room array[];
    static int vezes = 5;
    public static void main(String [] args)
    {
        ocupado = false;
        maxQuartos = 4;
        array = new room[maxQuartos];
        contador = 0;
        int numPessoas = 5;
        ocupadoId = 0;
        Pessoa arrayP [] = new Pessoa[numPessoas];
        for(int i = 0; i < maxQuartos; i++)
        {
            array[i] = new room(i);
        }

        for(int i = 0; i < numPessoas; i++)
        {
            arrayP[i] = new Pessoa(vezes, maxQuartos,i);
        }

        for(int i = 0; i < numPessoas; i++)
        {
            arrayP[i].start();
        }

        for(int i = 0; i < numPessoas; i++)
        {
            try
            {
            arrayP[i].join();
            } catch (InterruptedException e){}
        }
        System.out.printf("acabou! contador = %d\n",contador);
    }
}
class room
{
    int id; //quarto comeca vazio

    public room (int id)
    {
        this.id = id;
    }
    public void entrar(int pessoaId)
    {
        Rooms.l.lock();
        try
        {
            // se tem algum quarto ocupado e nao eh esse, espere
            while(Rooms.ocupadoId != id && Rooms.ocupado)
            {
                try
                {
                    System.out.printf("pessoa %d tentou entrar no quarto %d\n",pessoaId, id);
                    Rooms.free.await();
                } catch (InterruptedException e){};
            }
            //seta o quarto pra ocupado
            //diz qual id que esta ocupado
            Rooms.ocupadoId = id;
            //uma pessoa entrou no quarto, o contador aumenta;
            Rooms.contador++;
            System.out.printf("pessoa %d entrou no quarto de numero %d. %d pessoas\n",pessoaId,id, Rooms.contador);

        }
        finally
        {
            Rooms.ocupado = true;
            Rooms.l.unlock();
        }

    }
    public void sair(int pessoaId)
    {
        Rooms.l.lock();
        try
        {           
            Rooms.contador--;
            System.out.printf("pessoa %d saiu do quarto %d. %d pessoas\n",pessoaId, id, Rooms.contador);
            if(Rooms.contador == 0)
            {
                Rooms.ocupado = false;
                System.out.printf("quarto %d vazio\n",id);
            } 
        }
        finally
        {
            Rooms.free.signalAll();
            Rooms.l.unlock();
        }

    }
}

class Pessoa extends Thread
{
    int maxQuartos;
    int pessoaId;
    int vezes;
    public Pessoa(int vezes, int maxQ, int pessoaId)
    {
        this.vezes = vezes;
        this.maxQuartos = maxQ;
        this.pessoaId = pessoaId;
    }

    public void run()
    {
        int loopinho = 0;
        while(loopinho < vezes)
        {

            Random r = new Random();
            int Low = 0;
            int High = maxQuartos;
            int Result = r.nextInt(High-Low) + Low;
            Rooms.array[Result].entrar(pessoaId);
            try
            {
                Thread.sleep(1000);

            }catch (InterruptedException e){}
            Rooms.array[Result].sair(pessoaId);
            loopinho++;
        }
    }
}

