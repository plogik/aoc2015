import java.io.*;

public class Day01 {
    public static void main(String[] args) throws IOException {

        String path = "../input.txt";

        System.out.println("Pt1: " + SolvePt1(path));
        System.out.println("Pt2: " + SolvePt2(path));
    }

    static int SolvePt1(String path) throws IOException {
        int floor = 0;
        BufferedReader reader = new BufferedReader(new FileReader(path));
        int c;

        while((c = reader.read()) != -1) {
            floor += c == '(' ? 1 : -1;
        }
        return floor;
    }

    static int SolvePt2(String path) throws IOException {
        int floor = 0;
        int pos = 0;
        BufferedReader reader = new BufferedReader(new FileReader(path));
        int c;

        while((c = reader.read()) != -1) {
            floor += c == '(' ? 1 : -1;
            pos++;
            if(floor == -1)
                break;
        }
        return pos;
    }
}

