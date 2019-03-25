

package symtable;

public class VarSTE extends STE {
    private Type mType;
    private String mBase;
    private int mOffset;
    public VarSTE(String name, Type type, int offset, String base) {
        super(name, null);
        mType = type;
        mBase = base;
        mOffset = offset;
        mSize = mType.getAVRTypeSize();
    }
    public Type getType() {
        return this.mType;
    }
    /*public String getBase() {
        return this.mBase;
    }
    public int getOffset() {
        return this.mOffset;
    }*/
}