/*
2) Faça um programa em java no qual recebe duas matrizes quadráticas nxn, m1 e m2. Então roda m1 * m2 com 1 a n threads (Se aproveitando ao máximo do paralelismo) e retorna os tempos necessários para fazer os cálculos com os diferentes números de threads, ressaltando o que tiver gasto menos tempo.
*/
class Multiply extends Thread
{

    public synchronized int[] incrementPosition()
    {
        int a[] = new int[2];
        if(MatrixThread.y < MatrixThread.n - 1)
        {
            //the firs y retorned is already plus 1, so start with -1;
            MatrixThread.y = MatrixThread.y + 1;
        }
        else if(MatrixThread.x < MatrixThread.n)
        {
            MatrixThread.x = MatrixThread.x + 1;
            MatrixThread.y = 0;
        }
        a[0] = MatrixThread.x;
        a[1] = MatrixThread.y;
        return a;
    }    

    public void run()
    {
        while(MatrixThread.x < MatrixThread.n && MatrixThread.y < MatrixThread.n)
        {
            int a[] = incrementPosition();
            int x = a[0];
            int y = a[1];
            if(x == MatrixThread.n)
            {
                break;
            }
            // System.out.println(a[0]);
            // System.out.println(a[1]);
            MatrixThread.mR[x][y] = MatrixThread.m1[x][y] * MatrixThread.m2[x][y];
        }
    }

}

public class MatrixThread
{
    static int[][] m1;
    static int[][] m2;
    static int[][] mR;
    static int x, y,n ; //index of matrix
    public static void main (String [] args)
    {

        n = 10;
        x = 0;
        y = -1;
        m1 = new int[n][n];
        m2 = new int[n][n];
        mR = new int[n][n];
        //fill the matrix
        fillMatrix(m1);
        fillMatrix(m2);
        printMatrix(m1);
        System.out.println("----------------");
        printMatrix(m2);
        System.out.println("----------------");

        //call thread Multiply
        Multiply arr[] = new Multiply[n];
        for(int i = 0; i < n; i++)
        {
            arr[i] = new Multiply();
        }
        for(int i = 0; i < n; i++)
        {
            arr[i].start();
        }
        for(int i = 0; i < n; i++)
        {
            try
            {
                arr[i].join(); 
            }
            catch(InterruptedException e){}
        }
        printMatrix(mR);
    }
    public static void fillMatrix(int[][]m)
    {
        for(int i = 0; i < n; i++)
        {
            for(int j = 0; j < n; j++)
            {
                m[i][j] = (int)(Math.random() * 20);
            }
        }
    }
    public static void printMatrix(int[][]m)
    {
        for(int i = 0; i < n; i++)
        {
            for(int j = 0; j < n; j++)
            {
                System.out.print(m[i][j]+ " " );
            }  
            System.out.println();
        }
    }
}
