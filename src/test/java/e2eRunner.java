import com.intuit.karate.*;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.presentation.PresentationMode;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class e2eRunner {

    @BeforeAll
    public static void setPath(){

    }

    @Test
    public void testParallel() {
//        System.setProperty("karate.env", "UAT"); // ensure reset if other tests (e.g. mock) had set env in CI
        String karateOutputPath = "target/cucumber-html-reports";
        Results results = Runner.path("classpath:KarateSampleFeatures/JenkinsTest.feature")
                .outputCucumberJson(true)
                .parallel(1);
        generateReport(results.getReportDir());
//        asserEquals(results.getErrorMessages(), results.getFailCount() == 0);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());

    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Karate_Demo");
        config.addPresentationModes(PresentationMode.RUN_WITH_JENKINS);
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}
