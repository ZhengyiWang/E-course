package classes;

/**
 * Created by cfenglv on 2016/12/28.
 */
public class ProblemInfo {
	String problem;
	String a;
	String b;
	String c;
	String d;
	public ProblemInfo(){}
	public ProblemInfo(String problem, String a, String b, String c, String d) {
		this.problem = problem;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
	}
	public String getProblem() {
		return problem;
	}

	public String getA() {
		return a;
	}

	public String getB() {
		return b;
	}

	public String getC() {
		return c;
	}

	public String getD() {
		return d;
	}

	public void setA(String a) {
		this.a = a;
	}

	public void setB(String b) {
		this.b = b;
	}

	public void setC(String c) {
		this.c = c;
	}

	public void setD(String d) {
		this.d = d;
	}
}
