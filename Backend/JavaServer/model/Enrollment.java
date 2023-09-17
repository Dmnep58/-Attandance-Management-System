package model;

import java.sql.Time;

public class Enrollment {

    private long facultyid;
    private long courseid;
    private String batch;

    private long studentid;
    private long classid;
    private Time time;

    public long getFacultyid() {
        return facultyid;
    }

    public void setFacultyid(long facultyid) {
        this.facultyid = facultyid;
    }

    public long getCourseid() {
        return courseid;
    }

    public void setCourseid(long courseid) {
        this.courseid = courseid;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public long getStudentid() {
        return studentid;
    }

    public void setStudentid(long studentid) {
        this.studentid = studentid;
    }

    public long getClassid() {
        return classid;
    }

    public void setClassid(long classid) {
        this.classid = classid;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

}
