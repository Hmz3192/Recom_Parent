package com.zjnu.hadoop;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.FileUtil;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/20.
 */
public class HdfsUtil {
    private static Configuration conf = new Configuration();

    static {
        conf.addResource("hdfs.xml");

        // 代码配置环境变量，以免报 " Could not locate executable null\bin\winutils.exe in the Hadoop binaries."异常，其实不会影响功能
        System.setProperty("hadoop.home.dir", "/usr/local/hadoop/hadoop-2.4.0");
    }

    /**
     * @Title: uploadFileFromLocation
     * @param： in 上传文件输入流
     * @param： filePath 文件上传到hdfs上的保存路径（"/upload/"）
     * @param: fileName 文件名字
     * @return：void
     * @Description：TODO 上传文件到dataNode
     * @throws
     */
    public static void uploadFileFromLocation(InputStream in, String filePath) {
        FileSystem fs = null;
        FSDataOutputStream out = null;
        try {
            fs = FileSystem.get(conf);
            Path path = new Path(filePath);
            out = fs.create(path);
            fs.setReplication(path, (short)2); // 在hdfs集群上保存的份数，2份
            IOUtils.copyBytes(in, out, 1024);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
                out.flush();
                out.close();
                fs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * @Title: downLoadFile
     * @param：@param filePath 文件在hdfs上的路径 （"/upload/"）
     * @param：@param fileName 文件名字
     * @param：@param savePath 下载文件本地保存路径（"C:/"）
     * @return：void
     * @Description：TODO 下载文件到本地
     * @throws
     */
    public static void downLoadFile(String filePath, String fileName, String savePath) {
        FileSystem fs = null;
        FSDataInputStream in = null;
        OutputStream out = null;
        try {
            fs = FileSystem.get(conf);
            Path fileName2 = new Path(filePath + fileName);
            in = fs.open(fileName2);
            out = new BufferedOutputStream(new FileOutputStream(savePath + fileName));
            IOUtils.copyBytes(in, out, 1024, true);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
                out.flush();
                out.close();
                fs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * @Title: createFilePath
     * @param：@param filePath 文件夹名字路径（"/EvenDir"、"/EvenDir/temp"）
     * @return：boolean 创建成功返回true，失败返回false
     * @Description：TODO 创建文件夹
     * @throws
     */
    public static boolean createFilePath(String filePath) {
        FileSystem fs = null;
        try {
            fs = FileSystem.get(conf);
            Path dfs = new Path(filePath);
            return fs.mkdirs(dfs);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fs.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /**
     * @Title: createFile
     * @param：@param fileName 文件路径及文件名
     * @param：@param message 文件内容
     * @return：void
     * @Description：TODO 创建文件
     * @throws
     */
    public static void createFile(String fileName, String message) {
        FileSystem fs = null;
        FSDataOutputStream out = null;
        try {
            fs = FileSystem.get(conf);
            Path path = new Path(fileName);
            out = fs.create(path);
            out.writeUTF(message);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                out.flush();
                out.close();
                fs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * @Title: deleteFile
     * @param：@param filePath 文件、文件夹路径
     * @return：boolean 删除成功返回true，失败返回false
     * @Description：TODO 删除文件（删除文件夹与删除文件相同，若文件夹内有文件需要递归删除）
     * @throws
     */
    public static boolean deleteFile(String filePath) {
        FileSystem fs = null;
        try {
            fs = FileSystem.get(conf);
            Path fileName = new Path(filePath);
            return fs.delete(fileName, true); // 若path为文件或空目录则忽略true，否则为true时删除文件夹下所有
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fs.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /**
     * @Title: renameFile
     * @param：@param oldName 旧名字
     * @param：@param newName 新名字
     * @return：boolean 重命名返回true，失败返回false
     * @Description：TODO 文件（文件夹）重命名
     * @throws
     */
    public static boolean renameFile(String oldName, String newName) {
        FileSystem fs = null;
        try {
            fs = FileSystem.get(conf);
            Path oldPath = new Path(oldName);
            Path newPath = new Path(newName);
            return fs.rename(oldPath, newPath);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fs.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /**
     * @Title: fileExist
     * @param：@param filePath 文件（文件夹）路径
     * @return：boolean 存在返回true，不存在返回false
     * @Description：TODO 判断文件或文件夹是否存在
     * @throws
     */
    public static boolean fileExist(String filePath) {
        FileSystem fs = null;
        try {
            fs = FileSystem.get(conf);
            Path fileName = new Path(filePath);
            return fs.exists(fileName);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fs.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /**
     * @Title: fileUpdateTime
     * @param：@param filePath 文件路径及文件名
     * @return：void
     * @Description：TODO 查看文件大小及修改时间
     * @throws
     */
    public static void fileUpdateTime(String filePath) {
        FileSystem fs = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            fs = FileSystem.get(conf);
            Path fileName = new Path(filePath);
            FileStatus status = fs.getFileStatus(fileName);
            System.out.println("文件大小：" + status.getLen());
            System.out.println("文件修改时间：" + sdf.format(new Date(status.getModificationTime())));
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fs.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * @Title: fileList
     * @param：@param filePath 文件夹路径
     * @return：void
     * @Description： TODO 查看文件夹下文件名和文件路径
     * @throws
     */
    public static void fileList(String filePath) {
        FileSystem fs = null;
        try {
            fs = FileSystem.get(conf);
            Path fileName = new Path(filePath);
            FileStatus[] status = fs.listStatus(fileName);
            Path[] path = FileUtil.stat2Paths(status);
            for (Path file : path) {
                System.out.println("文件名:" + file.getName());
                System.out.println("文件路径:" + file);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fs.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
         System.out.println(createFilePath("/EvenDir/oHno"));
         System.out.println(deleteFile("/EvenDir/no"));
         System.out.println(renameFile("/EvenDir/yes", "/EvenDir/no"));
         System.out.println(fileExist("/EvenDir/temp/test11"));
        fileList("/EvenDir");
         fileUpdateTime("/TestDir/4f5b6e48f68148ad8b86931ef0219063.doc");
         createFile("/EvenDir/yes/text.txt", "even good!!");
         downLoadFile("/EvenDir/yes/", "text.txt", "E:/");


     /*   String sql = "SELECT count(1) as count FROM CRF_P2P_APP_FILE_INFO";
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Connection conn = DBManager.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if(rs.next()){
                System.out.println(rs.getString("count"));
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }*/

    }

    /**
     * 得到当前已上传记录的编号
     * @param：@return
     * @return：int
     * @throws
     */
    public static Integer getNumber() {
        BufferedReader reader = null;
        Integer num = null;
        String str = null;
        try {
            reader = new BufferedReader(new FileReader(new File("src/CurruntNum.txt")));
            str= reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(str != null && !"".equals(str.trim())){
            num = Integer.parseInt(str);
        }
        return num;
    }
    /**
     * 设置已上传编号
     * @return：void
     * @throws
     */
    public static void setNumber(String num){
        BufferedWriter writer = null;
        try {
            writer = new BufferedWriter(new FileWriter(new File("src/CurruntNum.txt")));
            writer.write(num);
        } catch (IOException e) {
            e.printStackTrace();
        } finally{
            try {
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


    }
}
