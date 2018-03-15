<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopupCalendar.aspx.cs" Inherits="ContontrolsExersise.PopupCalendar" %>

<%--<%@ Register src="CalenderUserControl.ascx" tagname="CalenderUserControl" tagprefix="uc1" %>--%>

<%@ Register src="CalControl.ascx" tagname="CalControl1" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" language="javascript">
        function SetDate(dateValue) {
            ctl = window.location.search.substr(1).substring(4);
            thisForm = window.opener.document.forms[0].elements[ctl].value = dateValue;
             self.close();
            }

    </script>
</head>



<body style="margin:0px;">
<form id="form1" runat="server">
<uc2:CalControl1 ID="CalControl11" runat="server" />
</form>
</body>

</html>
