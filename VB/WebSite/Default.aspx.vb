Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxGridView

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub ASPxGridView1_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs)
		AccessDataSource1.UpdateParameters("EmployeeID").DefaultValue = ASPxTextBoxEmployeeID.Value.ToString()
		AccessDataSource1.UpdateParameters("LastName").DefaultValue = ASPxTextBoxLastName.Value.ToString()
		AccessDataSource1.UpdateParameters("FirstName").DefaultValue = ASPxTextBoxFirstName.Value.ToString()
		AccessDataSource1.UpdateParameters("BirthDate").DefaultValue = Convert.ToDateTime(ASPxDateEditBirthDate.Value).ToShortDateString()
        'AccessDataSource1.Update() 'Uncomment this line

		Dim gridView As ASPxGridView = CType(sender, ASPxGridView)
		gridView.DataBind()
	End Sub
End Class