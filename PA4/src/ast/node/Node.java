/* This file was generated by SableCC (http://www.sablecc.org/). 
 * Then modified.
 */

package ast.node;

import java.util.LinkedList;
import java.util.List;

@SuppressWarnings("nls")
public abstract class Node implements IVisitable, Cloneable
{
    private Node parent;
    
    // All nodes in AST need to know line and pos for good error messages.
    // Will be getting info from parser.
    private int mLine;
    private int mPos;
    
    public Node(int line, int pos) {
        this.mLine = line;
        this.mPos = pos;
    }
    
    public int getLine() { return this.mLine; }
    public int getPos() { return this.mPos; }

    // Need to know number of children to significantly reduce code for
    // things like register allocation.
    abstract public int getNumExpChildren();

    @Override
    public abstract Object clone();

    public Node parent()
    {
        return this.parent;
    }

    void parent(Node parent)
    {
        this.parent = parent;
    }

    abstract void removeChild(Node child);
    abstract void replaceChild(Node oldChild, Node newChild);

    public void replaceBy(Node node)
    {
        this.parent.replaceChild(this, node);
    }


    @SuppressWarnings("unchecked")
    protected <T extends Node> T cloneNode(T node)
    {
        if(node != null)
        {
            return (T) node.clone();
        }

        return null;
    }

    protected <T> List<T> cloneList(List<T> list)
    {
        List<T> clone = new LinkedList<T>();

        for(T n : list)
        {
            clone.add(n);
        }

        return clone;
    }
}
