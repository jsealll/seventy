import java.util.ArrayList;
import java.util.Iterator;
import java.util.Collections;

public class Seventy {
    public static void main(String[] args) {
        SixNumbers l = new SixNumbers();
        ArrayList<SixNumbers> result = new ArrayList<SixNumbers>();
        branch(l, 1, result);
        Collections.sort(result);
        for (int i = 0; i < result.size(); i++) {
            System.out.println(Integer.toString(i + 1) + " : " + result.get(i).toString());
        }
    }

    static void branch(SixNumbers n, int index, ArrayList<SixNumbers> result) {
        if (n.count() == 6 && n.sum() == 70) {
            result.add(n.clone());
            return ;
        } else if (index > 45 || n.sum() > 70 || n.count() >= 6 || n.sum() + (6 - n.count()) * index > 70) {
            return ;
        }
        branch(n, index + 1, result);
        SixNumbers n1 = n.clone();
        n1.append(index);
        branch(n1, index + 1, result);
    }
}

class SixNumbers implements Comparable<SixNumbers> {
    private ArrayList<Integer> n;

    public SixNumbers() {
        this.n = new ArrayList<Integer>() ;
    }
    
    public void append(int newNumber){
        if (this.n.size() >= 6) {
            throw new ArithmeticException("try to append more than 6 numbers");
        }
        for (int i:this.n) {
            if (i == newNumber) {
                throw new ArithmeticException("try to append duplicated number");
            }
        }
        this.n.add(newNumber);
    }
    public int count() {
        return this.n.size();
    }

    public int sum() {
        int s = 0;

        for (int i: this.n) {
            s += i ;
        }

        return s;
    }

    public String toString() {
        String s = Integer.toString(this.n.get(0));

        for (int i = 1; i < this.n.size(); i++) {
            s += " " + Integer.toString(this.n.get(i));
        }

        return s;
    }
    
    public int compareTo(SixNumbers a) {
        ArrayList<Integer> na = a.getData();
        for (int i=0; i<6; i++) {
            int r = Integer.compare(this.n.get(i), na.get(i));
            if (r != 0) {
                return r;
            }
        }
        throw new ArithmeticException("Same SixNumbers exist");
    }

    public SixNumbers clone() {
        SixNumbers c = new SixNumbers();
        for (int i : this.n) {
            c.append(i);
        }
        return c;
    }

    private ArrayList<Integer> getData() {
        return this.n;
    }
}

