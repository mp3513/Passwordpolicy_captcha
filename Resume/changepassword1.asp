<%@ Language=VBScript %>
<!-- #INCLUDE file="Adovbs.inc" -->
<!-- #INCLUDE file="acroinc.inc" -->

<%
stremail=Session("email")
if stremail="" then
	Response.Redirect "..\resintro.asp"
end if
%>

<!-- #include file="changepassword2.asp" -->