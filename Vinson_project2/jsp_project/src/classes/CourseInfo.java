package classes;

/**
 * Created by cfenglv on 2016/12/28.
 */
public class CourseInfo {
	String course_name;
	String learned;
	String course_number;
	String course_list;
	Double score;
	public CourseInfo() {}
	public CourseInfo(String course_name, String learned, String course_number, String course_list, String score) {
		this.course_name = course_name;
		this.course_list = course_list;
		this.learned = learned;
		this.course_number = course_number;
		this.score = Double.parseDouble(score);
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public void setCourse_number(String course_number) {
		this.course_number = course_number;
	}
	public void setCourse_list(String course_list) {
		this.course_list = course_list;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public void setLearned(String learned) {
		this.learned = learned;
	}
	public String getCourse_name(){
		return course_name;
	}
	public String getLearned(){
		return learned;
	}
	public String getCourse_list() {
		return course_list;
	}

	public Double getScore() {
		return score;
	}

	public String getCourse_number() {
		return course_number;
	}
	public boolean check(){
		int a = Integer.parseInt(this.course_number);
		int b = Integer.parseInt(this.learned);
		if(a == b) return true;
		else return false;
	}
}
