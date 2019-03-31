

package symtable;

public class VarSTE extends STE {
    private Type mType;
    private String mBase;
    private int mOffset;
    public VarSTE(String name, Type type, int offset, String base) {
        super(name, null);
        mType = type;
        mOffset = offset;
        mBase = base;
    }
    public Type getType() {
        return this.mType;
    }
}