<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v21.1, Version=21.1.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript" language="javascript">
         var visibleIndex = -1;

         function OnSelectionChanged(s, e) {
             if (e.isSelected) {
                 visibleIndex = e.visibleIndex
                 StartEditGridViewRow(e.visibleIndex);
             }
         }
         function StartEditGridViewRow(visibleIndex) {
             btnSave.SetEnabled(true);
             btnCancel.SetEnabled(true);
             grid.GetRowValues(visibleIndex, 'EmployeeID;LastName;FirstName;BirthDate', OnCallbackHandler)
         }
         function OnCallbackHandler(rowValues) {
             txtEmployeeID.SetValue(rowValues[0]);
             txtLastName.SetValue(rowValues[1]);
             txtFirstName.SetValue(rowValues[2]);
             deBirthDate.SetValue(rowValues[3]);

         }
         function Update() {
             grid.PerformCallback(visibleIndex.toString());
         }
         function OnEndEditing() {
             btnSave.SetEnabled(false);
             btnCancel.SetEnabled(false);
             grid.UnselectAllRowsOnPage();
         }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" Width="605px" ClientInstanceName="grid"
                KeyFieldName="EmployeeID" OnCustomCallback="ASPxGridView1_CustomCallback">
                <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="4">
                    </dx:GridViewDataDateColumn>
                </Columns>
                <ClientSideEvents SelectionChanged="OnSelectionChanged" />
            </dx:ASPxGridView>
            <br />
            <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="500px" ClientInstanceName="panel">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server">
                        <table cellpadding="0" cellspacing="1">
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabelEmployeeID" runat="server" Text="EmployeeID">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="ASPxTextBoxEmployeeID" runat="server" Width="150px" ClientInstanceName="txtEmployeeID" ClientEnabled="false">
                                    </dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabelLastName" runat="server" Text="LastName">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="ASPxTextBoxLastName" runat="server" Width="150px" ClientInstanceName="txtLastName">
                                    </dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabelFirstName" runat="server" Text="FirstName">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="ASPxTextBoxFirstName" runat="server" Width="150px" ClientInstanceName="txtFirstName">
                                    </dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabelBirthDate" runat="server" Text="BirthDate">
                                    </dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="ASPxDateEditBirthDate" runat="server" Width="150px" ClientInstanceName="deBirthDate">
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="ASPxButtonSave" runat="server" Text="Save" ClientInstanceName="btnSave" ClientEnabled="False" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) { OnEndEditing(); Update(); }" />
                                    </dx:ASPxButton>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td align="right">
                                    <dx:ASPxButton ID="ASPxButtonCancel" runat="server" Text="Cancel" ClientInstanceName="btnCancel" ClientEnabled="False" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) { OnEndEditing(); }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
        </div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [BirthDate] FROM [Employees]" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = ?" InsertCommand="INSERT INTO [Employees] ([EmployeeID], [LastName], [FirstName], [BirthDate]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Employees] SET [LastName] = ?, [FirstName] = ?, [BirthDate] = ? WHERE [EmployeeID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
            </InsertParameters>
        </asp:AccessDataSource>
    </form>
</body>
</html>