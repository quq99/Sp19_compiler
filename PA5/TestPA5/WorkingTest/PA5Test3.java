
import meggy.Meggy;

class PA5Test3 {
  public static void main(String[] parameters) {
    new MixedTest().mixedTestOne(); 
    new TestTimes().test();
  }
}

class MixedTest {
  public void mixedTestOne() {
    MeggyHelper _This_1s_a_1dentifi3r;
    int a;
    a = 1;
    _This_1s_a_1dentifi3r = new MeggyHelper();
    while(a == 1) {
      _This_1s_a_1dentifi3r.setColorByLine(2, Meggy.Color.YELLOW);
      Meggy.delay(80);
      _This_1s_a_1dentifi3r.setColorByLine(2, Meggy.Color.RED);
      Meggy.delay(80);
      _This_1s_a_1dentifi3r.setColorByLine(2, Meggy.Color.VIOLET);
      Meggy.delay(80);
      _This_1s_a_1dentifi3r.setColorByLine(2, Meggy.Color.ORANGE);
      Meggy.delay(80);
      _This_1s_a_1dentifi3r.setColorByLine(3, Meggy.Color.WHITE);
      Meggy.delay(80);
      _This_1s_a_1dentifi3r.setColorByLine(5, Meggy.Color.VIOLET);
      Meggy.delay(80);
      _This_1s_a_1dentifi3r.setColorByLine(7, Meggy.Color.GREEN);
      Meggy.delay(80);
      _This_1s_a_1dentifi3r.setColorByLine(4, Meggy.Color.WHITE);
      Meggy.delay(80);
      _This_1s_a_1dentifi3r.setColorByLine(5, Meggy.Color.GREEN);
      _This_1s_a_1dentifi3r.setColorByLine(1, Meggy.Color.GREEN);
      _This_1s_a_1dentifi3r.setColorByLine(3, Meggy.Color.VIOLET);
      _This_1s_a_1dentifi3r.setColorByLine(6, Meggy.Color.RED);
      _This_1s_a_1dentifi3r.setColorByLine(2, Meggy.Color.VIOLET);
      _This_1s_a_1dentifi3r.sing();
      _This_1s_a_1dentifi3r.comparePixel((byte)0, (byte)1, (byte)2, (byte)3);
      a = 0;
    }
  }
}

class MeggyHelper {
  public void setColorByLine(int l, Meggy.Color c) {
    int i;
    i = 0;
    while (i < 8) {
      Meggy.setPixel((byte)i, (byte)l, c);
      i = i + 1;
    }
  }

  public void sing() {
    int i;
    int duration;
    i = 0;
    duration = 120;
    while (i < 10) {
      Meggy.toneStart(Meggy.Tone.C3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.Cs3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.D3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.Ds3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.E3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.F3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.Fs3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.G3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.Gs3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.A3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.As3, duration);
      Meggy.delay(5);
      Meggy.toneStart(Meggy.Tone.B3, duration);      
      Meggy.delay(5);
      i = i + 1;
    }
  }

  public boolean comparePixel(byte x0, byte y0, byte x1, byte y1) {
    boolean res;
    if (Meggy.getPixel(x0, y0) == Meggy.getPixel(x1, y1)) {
      res = true;
    } else {
      res = false;
    }
    return res;
  }
}

class TestTimes {
  int a;
  public void test() {
    a = (byte)1 * (byte)2;
  }
}
