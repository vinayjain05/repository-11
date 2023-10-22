import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

// Declare date adjustment utility class
public class DateUtil {

  public static String adjustDate(String dateString, int days, String adjustType, 
      String inputFormat, String outputFormat) {
    
    LocalDate date = LocalDate.parse(dateString, DateTimeFormatter.ofPattern(inputFormat));
    
    if (adjustType.equals("*DAYS")) {
      date = date.plusDays(days);
    } else if (adjustType.equals("*MONTHS")) {
      date = date.plusMonths(days);
    } else if (adjustType.equals("*YEARS")) {
      date = date.plusYears(days);
    }
    
    return date.format(DateTimeFormatter.ofPattern(outputFormat));
  }
}

public class Main {

  public static void main(String[] args) {
   
    String inputDate = LocalDate.now().toString();
    String outputDate = DateUtil.adjustDate(inputDate, 5, "*DAYS", "yyyy-MM-dd", "MM/dd/yyyy");
    System.out.println(inputDate + " => " + outputDate);

    inputDate = LocalDate.now().toString();
    outputDate = DateUtil.adjustDate(inputDate, -10, "*DAYS", "yyyy-MM-dd", "MM/dd/yyyy");   
    System.out.println(inputDate + " => " + outputDate);

    // Test various input/output formats
    inputDate = "01/15/2023";
    outputDate = DateUtil.adjustDate(inputDate, 1, "*DAYS", "MM/dd/yyyy", "yyyy-MM-dd");
    System.out.println(inputDate + " => " + outputDate);
  
    // Test special dates
    inputDate = LocalDate.now().withDayOfMonth(1).toString();
    outputDate = DateUtil.adjustDate(inputDate, 1, "*MONTHS", "yyyy-MM-dd", "MM/dd/yyyy");
    System.out.println(inputDate + " => " + outputDate);

    // Test invalid dates
    inputDate = "02/30/2023";
    try {
      outputDate = DateUtil.adjustDate(inputDate, 1, "*DAYS", "MM/dd/yyyy", "yyyy-MM-dd"); 
    } catch (Exception e) {
      System.out.println("Invalid date: " + inputDate);
    }
  }
}