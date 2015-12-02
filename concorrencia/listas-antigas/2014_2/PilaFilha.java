class Node
{
    int elem;
    Node left;
    Node right;
    public Node(int elem)
    {
        this.elem = elem;
        this.left = null;
        this.right = null;
    }
}

class PL 
{
   
    Node inicio = null;
     
    public synchronized QueuePush(int elem)
    {
        Node newTail = new Node(elem);
        if(inicio == null)
        {
            inicio = newTail;
        }
        else
        {
            this.get
        }
    }
}
