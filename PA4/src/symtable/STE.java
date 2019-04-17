

package symtable;

public class STE {
    private String mName;
    private Scope mScope;
    protected int mSize;
    public STE(String name, Scope scope) {
        mName = name;
        mScope = scope;
    }
    // public STE(String name) {
    //     mName = name;
    // }
    public String getName() {
        return mName;
    }
    public Scope getScope() {
        return mScope;
    }
    public int getSize() {
        return mSize;
    }
    public void setSize(int size) {
        mSize = size;
    }
}