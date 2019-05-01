

package symtable;

public class MethodSTE extends STE {
    private Signature mSignature;
    public MethodSTE(String name, Signature signature, Scope scope) {
        super(name, scope);
        mSignature = signature;
        mSize = 0;
        
    }

    public MethodSTE(String name, Scope scope) {
        super(name, scope);
    }

    public void setSignature(Signature signature) {
        mSignature = signature;
    }

    public Signature getSignature() {
        return mSignature;
    }
}