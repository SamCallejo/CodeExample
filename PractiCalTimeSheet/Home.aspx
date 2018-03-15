<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PractiCalTimeSheet.Home1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" href="css/jquery.timepicker.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>    <!--
    <link href="css/ui-lightness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.7.2.custom.min.js"type="text/javascript"></script>
    -->
    
    <script type="text/javascript">
        $(document).ready(function () {
            //setup new person dialog
            $('#newTimeEntry').dialog({
                autoOpen: false,
                draggable: true,
                width: 600,
                height:500,
                title: "Add New Time Entry",
                open: function (type, data) {
                    $(this).parent().appendTo("form");
                }
            });
        });

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
        function showDialog(id) {
            $('#' + id).dialog("open");
        }

        function closeDialog(id) {
            $('#' + id).dialog("close");
        }
        function PopupPicker(ctl) {
            var PopupWindow = null;
            PopupWindow = window.open('PopupCalendar.aspx?Ctl=' + ctl, 'PopupWindow', 'width=10,height=250,resizable=yes');
            PopupWindow.focus();
            return false;
        };

        $(function () {
            var spinnerhours = $("#spinnerhours").spinner({ min: 0 });

            $("#disable").on("click", function () {
                if (spinnerhours.spinner("option", "disabled")) {
                    spinnerhours.spinner("enable");
                } else {
                    spinnerhours.spinner("disable");
                }
            });
            $("#destroy").on("click", function () {
                if (spinnerhours.spinner("instance")) {
                    spinnerhours.spinner("destroy");
                } else {
                    spinnerhours.spinner();
                }
            });
            $("#getvalue").on("click", function () {
                alert(spinnerhours.spinner("value"));
            });
            $("#setvalue").on("click", function () {
                spinnerhours.spinner("value", 5);
            });

            $("button").button();
        });

        $(function () {
            var spinnerhours = $("#spinnerminutes").spinner({min: 0});

            $("#disable").on("click", function () {
                if (spinnerminutes.spinner("option", "disabled")) {
                    spinnerminutes.spinner("enable");
                } else {
                    spinnerminutes.spinner("disable");
                }
            });
            $("#destroy").on("click", function () {
                if (spinnerminutes.spinner("instance")) {
                    spinnerminutes.spinner("destroy");
                } else {
                    spinnerminutes.spinner();
                }
            });
            $("#getvalue").on("click", function () {
                alert(spinnerminutes.spinner("value"));
            });
            $("#setvalue").on("click", function () {
                spinnerminutes.spinner("value", 5);
            });

            $("button").button();
        });
        /*
        $(function () {
            $("#timepicker").timepicker({});
        });
        */
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="mainScriptManager" runat="server"></asp:ScriptManager>
    <div id='newTimeEntry'>
        <asp:UpdatePanel ID="upNewUpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="true" runat="server">
            <ContentTemplate>
                <asp:Label ID="LabelTimeEntryDate" runat="server" Text="Entry Date" />
                &nbsp;&nbsp;&nbsp;
                <input type="text" id="datepicker"/>
                <!--
                <asp:textbox id="tbMyDate" runat="server" Width="80px"></asp:textbox>
                <a href="" onclick="return PopupPicker('tbMyDate')"><img src="Images/Calendar_scheduleHS.png" alt="Picture" border="0"></a>
                -->
                <br />
                <asp:Label ID="LabelTimeEntryTask" runat="server" AssociatedControlID="DropDownListTask" Text="Select Task"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownListTask" runat="server">   
                    <asp:ListItem Selected="True">Task1</asp:ListItem>
                    <asp:ListItem>Task2</asp:ListItem>
                    <asp:ListItem>Task3</asp:ListItem>
                </asp:DropDownList><br />
                <br />
                <asp:Label ID="LabelCommonTask" runat="server" Text="Last Selected Task" />
                <br />
                <asp:ListBox ID="ListBoxCommonTask" runat="server">
                    <asp:ListItem>Task1</asp:ListItem>
                    <asp:ListItem>Task2</asp:ListItem>
                </asp:ListBox>
                <br />
                <asp:Label ID="LabelTimeEntryOrganization" runat="server" AssociatedControlID="DropDownListClient" Text="Select Client"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownListClient" runat="server">   
                    <asp:ListItem Selected="True">Client1</asp:ListItem>
                    <asp:ListItem>Client1</asp:ListItem>
                    <asp:ListItem>Client1</asp:ListItem>
                </asp:DropDownList><br />
                <asp:Label ID="LabelTimeStarted" runat="server" Text="Please indicate time you started task" />
                <asp:RegularExpressionValidator 
                    ID="RegularExpressionValidatorTimeStarted" 
                    runat="server" 
                     ControlToValidate="TextBoxStartTime"
                    ErrorMessage="<br/><font color='Red'>Please enter valid start time value example '09:00 AM'</font>"
                    ValidationExpression="^[[0-1][0-9]:[0-5][0-9] [AP]M$"
                    ValidationGroup="TimeStart"
                    Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTimeStarted" 
                    runat="server"
                    ControlToValidate="TextBoxStartTime"
                    ErrorMessage="<br/><font color='Red'>Time value required</font>"
                    ValidationGroup="TimeStart"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBoxStartTime" runat="server" ValidationGroup="TimeStart" />
                <br />
                <asp:Label ID="LabelTimeEnded" runat="server" Text="Please indicate time you completed task" />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBoxEndTime" runat="server" ValidationGroup="TimeStart" />
                <!--
                    NOTE: SBC

                    If person enters a start time, they will need to specify an end time.  
                    Disable or hide the number of hours and minutes worked

                    If they enter a number of hours and minutes worked, disable start and end time

                    Create List Radio buttons
                    3 Ways to enter time
                    1.  Enter hours and minutes worked (block time)
                    2.  Enter start and end time
                    3.  Timer (stop watch)

                    Need to flag overtime
                    Cannot work more than 6 days in a row
                -->
                <br />
                <asp:Label ID="LabelTimeSpent" runat="server" Text="Please indicate time spent" />
                <br />&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LabelHours" runat="server" Text="Hours" />
                &nbsp;&nbsp;
                <!--
                <asp:TextBox ID="TextBoxHours" runat="server" />
                -->
                <input id="spinnerhours" type="text" maxlength="2" size="2" />
                &nbsp;&nbsp;
                <asp:Label ID="LabelMinutes" runat="server" Text="Minutes" />
                &nbsp;&nbsp;
                <input id="spinnerminutes" type="text" maxlength="2" size="2" />
                <br /><br />
                <asp:Label ID="LabelComments" runat="server" Text="Comments" />
                <br />
                <asp:TextBox ID="TextBoxComments" runat="server" TextMode="MultiLine" Height="84px" Width="474px"></asp:TextBox>
                <br />
                <!--
                    Hi There,

                    Say you have a textbox like follows:
                    <asp:TextBox id="txtMyTextBox" runat="Server" Text="1234"></asp:TextBox>
                    In javascript do the following to get value:
                    var value = document.getElementById('<%=txtMyTextBox.ClientID%>').value;
                    As TextBox is server control, so on runtime this control have different client id
                    '<%=txtMyTextBox.ClientID%>' will return control clientid on runtime
                -->
                <asp:Button ID="btnAddSave" OnClick="btnAddSave_Click" runat="server" Text="Save" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <table>
        <tr>
            <td>
                <b><asp:Label ID="LabelEmployeeName" runat="server" Text="Employee Name"></asp:Label></b>
            </td>
            <td>
                <!--
                    SBC: Notes

                    For this version, don't allow admin the ability to modify time entries of other employees.
                    will need this ability in the future
                    
                -->
                <asp:Literal ID="LiteralEmployeeName" runat="server" Text="Sam Callejo"></asp:Literal>
                <asp:DropDownList ID="DropDownListEmployees" runat="server">   
                    <asp:ListItem Selected="True">Sam Callejo</asp:ListItem>
                    <asp:ListItem>Tom Brady</asp:ListItem>
                    <asp:ListItem>Joe Montana</asp:ListItem>
                </asp:DropDownList><br />

            </td>
        </tr>
        <tr>
            <td>
                <b><asp:Label ID="LabelOrganization" runat="server" Text="Organization"></asp:Label></b>
            </td>
            <td>
                <asp:Literal ID="LiteralOrganization" runat="server" Text="Practi-Cal"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td>
                <b><asp:Label ID="LabelPosition" runat="server" Text="Position"></asp:Label></b>
            </td>
            <td>
                <asp:Literal ID="LiteralPosition" runat="server" Text="Software Developer"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top">
                <b><asp:Label ID="LabelEmployementStatus" runat="server" Text="Employement Status&nbsp;&nbsp;"></asp:Label></b>
            </td>
            <td>
                <!-- Do we really need to show and end date.  Is it enought to indicate a status with a start date.
                     such as 'Active (Start Date: 2/7/2018)' to 'Terminated (Start Date: 2/7/2016 End Date: 2/7/2018)
                -->
                <asp:Literal ID="LiteralEmploymentStatus" runat="server" Text="Active (Start Date: 2/7/2018)"></asp:Literal>
                <br />
                <asp:Literal ID="LiteralPayStatus" runat="server" Text="Part Time"></asp:Literal>
                <br />
                <!-- Where is Pay rate in the database -->
                <asp:Literal ID="LiteralPayRate" runat="server" Text="$90.00 per hour"></asp:Literal>
                <br />
                <!-- Where is Holiday Pay in the database -->
                <asp:Literal ID="LiteralHolidayPay" runat="server" Text="Not Eligible for holiday pay"></asp:Literal>
                <br />    
            </td>
        </tr>
        <tr>
            <td>
                <b><asp:Label ID="LabelHoursExpectedToWork" runat="server" Text="Number of hours you are expected to work for this date" /></b>
            </td>
            <td>
                <!--
                    NOTE: SBC

                    This value will be determined by the number of hours entered in the schedule.
                    or the number of hours the employee has or number of hours for that position.

                    If position based get that value from the database
                -->
                <asp:Literal ID="LiteralExpectedToWork" runat="server" Text="8" />
            </td>
        </tr>
        <tr>
            <td>
                <b><asp:Label ID="LabelTotalNumberOfHoursForThisDate" runat="server" Text="Total number of hours recorded for this date" /></b>
            </td>
            <td>
                <asp:Literal ID="LiteralNumberOfHoursForThisDate" runat="server" Text="4" />
            </td>
        </tr>
        <tr>
            <td>
                <b><asp:Label ID="LabelTotalNumberOfHoursLeftForThisDate" runat="server" Text="Total number of hours left for this date" /></b>
            </td>
            <td>
                <asp:Literal ID="Literal1" runat="server" Text="4" />
            </td>
        </tr>
    </table>
    <br />
    <br /><br />
    <input id="btnAdd" type="button" onclick="showDialog('newTimeEntry');" value="Add New Time Entry" />
    <br /><br />
    <asp:GridView ID="gridView" DataKeyNames="stor_id" runat="server"
        AutoGenerateColumns="false" ShowFooter="true" HeaderStyle-Font-Bold="true"
        onrowcancelingedit="gridView_RowCancelingEdit"
        onrowdeleting="gridView_RowDeleting"
        onrowediting="gridView_RowEditing"
        onrowupdating="gridView_RowUpdating"
        onrowcommand="gridView_RowCommand"
        OnRowDataBound="gridView_RowDataBound">
        <Columns>
        <asp:TemplateField HeaderText="stor_id">
            <ItemTemplate>
                <asp:Label ID="txtstorid" runat="server" Text='<%#Eval("stor_id") %>'/>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="lblstorid" runat="server" width="40px" Text='<%#Eval("stor_id") %>'/>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="instorid" width="40px" runat="server"/>
                <asp:RequiredFieldValidator ID="vstorid" runat="server" ControlToValidate="instorid" Text="?" ValidationGroup="validaiton"/>
            </FooterTemplate>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="stor_name">
              <ItemTemplate>
                 <asp:Label ID="lblname" runat="server" Text='<%#Eval("stor_name") %>'/>
             </ItemTemplate>
             <EditItemTemplate>
                 <asp:TextBox ID="txtname" width="70px"  runat="server" Text='<%#Eval("stor_name") %>'/>
             </EditItemTemplate>
             <FooterTemplate>
                 <asp:TextBox ID="inname"  width="120px" runat="server"/>
                 <asp:RequiredFieldValidator ID="vname" runat="server" ControlToValidate="inname" Text="?" ValidationGroup="validaiton"/>
             </FooterTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="stor_address">
             <ItemTemplate>
                 <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("stor_address") %>'/>
             </ItemTemplate>
             <EditItemTemplate>
                 <asp:TextBox ID="txtaddress" width="70px"  runat="server" Text='<%#Eval("stor_address") %>'/>
             </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="inaddress" width="110px"  runat="server"/>
                <asp:RequiredFieldValidator ID="vaddress" runat="server" ControlToValidate="inaddress" Text="?" ValidationGroup="validaiton"/>
            </FooterTemplate>
         </asp:TemplateField>
          <asp:TemplateField HeaderText="city">
               <ItemTemplate>
                 <asp:Label ID="lblcity" runat="server" Text='<%#Eval("city") %>'/>
             </ItemTemplate>
             <EditItemTemplate>
                 <asp:TextBox ID="txtcity" width="50px"   runat="server" Text='<%#Eval("city") %>'/>
             </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="incity" width="60px"  runat="server"/>
                <asp:RequiredFieldValidator ID="vcity" runat="server" ControlToValidate="incity" Text="?" ValidationGroup="validaiton"/>
            </FooterTemplate>
         </asp:TemplateField>
           <asp:TemplateField HeaderText="state">
             <ItemTemplate>
                 <asp:Label ID="lblstate" runat="server" Text='<%#Eval("state") %>'/>
             </ItemTemplate>
             <EditItemTemplate>
                 <asp:TextBox ID="txtstate" width="30px"  runat="server" Text='<%#Eval("state") %>'/>
             </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="instate" width="40px"   runat="server"/>
                <asp:RequiredFieldValidator ID="vstate" runat="server" ControlToValidate="instate" Text="?" ValidationGroup="validaiton"/>
            </FooterTemplate>
         </asp:TemplateField>
            <asp:TemplateField HeaderText="zip">
             <ItemTemplate>
                 <asp:Label ID="lblzip" runat="server" Text='<%#Eval("zip") %>'/>
             </ItemTemplate>
            <EditItemTemplate>
                 <asp:TextBox ID="txtzip" width="30px"  runat="server" Text='<%#Eval("zip") %>'/>
             </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="inzip" width="40px"   runat="server"/>
                <asp:RequiredFieldValidator ID="vzip" runat="server" ControlToValidate="inzip" Text="?" ValidationGroup="validaiton"/>
            </FooterTemplate>
         </asp:TemplateField>
         <asp:TemplateField>
            <EditItemTemplate>
                <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update"  Text="Update"  />
                <asp:Button ID="ButtonCancel" runat="server" CommandName="Cancel"  Text="Cancel" />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit"  Text="Edit"  />
                <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete"  Text="Delete"  />
            </ItemTemplate>
            <FooterTemplate>
                <asp:Button ID="ButtonAdd" runat="server" CommandName="AddNew"  Text="Add New Row" ValidationGroup="validaiton" />
            </FooterTemplate>
         </asp:TemplateField>
         </Columns>
    </asp:GridView>
    <br />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblmsg" runat="server"></asp:Label>

</asp:Content>
