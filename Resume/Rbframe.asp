<% 

'if user tries to enter directly
if session("email")="" then
	 'redirct to login page	
	  Response.redirect "login.asp" 
end if
  %>	
<html>
<head>
<title></title>
</head>
    <frameset cols="*" framespacing="0" border="0" frameborder="0">
    <frameset rows="5,83%">
    <frame name="main"  scrolling="no" target="contents" marginwidth="0" marginheight="0" noresize>
      <frameset cols="120,600">
        <frame name="main1" src="leftnav.asp" target="rtop" scrolling="no" marginwidth="12" marginheight="16">
        <frame name="main2" src="introduction.asp" scrolling="auto">
      </frameset>
    </frameset>
    
  <body>
  <noframes>
  <p>This page uses frames, but your browser doesn't support them.</p>
  </noframes>
  </body>
    
</frameset>
    
  
<frameset>
</frameset>
  
<frameset rows="93" framespacing="0" border="0" frameborder="0">
  <frameset cols="204,*">
  <frame bgcolor=#ffffcc name="top1" scrolling="no" noresize target="contents"  src="../logo-1.jpg">
  <frame name="top2" scrolling="no" noresize target="contents" bgcolor=#ffffcc>
  </frameset>
</frameset>
</frameset>
  <frameset cols="204,*">
    <frame name="contents" target="main" src="../Menu%20Frame.html" scrolling="auto">
    <frame name="main" src="Introduction.asp">
</frameset>
</html>

