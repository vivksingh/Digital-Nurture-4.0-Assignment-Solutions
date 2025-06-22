public class Forecaster {
    public double predictEarning(double principalAmount, double rate, int period){
        if(period == 0) return principalAmount;

        double currentYearEarning = principalAmount * (rate + 1);
        return predictEarning(currentYearEarning, rate, period - 1);
    }
}
