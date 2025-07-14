package ReusableUtils;

import java.io.StringWriter;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

import java.util.Properties;

public class XmlGenerator {
    public String generateXml() {
        // Setup Velocity Engine to use file-based templates
        Properties props = new Properties();
        props.setProperty("resource.loader", "file");
        props.setProperty("file.resource.loader.class",
                "org.apache.velocity.runtime.resource.loader.FileResourceLoader");
        props.setProperty("file.resource.loader.path", "src/test/java/VMTemplates"); // <-- Your directory
        props.setProperty("file.resource.loader.cache", "true");
        props.setProperty("file.resource.loader.modificationCheckInterval", "2");

        VelocityEngine velocityEngine = new VelocityEngine(props);
        velocityEngine.init();

        // Add data to context
        VelocityContext context = new VelocityContext();
        context.put("name", "Megha");
        context.put("email", "megha@example.com");
        context.put("role", "Analyst");

        // Merge with template
        StringWriter writer = new StringWriter();
        velocityEngine.mergeTemplate("VelocityXML_Template.xml", "UTF-8", context, writer);

        // Output
        return writer.toString();
    }
}