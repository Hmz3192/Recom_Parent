
package com.zjnu.recom.offline;

import com.zjnu.model.ArticleRating;
import org.apache.commons.io.Charsets;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.common.iterator.FileLineIterable;

import java.io.*;
import java.util.List;
import java.util.regex.Pattern;

public final class GroupLensDataModel extends FileDataModel {

    private static final String COLON_DELIMTER = "::";
    private static final Pattern COLON_DELIMITER_PATTERN = Pattern.compile(COLON_DELIMTER);


    /**
     * @param ratingsFile GroupLens ratings.dat file in its native format
     * @throws IOException if an error occurs while reading or writing files
     */
    public GroupLensDataModel(File ratingsFile) throws IOException {
        super(convertGLFile(ratingsFile));
    }

    public GroupLensDataModel(List<ArticleRating> articleRating) throws IOException {
        super(convert2File());
    }


    //离线记录下来的数据转换为txt，这个可以不用管
    private static File convertGLFile(File originalFile) throws IOException {
        // Now translate the file; remove commas, then convert "::" delimiter to comma
        File resultFile = new File(new File(System.getProperty("java.io.tmpdir")), "ratings.txt");
//        File resultFile = new File("E:\\WorkSpace\\IdeaWorkSpace\\Recom_Parent\\rec_blog\\blog_controller\\src\\main\\resources\\ratings.txt");
        if (resultFile.exists()) {
            resultFile.delete();
        }
        try {
            Writer writer = new OutputStreamWriter(new FileOutputStream(resultFile), Charsets.UTF_8);

            for (String line : new FileLineIterable(originalFile, false)) {
                int lastDelimiterStart = line.lastIndexOf(COLON_DELIMTER);
                if (lastDelimiterStart < 0) {
                    throw new IOException("Unexpected input format on line: " + line);
                }
                String subLine = line.substring(0, lastDelimiterStart);
                String convertedLine = COLON_DELIMITER_PATTERN.matcher(subLine).replaceAll(",");
                writer.write(convertedLine);
                writer.write('\n');
            }
            writer.close();

        } catch (IOException ioe) {
            resultFile.delete();
            throw ioe;
        }
        return resultFile;
    }


    //
    private static File convert2File() throws IOException {
        // Now translate the file; remove commas, then convert "::" delimiter to comma


        File resultFile = new File(new File(System.getProperty("java.io.tmpdir")), "ratings.txt");
        if (resultFile.exists()) {
            resultFile.delete();
        }

        try {
            Writer writer = new OutputStreamWriter(new FileOutputStream(resultFile), Charsets.UTF_8);
            for (String line : new FileLineIterable(resultFile, false)) {
                int lastDelimiterStart = line.lastIndexOf(COLON_DELIMTER);
                if (lastDelimiterStart < 0) {
                    throw new IOException("Unexpected input format on line: " + line);
                }
                String subLine = line.substring(0, lastDelimiterStart);
                String convertedLine = COLON_DELIMITER_PATTERN.matcher(subLine).replaceAll(",");
                writer.write(convertedLine);
                writer.write('\n');
            }
        } catch (IOException ioe) {
            resultFile.delete();
            throw ioe;
        }


        return resultFile;
    }


    @Override
    public String toString() {
        return "GroupLensDataModel";
    }

}
