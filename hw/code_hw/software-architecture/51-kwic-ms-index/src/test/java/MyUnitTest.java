import org.junit.Test;

public class MyUnitTest {

    @Test
    public void inputTest(){
        KWIC kwic = new KWIC();
        kwic.input("InputTest.txt");
        assert (kwic.getLineIndex(0) == 0);
        assert (kwic.getLineIndex(1) == 7);
        assert (kwic.getLineWordCount(0) == 2);
        assert (kwic.getLineWordCount(1) == 3);
    }

    @Test
    public void circularShiftTest(){
        KWIC kwic = new KWIC();
        kwic.input("InputTest.txt");
        kwic.circularShift();
        kwic.printCircularShift();
        /**
         * Expect:
         * 0 0
         * 0 4
         * 1 7
         * 1 11
         * 1 15
         */
    }

    @Test
    public void alphabetizeTest(){
        KWIC kwic = new KWIC();
        kwic.input("InputTest.txt");
        kwic.circularShift();
        kwic.alphabetizing();
        kwic.printAlphabetized();
    }

    @Test
    public void outputTest(){
        KWIC kwic = new KWIC();
        kwic.input("Test_Case.txt");
        kwic.circularShift();
        kwic.alphabetizing();
        kwic.output();
    }
}
