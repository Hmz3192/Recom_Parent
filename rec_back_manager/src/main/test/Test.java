import com.zjnu.utils.ReadFileUtils;
import com.zjnu.utils.StringUtil;

import java.io.File;
import java.io.IOException;

public class Test {

    @org.junit.Test
    public void test() throws Exception {
        ReadFileUtils readFileUtils = new ReadFileUtils();
        String appendixExt, content = "";
        content = readFileUtils.readWORD("E:\\WorkSpace\\IdeaWorkSpace\\Recom_Parent\\rec_back_manager\\src\\main\\webapp\\file\\docx.docx");
        System.out.println(StringUtil.deleteRNB(content));
    }

}
