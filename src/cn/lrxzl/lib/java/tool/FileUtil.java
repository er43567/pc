package cn.lrxzl.lib.java.tool;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class FileUtil {
	
	public static void main(String[] args) {
		/*JSONArray ja = new JSONArray();
		
		for(int i=0;i<5;i++) {
			JSONObject jo = new JSONObject();
			jo.put("filename", "filename"+i);
			jo.put("type", "public");
			jo.put("user_id", "user_id" + i);
			ja.add(jo);
		}
		
		save(ja, "C:/tmp.txt");
		*/
		
		JSONArray ja = loadFileAsJSON("C:/tmp.txt");
		for(int i=0;i<ja.size();i++) {
			JSONObject jo = ja.getJSONObject(i);
			if("user_id3".equals(jo.getString("user_id"))) {
				System.out.println(jo.getString("filename"));
			}
		}
	}
	
	public static JSONArray loadFileAsJSON(String path) {
		File file = new File(path);
		if(!file.exists()) {
			System.out.println("Conf File Not Exist!");
		} else {
			try {
				FileInputStream fis = new FileInputStream(file);
				StringBuilder txt = new StringBuilder();
				int ch;
				while((ch=fis.read())!=-1) {
					txt.append((char)ch);
				}
				JSONArray jsonArray = JSONArray.fromObject(txt.toString());
				return jsonArray;
			} catch (Exception e) {
				System.out.println("========Conf File Err=======");
				e.printStackTrace();
				System.out.println("========End of Conf File Err=======");
			}
		}
		return null;
	}
	
	public static void save(JSONArray jo, String path) {
		File file = new File(path);
		if(!file.exists()) {
			System.out.println("File Not Exist!");
			return;
		}
		FileWriter fw = null;
		try {
			fw = new FileWriter(file);
			fw.write(jo.toString());
			fw.flush();
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
