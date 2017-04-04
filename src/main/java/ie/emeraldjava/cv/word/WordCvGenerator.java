package ie.emeraldjava.cv.word;

import org.apache.poi.util.Units;
import org.apache.poi.xwpf.converter.pdf.PdfConverter;
import org.apache.poi.xwpf.converter.pdf.PdfOptions;
import org.apache.poi.xwpf.usermodel.*;
import org.hr_xml._v2017_04_15.EmployerOrgDataType;
import org.hr_xml._v2017_04_15.Resume;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by pauloconnell on 03/04/17.
 */
public class WordCvGenerator {

    public static String output = "paul.oconnell.cv.docx";
    public static String output_pdf = "paul.oconnell.cv.pdf";


    public static void main(String[] args) throws Exception {
        WordCvGenerator wordCvGenerator = new WordCvGenerator();
        wordCvGenerator.generateCV();
    }

    public void generateCV() throws Exception {

        Resume resume = loadResumeObject();

        XWPFDocument document = new XWPFDocument();

        XWPFParagraph title = document.createParagraph();
        title.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun titleRun = title.createRun();
        titleRun.setText("Build Your REST API with Spring");
        titleRun.setColor("009933");
        titleRun.setBold(true);
        titleRun.setUnderline(UnderlinePatterns.DASH_LONG);
        titleRun.setFontFamily("Courier");
        titleRun.setFontSize(20);

        XWPFParagraph subTitle = document.createParagraph();
        subTitle.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun subTitleRun = subTitle.createRun();
        subTitleRun.setText("from HTTP fundamentals to API Mastery");
        subTitleRun.setColor("00CC44");
        subTitleRun.setFontFamily("Courier");
        subTitleRun.setFontSize(16);
        subTitleRun.setTextPosition(20);
        subTitleRun.setUnderline(UnderlinePatterns.DOT_DOT_DASH);

        XWPFParagraph image = document.createParagraph();
        image.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun imageRun = image.createRun();
        imageRun.setTextPosition(20);
        //Path imagePath = Paths.get(ClassLoader.getSystemResource(logo).toURI());
        //imageRun.addPicture(Files.newInputStream(imagePath), XWPFDocument.PICTURE_TYPE_PNG, imagePath.getFileName().toString(), Units.toEMU(50), Units.toEMU(50));

        XWPFParagraph sectionTitle = document.createParagraph();
        XWPFRun sectionTRun = sectionTitle.createRun();
        sectionTRun.setText("What makes a good API?");
        sectionTRun.setColor("00CC44");
        sectionTRun.setBold(true);
        sectionTRun.setFontFamily("Courier");

        XWPFParagraph paragraph = document.createParagraph();
        List<EmployerOrgDataType> employments = getEmployments(resume);
        for(EmployerOrgDataType employment : employments) {
            processEmployerOrgDataType(employment,paragraph);

        }

//        XWPFParagraph para1 = document.createParagraph();
//        para1.setAlignment(ParagraphAlignment.BOTH);
//        String string1 = "convertTextFileToString(paragraph1)";
//        XWPFRun para1Run = para1.createRun();
//        para1Run.setText(string1);

//        XWPFParagraph para2 = document.createParagraph();
//        para2.setAlignment(ParagraphAlignment.RIGHT);
//        String string2 = "convertTextFileToString(paragraph2)";
//        XWPFRun para2Run = para2.createRun();
//        para2Run.setText(string2);
//        para2Run.setItalic(true);
//
//        XWPFParagraph para3 = document.createParagraph();
//        para3.
//        para3.setAlignment(ParagraphAlignment.LEFT);
//        para3.setIndentationFirstLine(2);
//        String string3 = "convertTextFileToString(paragraph3)";
//        XWPFRun para3Run = para3.createRun();
//        para3Run.setText(string3);

        FileOutputStream out = new FileOutputStream(output);
        document.write(out);
        out.close();
        document.close();

        //PdfOptions options=PdfOptions.create().fontEncoding("windows-1250");
        //PdfConverter.getInstance().convert(document, out, options);

        //System.out.println("Generate " + fileOutName + " with "+ (System.currentTimeMillis() - startTime)+ " ms.");
    }

    void processEmployerOrgDataType(EmployerOrgDataType employerOrgDataType,XWPFParagraph paragraph) {
        XWPFRun paraRun = paragraph.createRun();
        paraRun.setText(employerOrgDataType.getEmployerOrgName());
        paraRun.addBreak();
        paraRun.setText(employerOrgDataType.getEmployerContactInfo().getLocationSummary().getRegion().get(0));
        paraRun.setText(" - ");
        paraRun.setText(employerOrgDataType.getEmployerContactInfo().getLocationSummary().getMunicipality());
        paraRun.addBreak();

        paraRun.setText(employerOrgDataType.getPositionHistory().get(0).getTitle());
        paraRun.addBreak();
        //paraRun.setText(employerOrgDataType.getPositionHistory().get(0).getUserArea().getAny().get(0).toString());
        paraRun.setText(employerOrgDataType.getPositionHistory().get(0).getJobLevelInfo().get(0).getComments());

        //employerOrgDataType.getPositionHistory().get(0).getDescription()

        paraRun.addCarriageReturn();
    }


    List<EmployerOrgDataType> getEmployments(Resume resume) {
        return resume.getStructuredXMLResume().getEmploymentHistory().getEmployerOrg();
    }

    Resume loadResumeObject() {
        Resume resume = null;
        try {
            JAXBContext context = JAXBContext.newInstance(Resume.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            resume = (Resume) unmarshaller.unmarshal(loadCvXmlFile());
        } catch(Exception e){
            e.printStackTrace();
        }
        return resume;
    }

    File loadCvXmlFile() {
        File cvFile = Paths.get("./src/main/xml/index.xml").toFile();
        System.out.println("WordCvGenerator "+cvFile.getAbsolutePath());
        return cvFile;
    }
}
