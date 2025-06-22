public class Main {
    public static void main(String[] args) {
        double currentEarning = 100;
        double growthRate = 0.4;
        int investmentPeriod = 10;

        Forecaster predictor = new Forecaster();
        double totalEarning = predictor.predictEarning(currentEarning, growthRate, investmentPeriod);
        System.out.println("Total money earned after " + investmentPeriod + " years, at the rate of " + growthRate + "% is : " + totalEarning);
    }
}
