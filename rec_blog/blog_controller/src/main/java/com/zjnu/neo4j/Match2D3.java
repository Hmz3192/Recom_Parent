package com.zjnu.neo4j;

import com.zjnu.pojo.NeoResultJson;
import org.neo4j.driver.v1.*;
import org.neo4j.driver.v1.types.Node;
import org.neo4j.driver.v1.types.Path;
import org.neo4j.driver.v1.types.Relationship;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import static org.neo4j.driver.v1.Values.parameters;

public class Match2D3 {


    Driver driver;

    public Match2D3(String uri, String user, String password) {
        driver = GraphDatabase.driver(uri, AuthTokens.basic(user, password));
    }

    //界面传回操作请求，拼成Match语句查库，查库结果拼成json格式写json文件
    public void gernerateJsonFile(String queryString) {
        Session session = driver.session();

        // Auto-commit transactions are a quick and easy way to wrap a read.
        StatementResult result = session.run(
                "MATCH p=(n:People{name: {x}})-[*..1]-() RETURN p", parameters("x", queryString));

        StringBuffer nodes = new StringBuffer();
        StringBuffer links = new StringBuffer();
        nodes.append("\"nodes\":[");
        links.append("\"links\":[");

        List<String> sameName = new ArrayList<>();
        while (result.hasNext()) {
            Record record = result.next();
            System.out.println(record);
            List<Value> list = record.values();
            for (Value v : list) {
                Path p = v.asPath();
                for (Node n : p.nodes()) {
                    if (!sameName.contains(String.valueOf(n.get("name")))) {
                        sameName.add(String.valueOf(n.get("name")));
//                    System.out.println(n.labels());
                        nodes.append("{");
//                    System.out.println(n.size());
                        int num = 0;
                        for (String k : n.keys()) {
//                        System.out.println(k+"-"+n.get(k));
                            nodes.append("\"" + k + "\":" + n.get(k) + ",");
                            num++;
                            if (num == n.size()) {
                                nodes.append("\"id\":" + n.id());
                            }
                        }
                        nodes.append("},");
                    }
                }
                nodes = new StringBuffer(nodes.toString().substring(0, nodes.toString().length() - 1));
//                System.out.println(p);

                for (Relationship r : p.relationships()) {
//                    System.out.println(n.labels());
                    links.append("{");
                    System.out.println(r);
                    int num = 0;
                    links.append("\"source\":" + r.startNodeId() + "," + "\"target\":" + r.endNodeId());
                    links.append(",\"type\":\"" + r.type() + "\"");
                    links.append("},");
                }
                links = new StringBuffer(links.toString().substring(0, links.toString().length() - 1));

            }
            nodes.append(",");
            links.append(",");

        }
        nodes = new StringBuffer(nodes.toString().substring(0, nodes.toString().length() - 1));
        links = new StringBuffer(links.toString().substring(0, links.toString().length() - 1));

        nodes.append("]");
        links.append("]");
        System.out.println(nodes.toString());
        System.out.println(links.toString());
        String resultJson = "{" + nodes + "," + links + "}";
        System.out.println(resultJson);
        System.out.println(nodes.toString());


        try {
            File file = new File("E:\\WorkSpace\\IdeaWorkSpace\\Recom_Parent\\rec_blog\\blog_controller\\src\\main\\webapp\\resource\\neo4j\\Neo4jSon.json");
            if (file.exists()) {
                file.delete();
                file.createNewFile();
            }
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(resultJson.getBytes());
            fos.close();
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public NeoResultJson getNeoData(String queryString) {
        Session session = driver.session();

        // Auto-commit transactions are a quick and easy way to wrap a read.
        StatementResult result = session.run(
                "MATCH p=(n:People{name: {x}})-[*..1]-() RETURN p", parameters("x", queryString));

        StringBuffer nodes = new StringBuffer();
        StringBuffer links = new StringBuffer();
        nodes.append("\"nodes\":[");
        links.append("\"links\":[");

        NeoResultJson neoResultJson = new NeoResultJson();
        List<String> sameName = new ArrayList<>();
        List<NeoResultJson.NeoUser> neoUsers = new ArrayList<>();
        while (result.hasNext()) {
            Record record = result.next();
            System.out.println(record);
            List<Value> list = record.values();
            for (Value v : list) {
                Path p = v.asPath();
                for (Node n : p.nodes()) {
                    if (!sameName.contains(String.valueOf(n.get("name")))) {
                        sameName.add(String.valueOf(n.get("name")));
//                    System.out.println(n.labels());
                        nodes.append("{");
//                    System.out.println(n.size());
                        int num = 0;
                        NeoResultJson.NeoUser neoUser;
                        String name="",sex="",power="",intro="",age = "";
                        for (String k : n.keys()) {
                            if (k.equalsIgnoreCase("name")) {
                                name = String.valueOf(n.get(k));
                            }
                            if (k.equalsIgnoreCase("sex")) {
                                sex = String.valueOf(n.get(k));
                            }
                            if (k.equalsIgnoreCase("power")) {
                                power = String.valueOf(n.get(k));
                            }
                            if (k.equalsIgnoreCase("intro")) {
                                intro = String.valueOf(n.get(k));
                            }
                            if (k.equalsIgnoreCase("age")) {
                                age = String.valueOf(n.get(k));
                            }
//                        System.out.println(k+"-"+n.get(k));
                            nodes.append("\"" + k + "\":" + n.get(k) + ",");
                            num++;
                            if (num == n.size()) {
                                nodes.append("\"id\":" + n.id());
                            }
                        }
                        neoUser = new NeoResultJson.NeoUser(name, age,sex, power, intro);
                        nodes.append("},");
                        neoUsers.add(neoUser);
                    }
                }
                nodes = new StringBuffer(nodes.toString().substring(0, nodes.toString().length() - 1));
//                System.out.println(p);

                for (Relationship r : p.relationships()) {
//                    System.out.println(n.labels());
                    links.append("{");
                    System.out.println(r);
                    int num = 0;
                    links.append("\"source\":" + r.startNodeId() + "," + "\"target\":" + r.endNodeId());
                    links.append(",\"type\":\"" + r.type() + "\"");
                    links.append("},");
                }
                links = new StringBuffer(links.toString().substring(0, links.toString().length() - 1));

            }
            nodes.append(",");
            links.append(",");

        }

        nodes = new StringBuffer(nodes.toString().substring(0, nodes.toString().length() - 1));
        links = new StringBuffer(links.toString().substring(0, links.toString().length() - 1));

        nodes.append("]");
        links.append("]");
        System.out.println(nodes.toString());
        System.out.println(links.toString());
        String resultJson = "{" + nodes + "," + links + "}";
        System.out.println(resultJson);
        System.out.println(nodes.toString());
        neoResultJson.setNeoUsers(neoUsers);
        neoResultJson.setResultJson(resultJson);
/*
        try {
            File file = new File("E:\\WorkSpace\\IdeaWorkSpace\\Recom_Parent\\rec_blog\\blog_controller\\src\\main\\webapp\\resource\\neo4j\\Neo4jSon.json");
            if (file.exists()) {
                file.delete();
                file.createNewFile();
            }
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(resultJson.getBytes());
            fos.close();
        }catch (Exception e)
        {
            e.printStackTrace();
        }
*/

        return neoResultJson;
    }


    public void close() {
        // Closing a driver immediately shuts down all open connections.
        driver.close();
    }

    public static void main(String... args) {
        Match2D3 example = new Match2D3("bolt://101.201.234.133:7687", "neo4j", "123456");

//        example.gernerateJsonFile(queryString);
        example.close();
    }
}
