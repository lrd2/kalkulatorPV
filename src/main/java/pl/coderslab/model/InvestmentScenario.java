package pl.coderslab.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table
public class InvestmentScenario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @ManyToOne
    private User user;

    //input values
    @NotNull
    private double power;
    @NotNull
    private double pricePerKwOfInvestment;
    @NotNull
    private double contributionPercentage;
    private double loanInterestRate;
    private double bankProvision;
    @NotNull
    private double sellingPrice;
    @NotNull
    private double estateRentalPriceMonthly;

    //output values

    private double investmentCapex;
    private double contributionCash;
    private double loan;
    private int returnPeriod;
    private double fcfeAfter15Years;
    private double roiAfter15Years;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public double getPower() {
        return power;
    }

    public void setPower(double power) {
        this.power = power;
    }

    public double getPricePerKwOfInvestment() {
        return pricePerKwOfInvestment;
    }

    public void setPricePerKwOfInvestment(double pricePerKwOfInvestment) {
        this.pricePerKwOfInvestment = pricePerKwOfInvestment;
    }

    public double getContributionPercentage() {
        return contributionPercentage;
    }

    public void setContributionPercentage(double contributionPercentage) {
        this.contributionPercentage = contributionPercentage;
    }

    public double getLoanInterestRate() {
        return loanInterestRate;
    }

    public void setLoanInterestRate(double loanInterestRate) {
        this.loanInterestRate = loanInterestRate;
    }

    public double getBankProvision() {
        return bankProvision;
    }

    public void setBankProvision(double bankProvision) {
        this.bankProvision = bankProvision;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public double getEstateRentalPriceMonthly() {
        return estateRentalPriceMonthly;
    }

    public void setEstateRentalPriceMonthly(double estateRentalPriceMonthly) {
        this.estateRentalPriceMonthly = estateRentalPriceMonthly;
    }

    public double getInvestmentCapex() {
        return investmentCapex;
    }

    public void setInvestmentCapex(double investmentCapex) {
        this.investmentCapex = investmentCapex;
    }

    public double getContributionCash() {
        return contributionCash;
    }

    public void setContributionCash(double contributionCash) {
        this.contributionCash = contributionCash;
    }

    public int getReturnPeriod() {
        return returnPeriod;
    }

    public void setReturnPeriod(int returnPeriod) {
        this.returnPeriod = returnPeriod;
    }

    public double getFcfeAfter15Years() {
        return fcfeAfter15Years;
    }

    public void setFcfeAfter15Years(double fcfeAfter15Years) {
        this.fcfeAfter15Years = fcfeAfter15Years;
    }

    public double getRoiAfter15Years() {
        return roiAfter15Years;
    }

    public void setRoiAfter15Years(double roiAfter15Years) {
        this.roiAfter15Years = roiAfter15Years;
    }

    public double getLoan() {
        return loan;
    }

    public void setLoan(double loan) {
        this.loan = loan;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
