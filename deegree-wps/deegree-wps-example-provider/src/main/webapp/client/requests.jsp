<%-- $HeadURL: svn+ssh://mschneider@svn.wald.intevation.org/deegree/deegree3/trunk/deegree-demos/deegree-wps-demo/src/main/webapp/client/requests.jsp $ --%>
<%-- $Id: requests.jsp 24332 2010-05-12 09:10:38Z sthomas $ --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="false" errorPage="error.jsp"
	import="java.io.*,java.util.*,java.awt.event.*"%>
<%
final File dir = new File( getServletContext().getRealPath( "/client/requests" ) );

final JspWriter o = out;

ActionListener listener = new ActionListener() {
    
    private void go(File[] fs) throws IOException{
        if(fs == null) return;
        for(File f : fs){
            if(f.isDirectory()){
               	o.println("DIR " + f.getName());
               	go(f.listFiles());
                o.println("END DIR");
            }else{
                o.println("REQUEST " + f.getName());
            }
        }
    }
    
    public void actionPerformed(ActionEvent evt){
        try{
	        go(dir.listFiles());
        }catch(IOException e){
            // eat it, it's a JSP...
        }
	}
};

listener.actionPerformed(null);
%>
