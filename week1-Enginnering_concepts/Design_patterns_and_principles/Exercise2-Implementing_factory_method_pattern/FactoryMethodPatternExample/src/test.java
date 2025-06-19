public class test {
    public static void main(String[] args) {
        DocumentFactory factory = new ExcelDocumentFactory();
        Document document = factory.createDocument();
        document.open();

        factory = new WordDocumentFactory();
        document = factory.createDocument();
        document.open();

        factory = new PdfDocumentFactory();
        document = factory.createDocument();
        document.open();
    }
}
