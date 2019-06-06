package hsx.com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import net.sf.json.JSONObject;


@Controller
@RequestMapping("/info")
public class InfoController{
	private final static String USER_AGENT = "Mozilla/5.0";
	
	@RequestMapping("/get")	
	public String Info(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
     String UserName=request.getParameter("UserName");
     String PassWord=request.getParameter("PassWord");   
     
	 JSONObject req=new JSONObject();
	 req.put("SchoolNum",10574);
	 req.put("UserName",UserName);
	 req.put("PassWord",PassWord);
	 
	 String result2=post(req,"https://ssp.scnu.edu.cn/api/UserValidate.ashx");
	 //System.out.println(result);

	 JSONObject ret=JSONObject.fromObject(result2);
	 
     String usename = ret.getString("UserName");
     model.addAttribute("UserName", usename);
     
     String UserXm = ret.getString("UserXm");
     model.addAttribute("UserXm", UserXm);
     
     String UserUnit = ret.getString("UserUnit");
     model.addAttribute("UserUnit", UserUnit);
     
     String UserUnitName = ret.getString("UserUnitName");
     model.addAttribute("UserUnitName", UserUnitName);
         
     String IsSir = ret.getString("IsSir");
     model.addAttribute("IsSir", IsSir);
     
     String UserType = ret.getString("UserType");
     model.addAttribute("UserType", UserType);
     
     String UserTypeName = ret.getString("UserTypeName");
	 model.addAttribute("UserTypeName", UserTypeName);
   
     return "getinfo";
     
  }
	 public static String post(JSONObject json,String URL) throws IOException {

	        HttpClient client = new DefaultHttpClient();
	        HttpPost post = new HttpPost(URL);
	        post.setHeader("Content-Type", "application/json");
	        post.addHeader("User-Agent", USER_AGENT);
	        String result = "";
	        String result2 = "";
	        
            StringEntity s = new StringEntity(json.toString(), "utf-8");
	        s.setContentEncoding(new BasicHeader(HTTP.CONTENT_TYPE,"application/json"));
	        post.setEntity(s);

	        // 发送请求
	        HttpResponse httpResponse = client.execute(post);

	        // 获取响应输入流
	        InputStream inStream = httpResponse.getEntity().getContent();
	        BufferedReader reader = new BufferedReader(new InputStreamReader(inStream, "utf-8"));
	        StringBuilder strber = new StringBuilder();
	        String line = null;
	        while ((line = reader.readLine()) != null)
	          strber.append(line + "\n");
	        //inStream.close();
	        result = strber.toString(); 	       	
	        //System.out.println(result);  
	        
	        String url="https://ssp.scnu.edu.cn/api/GetUserinf.ashx";
	        HttpGet request = new HttpGet(url);
	        //添加请求头
	        request.addHeader("User-Agent", USER_AGENT);
	        HttpResponse response = client.execute(request);
	        // 获取响应输入流
	        inStream = response.getEntity().getContent();
	        reader = new BufferedReader(new InputStreamReader(inStream, "utf-8"));
	        strber = new StringBuilder();
	        line = null;
	        while ((line = reader.readLine()) != null)
	         
	        	strber.append(line + "\n");	   
	        result2 = strber.toString();
	        //System.out.println(result2);
	        
	        return result2;
	    }
}
	    