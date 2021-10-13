package data;

public class DataFromTable {
    private double x;
    private double y;
    private double r;
    private String time;
    private String answer;
    private boolean isValid;
    private double scripTime;

    public DataFromTable(double x, double y, double r, String time, double scriptTime, String answer, boolean isValid) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.time = time;
        this.answer = answer;
        this.isValid = isValid;
        this.scripTime = scriptTime;
    }

    public double getScripTime() {
        return scripTime;
    }

    public void setScripTime(double scripTime) {
        this.scripTime = scripTime;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void setR(double r) {
        this.r = r;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public void setIsValid(boolean isValid) {
        this.isValid = isValid;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public String getTime() {
        return time;
    }

    public String getAnswer() {
        return answer;
    }

    public boolean getIsValid() {
        return isValid;
    }
}
