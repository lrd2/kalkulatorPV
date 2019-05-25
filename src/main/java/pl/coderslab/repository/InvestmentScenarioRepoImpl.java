package pl.coderslab.repository;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFFormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Repository;
import pl.coderslab.model.InvestmentScenario;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.*;
import java.net.URL;

@Repository
public class InvestmentScenarioRepoImpl implements InvestmentScenarioCustom, ApplicationContextAware {

    @PersistenceContext
    private EntityManager entityManager;

    ApplicationContext applicationContext = null;

    public InvestmentScenario getOutputsFromFinancialModel(InvestmentScenario investmentScenario) {

        try {
            InputStream file = InvestmentScenarioRepoImpl.class.getClassLoader().getResourceAsStream("model_finansowy.xlsx");
            XSSFWorkbook wb = new XSSFWorkbook(file);
            XSSFSheet basic = wb.getSheet("basic");
//            basic.getRow(10).getCell(7).setCellValue(investmentScenario.getPower());
            basic.getRow(10).getCell(7).setCellValue(investmentScenario.getPower());
            basic.getRow(11).getCell(7).setCellValue(investmentScenario.getPricePerKwOfInvestment());
            basic.getRow(12).getCell(7).setCellValue(investmentScenario.getContributionPercentage());
            basic.getRow(13).getCell(7).setCellValue(investmentScenario.getLoanInterestRate());
            basic.getRow(14).getCell(7).setCellValue(investmentScenario.getBankProvision());
            basic.getRow(15).getCell(7).setCellValue(investmentScenario.getSellingPrice());
            basic.getRow(16).getCell(7).setCellValue(investmentScenario.getEstateRentalPriceMonthly());
            XSSFFormulaEvaluator evaluator = new XSSFFormulaEvaluator(wb);
            evaluator.evaluateAll();
            investmentScenario.setInvestmentCapex(basic.getRow(10).getCell(10).getNumericCellValue());
            investmentScenario.setContributionCash(basic.getRow(11).getCell(10).getNumericCellValue());
            investmentScenario.setLoan(basic.getRow(12).getCell(10).getNumericCellValue());
            investmentScenario.setReturnPeriod((int) basic.getRow(13).getCell(10).getNumericCellValue());
            investmentScenario.setFcfeAfter15Years((basic.getRow(14).getCell(10).getNumericCellValue()));
            investmentScenario.setRoiAfter15Years(basic.getRow(15).getCell(10).getNumericCellValue());

            try {
                if(applicationContext !=null){
                   String path = applicationContext.getResource("generated_files").getURL().getPath();
                    System.out.println(path);
                    FileOutputStream fileOut = new FileOutputStream(path+"/model_finansowy.xlsx");
                    wb.write(fileOut);
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return investmentScenario;
    }

    public void getOutputsFromFinancialModel() {

    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}
