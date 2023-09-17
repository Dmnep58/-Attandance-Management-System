package model;

import java.util.List;

public class Attendance {

    private long id;
    private long studentid;
    private String facultyid;
    private String batch;
    private long presentDays;
    private String status;
    private long TotalDays;
    private long percentage;
    private int AttendanceValue;
    private List<String> studentIds;
    private List<String> markvalue;

    public List<String> getMarkvalue() {
        return markvalue;
    }

    public void setMarkvalue(List<String> markvalue) {
        this.markvalue = markvalue;
    }

    public String getFacultyid() {
        return facultyid;
    }

    public void setFacultyid(String facultyid) {
        this.facultyid = facultyid;
    }

    public List<String> getStudentIds() {
        return studentIds;
    }

    public void setStudentIds(List<String> studentIds) {
        this.studentIds = studentIds;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public int getAttendanceValue() {
        return AttendanceValue;
    }

    public void setAttendanceValue(int attendanceValue) {
        AttendanceValue = attendanceValue;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getStudentid() {
        return studentid;
    }

    public void setStudentid(long studentid) {
        this.studentid = studentid;
    }

    public long getPresentDays() {
        return presentDays;
    }

    public void setPresentDays(long presentDays) {
        this.presentDays = presentDays;
    }

    public String getStatus() {
        return status;
    }

    public void setstatus(String status) {
        this.status = status;
    }

    public long getTotalDays() {
        return TotalDays;
    }

    public void setTotalDays(long totalDays) {
        TotalDays = totalDays;
    }

    public long getPercentage() {
        return percentage;
    }

    public void setPercentage(long percentage) {
        this.percentage = percentage;
    }

}
