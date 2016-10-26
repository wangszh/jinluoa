//*********************************************************************************
/*
WEB Server设置部分 start
*/

//济南开发环境 start
//var webdomain ="http://192.168.100.208"; //WEB服务登录处理路径/index  WIFI
//var webdomain1="http://192.168.100.207"; //WEB服务登录处理路径/index 2G 3G 4G
//济南开发环境 end
//家开发环境 start
//var webdomain = "http://192.168.1.6"; //WEB服务登录处理路径/index  WIFI
//var webdomain1 = "http://192.168.1.7"; //WEB服务登录处理路径/index 2G 3G 4G
//家开发环境 end
//对外演示环境 start
//var webdomain = "http://221.173.238.194:8085"; //WEB服务登录处理路径/index  WIFI
//var webdomain1 = "http://221.173.238.194:8085"; //WEB服务登录处理路径/index 2G 3G 4G
//对外演示环境 end
//青岛实际环境 start
var webdomain ="http://202.196.0.5:8080"; //WEB服务登录处理路径/index  WIFI
var webdomain1="http://206.196.0.5:8080"; //WEB服务登录处理路径/index 2G 3G 4G
//青岛实际环境 end

var webserviceurl = "/webservice/service.asmx"; //WebService相对URL地址，与webdomain合并成一个完整地址。虚拟站点的webservice
//var webserviceurl = "/webservice/service.asmx"; //WebService相对URL地址，与webdomain合并成一个完整地址。新站点的webservice
var djczurl = "/common/dj_rediredtavxsa.asp";//单据操作链接相对URL ，与webdomain合并成一个完整地址
var sqfjurl = "/AtthFiles/oasqfj/";//申请附件链接相对URL，与webdomain合并成一个完整地址

var cappicuri = "/common/upfile.asp";//拍照上传服务器接收地址

var rsa_n ="BAB7BF0A68823C081FA574CF5C0BA38E16F458F3323DA2A04254A3AFCEC59D48B08B589A1024C0A7A009DEA98D132A6BED6E0795F65A9DB8D0B325CB8885926227A67AD13B9BAF71053DCC1D21D94094A53782DB134AF60E6C6DDDD86DB427410E8D824475B68953F2E5A0E1461AE8809121D4ACA5F3265FCA3D6F0F44644BDF";//rsa加密公钥

/*
WEB Server设置部分 end
*/

//*********************************************************************************

/*
APP初始参数 设置部分 start
*/

/*
APP初始参数 设置部分 end
*/

//*********************************************************************************

/*
APP自定义函数 设置部分 start
*/
/*
tourl iscroll转向传递参数
*/
function tourl(url)
{
	//debugger;
	try
	{
		kset("tourl",url);
	}
	catch(err)
	{
		txt="此页面存在一个错误。\n\n";
		txt+="错误名称：" + e.name + "\n\n";
		txt+="错误信息：" + e.message + "\n\n";
		txt+="错误描述: " + err.description + "\n\n";
		txt+="点击OK继续。\n\n";
		alert(txt)
	}
	//$.mobile.changePage("to.html", "slide");
	location.href="to.html";	
}

function kjsonset(key, value){  
    //console.log("key"+key+"value"+value);  
    window.localStorage.setItem(key,JSON.stringify(value));  
}  
  
function kjsonget(key){  
    //console.log(key);  
    return JSON.parse(window.localStorage.getItem(key));  
}

function kset(key, value){  
    //console.log("key"+key+"value"+value);  
    window.localStorage.setItem(key, value);  
}  
  
function kget(key){  
    //console.log(key);  
    return window.localStorage.getItem(key);  
}  
  
function kremove(key){  
    window.localStorage.removeItem(key);  
}  
  
function kclear(){  
    window.localStorage.clear();  
}  
//测试更新方法  
function kupdate(key,value){  
    window.localStorage.removeItem(key);  
    window.localStorage.setItem(key, value);  
}

function request(url,paras){ 
	//var url = location.href;  
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
	var paraObj = {}  
	for (i=0; j=paraString[i]; i++){  
		paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
	}  
	var returnValue = paraObj[paras.toLowerCase()];  
	if(typeof(returnValue)=="undefined"){  
		return "";  
	}else{  
		return returnValue;
	}  
} 

//判断是否是日期型
function IsDate(sm,mystring) {
  var reg = /^(\d{4})-(\d{2})-(\d{2})$/;
  var str = mystring;
  var arr = reg.exec(str);
  if (str=="") return true;
  if (!reg.test(str)&&RegExp.$2<=12&&RegExp.$3<=31){
   //alert("请保证"+sm+"中输入的日期格式为yyyy-mm-dd或正确的日期!");
   return false;
   }
   return true;
 }

/*
APP自定义函数 设置部分 end
*/
 //*********************************************************************************