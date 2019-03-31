

package symtable;

public class ClassSTE extends STE {
    private boolean mMain;
    private ClassSTE mSuperClass;
    public ClassSTE(String name, boolean main, ClassSTE superClass, Scope scope) {
        super(name, scope);
        mMain = main;
        mSuperClass = superClass;
        
    }
    public boolean getMain() {
        return mMain;
    }
}