package model;


import com.spire.doc.*;
import com.spire.doc.documents.Paragraph;
import com.spire.doc.documents.TextSelection;
import com.spire.doc.fields.DocPicture;
import com.spire.doc.fields.TextRange;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class CreateByReplacingPlaceholderText {

    public static void main(String[] args) {
    }
    
    public void createPrecription(String docx, String doctorName, String doctorNumber, String doctorEmail, String medication, String patientName, String symptoms, String diagnosis, String treatmentPlan, String fileName) {
        //Load the template document  
        Document document = new Document(docx);
        //Get the first section  
        Section section = document.getSections().get(0);
        //Get the first table in the section  
        Table table = section.getTables().get(0);
        
        // Lấy thời gian hiện tại
        Date currentDate = new Date();
        
        // Tạo đối tượng SimpleDateFormat với định dạng mong muốn
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm dd/MM/yyyy");
        
        // Sử dụng SimpleDateFormat để định dạng ngày giờ
        String formattedDate = sdf.format(currentDate);

        //Create a map of values for the template  
        Map<String, String> map = new HashMap<>();
        map.put("doctorName", doctorName);
        map.put("doctorNumber", doctorNumber);
        map.put("doctorEmail", doctorEmail);
        map.put("medication", medication);
        map.put("patientName", patientName);
        map.put("symptoms", symptoms);
        map.put("diagnosis", diagnosis);
        map.put("treatmentPlan", treatmentPlan);
        map.put("currentDate", formattedDate);
        
        //Call the replaceTextinTable method to replace text in table  
        replaceTextinTable(map, table);

        //Save the result document  
        document.saveToFile(fileName, FileFormat.Docx_2013);
    }

    //Replace text in table  
    static void replaceTextinTable(Map<String, String> map, Table table) {
        for (TableRow row : (Iterable<TableRow>) table.getRows()) {
            for (TableCell cell : (Iterable<TableCell>) row.getCells()) {
                for (Paragraph para : (Iterable<Paragraph>) cell.getParagraphs()) {
                    for (Map.Entry<String, String> entry : map.entrySet()) {
                        para.replace("${" + entry.getKey() + "}", entry.getValue(), false, true);
                    }
                }
            }
        }
    }

    //Replace text with image  
    static void replaceTextWithImage(Document document, String stringToReplace, String imagePath) {
        TextSelection[] selections = document.findAllString("${" + stringToReplace + "}", false, true);
        int index = 0;
        TextRange range = null;
        for (Object obj : selections) {
            TextSelection textSelection = (TextSelection) obj;
            DocPicture pic = new DocPicture(document);
            pic.loadImage(imagePath);
            range = textSelection.getAsOneRange();
            index = range.getOwnerParagraph().getChildObjects().indexOf(range);
            range.getOwnerParagraph().getChildObjects().insert(index, pic);
            range.getOwnerParagraph().getChildObjects().remove(range);
        }
    }

    //Replace text in document body  
    static void replaceTextinDocumentBody(Map<String, String> map, Document document) {
        for (Section section : (Iterable<Section>) document.getSections()) {
            for (Paragraph para : (Iterable<Paragraph>) section.getParagraphs()) {
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    para.replace("${" + entry.getKey() + "}", entry.getValue(), false, true);
                }
            }
        }
    }

    //Replace text in header or footer  
    static void replaceTextinHeaderorFooter(Map<String, String> map, HeaderFooter headerFooter) {
        for (Paragraph para : (Iterable<Paragraph>) headerFooter.getParagraphs()) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                para.replace("${" + entry.getKey() + "}", entry.getValue(), false, true);
            }
        }
    }
}
