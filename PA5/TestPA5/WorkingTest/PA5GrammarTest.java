
import meggy.Meggy;

class PA5GrammarTest {
  public static void main(String[] parameters) {
    new TestVarDecl().func(new CustomType());
  }
}

class CustomType {
  int a;
}

class TestVarDecl {
  // var declaration under class
  int a;
  byte b;
  boolean c;
  Meggy.Color color;
  Meggy.Button bt;
  Meggy.Tone tone;
  TestVarDecl t; // class type
  public int func(CustomType yo) {
    int aa;
    int a;
    byte bb;
    byte d;
    byte c;
    boolean cc;
    Meggy.Color ccolor;
    Meggy.Button bbtt;
    Meggy.Tone ttone;
    TestVarDecl tt; // class type
    aa = 11;
    bb = (byte)1;
    c = (byte)3;
    d = (byte)4;
    cc = true;
    a = b + c * d - 5 + c * d;
    ccolor = Meggy.Color.GREEN;
    Meggy.setPixel(bb, bb, ccolor);
    // bbtt = Meggy.Button.Up; // Button Literal
    if (Meggy.checkButton(Meggy.Button.Up) == false) {
      ttone = Meggy.Tone.Cs3;
      Meggy.toneStart(ttone, aa);
    }
    return aa;
  }
}
