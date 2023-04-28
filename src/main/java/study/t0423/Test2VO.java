package study.t0423;

public class Test2VO {
	private String name;
	private String hakbun;
	private int kor;
	private int eng;
	private int mat;
	private int soc;
	private int sic;
	private int tot;
	private double avg;
	private char grade;
	
	public Test2VO(String name, String hakbun, int kor, int eng, int mat, int soc, int sic, int tot, double avg,   // 생성자를 통한 값 주입 (생성할 때 값을 넣음)
			char grade) {
		super();
		this.name = name;
		this.hakbun = hakbun;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.soc = soc;
		this.sic = sic;
		this.tot = tot;
		this.avg = avg;
		this.grade = grade;
	}
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getHakbun() {
		return hakbun;
	}


	public void setHakbun(String hakbun) {
		this.hakbun = hakbun;
	}


	public int getKor() {
		return kor;
	}


	public void setKor(int kor) {
		this.kor = kor;
	}


	public int getEng() {
		return eng;
	}


	public void setEng(int eng) {
		this.eng = eng;
	}


	public int getMat() {
		return mat;
	}


	public void setMat(int mat) {
		this.mat = mat;
	}


	public int getSoc() {
		return soc;
	}


	public void setSoc(int soc) {
		this.soc = soc;
	}


	public int getSic() {
		return sic;
	}


	public void setSic(int sic) {
		this.sic = sic;
	}


	public int getTot() {
		return tot;
	}


	public void setTot(int tot) {
		this.tot = tot;
	}


	public double getAvg() {
		return avg;
	}


	public void setAvg(double avg) {
		this.avg = avg;
	}


	public char getGrade() {
		return grade;
	}


	public void setGrade(char grade) {
		this.grade = grade;
	}




	@Override
	public String toString() {
		return "Test2VO [name=" + name + ", hakbun=" + hakbun + ", kor=" + kor + ", eng=" + eng + ", mat=" + mat + ", soc="
				+ soc + ", sic=" + sic + ", tot=" + tot + ", avg=" + avg + ", grade=" + grade + "]";
	}
}
