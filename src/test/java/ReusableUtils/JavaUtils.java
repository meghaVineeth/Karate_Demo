package ReusableUtils;

import com.opencsv.CSVWriter;

import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class JavaUtils {
    public String currentDateByFormat(String format) {
        String timeStamp = new SimpleDateFormat(format).format(Calendar.getInstance().getTime());
        return timeStamp;
    }

    public String currentDateTimeFileName() {
        String timeStamp = new SimpleDateFormat("yyyyMMDDHHMMSS").format(Calendar.getInstance().getTime());
        return timeStamp;
    }

    public void createOrUpdateCSVFile(String completePath, String data) throws Exception{
        FileWriter outputfile = new FileWriter(completePath, true);
        CSVWriter writer = new CSVWriter(outputfile);
        String[] data1 = { data };
        writer.close();
    }

    public void createXMLUsingVelocity(String completePath, String data) throws Exception{
        FileWriter outputfile = new FileWriter(completePath, true);
        CSVWriter writer = new CSVWriter(outputfile);
        String[] data1 = { data };
        writer.close();
    }
}
