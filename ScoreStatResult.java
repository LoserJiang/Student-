package entity;

/**
 * 成绩统计结果封装类
 */
public class ScoreStatResult {
    private int total;           // 考试总人数
    private double avgScore;     // 平均分
    private double maxScore;     // 最高分
    private double minScore;     // 最低分
    private int range1;          // 0-59
    private int range2;          // 60-69
    private int range3;          // 70-79
    private int range4;          // 80-89
    private int range5;          // 90-100

    public int getTotal() { return total; }
    public void setTotal(int total) { this.total = total; }

    public double getAvgScore() { return avgScore; }
    public void setAvgScore(double avgScore) { this.avgScore = avgScore; }

    public double getMaxScore() { return maxScore; }
    public void setMaxScore(double maxScore) { this.maxScore = maxScore; }

    public double getMinScore() { return minScore; }
    public void setMinScore(double minScore) { this.minScore = minScore; }

    public int getRange1() { return range1; }
    public void setRange1(int range1) { this.range1 = range1; }

    public int getRange2() { return range2; }
    public void setRange2(int range2) { this.range2 = range2; }

    public int getRange3() { return range3; }
    public void setRange3(int range3) { this.range3 = range3; }

    public int getRange4() { return range4; }
    public void setRange4(int range4) { this.range4 = range4; }

    public int getRange5() { return range5; }
    public void setRange5(int range5) { this.range5 = range5; }
}