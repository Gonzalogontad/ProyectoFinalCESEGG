/*
 * webPage.h
 *
 *  Created on: 18 jun. 2020
 *      Author: root
 */

#ifndef _WEBPAGE_H_
#define _WEBPAGE_H_

const char HttpWebPage[]="<html><body id=\"body\" onload='carBody()'><p><script>/*<![CDATA[*/var acPan;function carPan(){var a=new XMLHttpRequest();a.onreadystatechange=function(){if(this.readyState==4&&this.status==200){var g=this.responseText;var f=g.substring(g.indexOf(\"$paneldata\")+10);acPan=g.charAt(g.indexOf(\"$panelnum\")+9);document.getElementById(\"b1\").value=str[acPan];var b=0;for(var c=0;c<6;c++){var e=document.getElementById(\"c\"+c);e.innerHTML=f;var d=0;while((elemento=document.getElementById(\"p\"+d))!=null){elemento.id=\"p\"+d+c;b++;d++}}window.setInterval(function(){carDat(\"GET\",\"/data\")},1000)}};a.open(\"GET\",\"/panel\",true);a.send()}/*]]>*/</script><script>/*<![CDATA[*/var str=[\"Test Drivers\",\"Test Temporizadores\",\"Guardar\",\"Iniciar\",\"Parar\",\"Iniciar todo\",\"Parar todo\"];function carDat(a,b){var c=new XMLHttpRequest();c.onreadystatechange=function(){if(this.readyState==4&&this.status==200){var e=JSON.parse(this.responseText);if(e.panel==acPan){for(j=0;j<6;j++){for(i=0;i<8;i++){var d=document.getElementById(\"p\"+i+j);var f=e.data[i*6+j];if(d.type==\"number\"){if(d.value==\"\"){d.value=f}}else{d.value=str[f];if(f>10){if(f>20){d.style.background=\"#ff6347\"}else{d.style.background=\"#7CFC00\"}}}}}}else{carPan()}}};c.open(a,b,true);c.send()}/*]]>*/</script><script>/*<![CDATA[*/function guardar(b){var a;a=parseInt(b.slice(2));req=\"/save$\"+acPan+\"$\"+b+\"$data:[\"+document.getElementById(\"p\"+3+a).value;for(i=4;i<7;i++){req=req+\",\"+document.getElementById(\"p\"+i+a).value}req=req+\"]\";document.getElementById(\"b4\").value=req;carDat(\"POST\",req)}/*]]>*/</script><script>/*<![CDATA[*/function carBody(){var a=new XMLHttpRequest();a.onreadystatechange=function(){if(this.readyState==4&&this.status==200){var b=this.responseText;document.getElementById(\"body\").innerHTML+=b;carPan(\"GET\",\"/panel\")}};a.open(\"GET\",\"/body\",true);a.send()}/*]]>*/</script><script>function envBot(b){var a=new XMLHttpRequest();a.open(\"GET\",\"/button$\"+acPan+\"$\"+b,true);a.send()};</script></p></body></html>";

const char HttpBody[]="<div id=\"base\" style=\"width:100%;height:10%\"><table border=\"0\"style=\"width: 100%; height: 100%\"><tbody><tr><td style=\"width:5%;height:100%\"><input type=\"button\" id=\"b0\" onclick='envBot(this.id)' style=\"width:100%;height:100%\"></button></td><td style=\"width:50%;height:100%\"><input type=\"button\" id=\"b1\" style=\"width:100%;height:100%\"></button></td><td style=\"width:5%;height:100%\"><input type=\"button\" id=\"b2\" onclick='envBot(this.id)' style=\"width:100%;height:100%\"></button></td><td style=\"width:40%;height:100%\"><input type=\"button\" id=\"b4\" onclick='envBot(this.id)' style=\"width:100%;height:100%\"></button></td></tr></tbody></table></div><div id=\"panel\" style=\"width:100%;height:90%\"><table border=\"0\"style=\"width: 100%; height: 100%\"><tbody><tr><td id=\"c0\" style=\"width:16.66%;height:100%\"></td><td id=\"c1\" style=\"width:16.66%;height:100%\"></td><td id=\"c2\" style=\"width:16.66%;height:100%\"></td><td id=\"c3\" style=\"width:16.66%;height:100%\"></td><td id=\"c4\" style=\"width:16.66%;height:100%\"></td><td id=\"c5\" style=\"width:16.66%;height:100%\"></td></tr></tbody></table></table></div>";

const char panel0[] = "$panelnum1$paneldata<input type=\"button\" id=\"p0\" onclick=\'envBot(this.id)\' style=\"width: 100%;height: 17%;\" ></button><br><input type=\"button\" id=\"p1\" onclick=\'envBot(this.id)\' style=\"width: 100%; height: 17%;\" ></button><br><input type=\"button\" id=\"p2\" onclick=\'envBot(this.id)\' style=\"width: 100%; height: 17%;\" ></button><br><label style=\"font-size:1.8vh;\">Parametro 1:</label><br><input type=\"number\"id=\"p3\" onclick=\'envBot(this.id)\' style=\"width: 100%; height: 7%;\" ></button><br><label style=\"font-size:1.8vh;\">Parametro 2:</label><br><input type=\"number\" id=\"p4\" onclick=\'envBot(this.id)\' style=\"width: 100%; height: 7%;\" ></button><br><label style=\"font-size:1.8vh;\">Parametro 3:</label><br><input type=\"number\" id=\"p5\" onclick=\'envBot(this.id)\' style=\"width: 100%; height: 7%;\" ></button><br><label style=\"font-size:1.8vh;\">Parametro 4:</label><br><input type=\"number\" id=\"p6\" onclick=\'envBot(this.id)\' style=\"width: 100%; height: 7%;\"></button><br><input type=\"button\" id=\"p7\" value = \"Guardar\" onclick=\'guardar(this.id)\' style=\"width: 100%; height: 10%;\"></button><br>";

//const char panel0[] ="{\"panel\":1,\"ptype\":0,\"x\":6,\"y\":2,\"string\":[1,1,1,1,1,1,2,2,2,2,2,2],\"etype\":[2,2,2,2,2,2,1,1,1,1,1,1]}";
const char pageData0[]="{\"panel\":1,\"data\":[1,1,1,1,1,1,2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2,1,1,1,1,1,1,2,2,2,2,2,2]}";
const char ok[]="OK";
const char requestError[] = "HTTP/1.1 400 OK";


char *actualPageData;
char *actualPanel;


#endif /* PROYECTOS_CESE_PROYECTOFINALGG_PROYECTOFINALCESEGG_SOFT_MODPRINCIPALCIAA_INC_WEBPAGE_H_ */
