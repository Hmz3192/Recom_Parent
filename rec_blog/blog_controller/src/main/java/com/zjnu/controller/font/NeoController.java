package com.zjnu.controller.font;

import com.zjnu.neo4j.Match2D3;
import com.zjnu.pojo.NeoResultJson;
import com.zjnu.utils.ConstantPara;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/19.
 */
@Controller
public class NeoController {

    @RequestMapping("/rel/{queryString}")
    @ResponseBody
    public String rel(@PathVariable("queryString") String queryString) {
        Match2D3 example = new Match2D3(ConstantPara.NEO_URL, ConstantPara.NEO_USER, ConstantPara.NEO_PASS);
        NeoResultJson neoData = example.getNeoData(queryString);
        example.close();
        return neoData.getResultJson();
    }
}
