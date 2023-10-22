import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Main {

    public static void main(String[] args) throws ParseException {

        String piInDate; // input date parameter
        int piAdj; // adjustment amount parameter 
        String piAdjType; // adjustment type parameter
        String piInFmt; // input date format parameter
        String piOutFmt; // output date format parameter

        String inFmt; // working input format variable
        String outFmt; // working output format variable
        String sysFmt; // system date format
        String jobFmt; // job date format
        
        // handle special input format values
        if (piInFmt.equals("*JOBFMT")) {
            inFmt = jobFmt; 
        } else if (piInFmt.equals("*SYSTEM")) {
            inFmt = sysFmt;
        } else {
            inFmt = piInFmt;
        }

        // handle special output format values  
        if (piOutFmt.equals("*JOBFMT")) {
            outFmt = jobFmt;
        } else if (piOutFmt.equals("*SYSTEM")) {
            outFmt = sysFmt;
        } else if (piOutFmt.equals("*INFMT")) {
            outFmt = inFmt;
        } else {
            outFmt = piOutFmt;
        }

        // handle special input date values
        if (piInDate.equals("*SYSTEM")) {
            piInDate = new SimpleDateFormat(sysFmt).format(new Date()); 
        } else if (piInDate.equals("*JOBDATE")) {
            piInDate = new SimpleDateFormat(jobFmt).format(new Date()); 
        }
        
        // convert input date to Date object
        Date inDate = new SimpleDateFormat(inFmt).parse(piInDate);
        
        // calculate new date with adjustment
        if (piAdjType.equals("D")) {
            // adjust days
            inDate = new Date(inDate.getTime() + (piAdj * 24 * 60 * 60 * 1000));
        } else if (piAdjType.equals("M")) {
            // adjust months
            inDate.setMonth(inDate.getMonth() + piAdj);
        } else if (piAdjType.equals("Y")) {
            // adjust years
            inDate.setYear(inDate.getYear() + piAdj);
        }
        
        // convert adjusted date back to string with output format
        String outDate = new SimpleDateFormat(outFmt).format(inDate);
        
        // return output date string
        System.out.println(outDate);
        
    }

}