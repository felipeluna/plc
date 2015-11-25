class node
{
	int elem;
	node left;
	node right;
	public node(int elem)
	{
		this.elem = elem;
		this.left = null;
		this.right = null;
	}
}

class Arvore
{
	// cria raiz
	node root = null;
	//verifica se arvore eh vazia
	public synchronized boolean isEmpty()
	{
		if(root == null)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	public synchronized void inserir(int elem){
		inserir(root, elem);
	}
	
	public  void inserir (node no, int elem)
	{
		if(isEmpty())
		{
			root = new node(elem);
		}
		
		else if(elem <= no.elem)
		{
			if (no.left != null)
			{
				inserir(no.left, elem);
			}
			else
			{
				//System.out.println(" Inserindo " + elem + " a esquerda de " + no.elem);
				no.left = new node(elem);
			}
		}
		else if(elem >= no.elem)
		{
			if(no.right != null)
			{
				inserir(no.right,elem);
			}
			else 
			{
				//System.out.println(" Inserindo " + elem + " a direita de " + no.elem);
				no.right = new node(elem);
			}
		}
	}
	
	public void prefixado(node no)
	{
		if(no != null)
		{
			System.out.println(no.elem + " ");
			prefixado(no.left);
			prefixado(no.right);
		}
	}
}

public class ArvoreBinaria extends Thread
{
	int max;
	Arvore a;
	public ArvoreBinaria(int max,Arvore a)
	{
		this.max = max;
		this.a = a;
	}
	
	public void run()
	{
		while(max > 0)
		{
			a.inserir((int)(Math.random()*100000));
			max--;
		}
	}
	public static void main(String [] args)
	{
		long startTime = System.currentTimeMillis();

		Arvore a = new Arvore();
		// sem threads
		/*
		for(int i = 0; i < (2000*50); i++)
		{
			int r = (int)(Math.random()*100000);
			a.inserir(r);
		}
		*/
		// com threads
		
		ArvoreBinaria arr[] = new ArvoreBinaria[50];
		int maxNumber = 2000;
		int numThreads = 50;
		for(int i = 0; i < numThreads; i++)
		{
			arr[i] = new ArvoreBinaria(maxNumber,a);
		}
		for(int i = 0; i < numThreads; i++)
		{
			arr[i].start();
		}
		for(int i = 0; i < numThreads; i++)
		{
			try
			{
				arr[i].join();
			}
			catch
			(InterruptedException e){}
		}
		
		//a.prefixado(a.root);

		long endTime   = System.currentTimeMillis();
		long totalTime = (endTime - startTime);
		System.out.println("\n" + totalTime);
	}
}
