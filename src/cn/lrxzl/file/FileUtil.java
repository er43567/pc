package cn.lrxzl.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import net.sf.json.JSONObject;

import org.apache.http.util.TextUtils;
import org.apache.struts2.ServletActionContext;

import sun.misc.BASE64Decoder;



public class FileUtil {
	
	public static void generateImage(String imgStr,String path,String newFileName,String ext){
		//bean.Base64.generateImage(imgStr, "D:\\temp\\a.jpg");
		if (imgStr != null) {
			int p = imgStr.indexOf(",");
			String head = imgStr.substring(0, p);
			String datas = imgStr.substring(p + 1);
			System.out.println("FULL-Path:" + path + "\\" + newFileName + "." + ext);
			BASE64Decoder decoder = new BASE64Decoder();
			try {
				// 解密
				byte[] b = decoder.decodeBuffer(datas);
				// 处理数据
				for (int i = 0; i < b.length; ++i) {
					if (b[i] < 0) {
						b[i] += 256;
					}
				}
				
				OutputStream out1 = new FileOutputStream(path + "\\" + newFileName + "." + ext);
				out1.write(b);
				out1.flush();
				out1.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static String getImageExtFromBase64(String imgStr) {
		if(imgStr==null)return "";
		int p = imgStr.indexOf(",");
		String head = imgStr.substring(0, p);
		String result = head.substring(head.indexOf("/")+1,head.indexOf(";"));
		return result;
	}
	
	public static void delFile(String path,String fileName[]){
		for(int i=0;i<fileName.length;i++) {
			if(!TextUtils.isEmpty(fileName[i])) {
				File f = new File(path + fileName[i]);
				if(f.exists())
					f.delete();
			}
		}
	}
	
}
