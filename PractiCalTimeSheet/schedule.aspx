<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="PractiCalTimeSheet.schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" href="css/jquery.timepicker.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>    
    <script type="text/javascript">
        var initialized = false;
        $(function () {
            $("#datepicker").focus();
            $("#datepicker").blur(function () {
                if (!initialized) {
                    $("#datepicker").datepicker({
                        autoOpen: false
                    });
                    initialized = true;
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--    
        Data Entry screen for entering schedule

        Have a drop down to specify number of weeks to enter time for
            Calendar view to indicate how far in the future they want to go
            Max time is 2 years and warning for 6 months
            
            Generate a data entry grid

    -->
    <asp:Label ID="LabelTimeEntryDate" runat="server" Text="Select end date you want to enter schedule for" />
    &nbsp;&nbsp;&nbsp;
    <input type="text" id="datepicker"/>
</asp:Content>
