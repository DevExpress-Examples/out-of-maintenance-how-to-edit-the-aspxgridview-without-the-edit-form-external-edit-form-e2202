Imports System
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub ASPxGridView1_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
		AccessDataSource1.UpdateParameters("EmployeeID").DefaultValue = ASPxTextBoxEmployeeID.Value.ToString()
		AccessDataSource1.UpdateParameters("LastName").DefaultValue = ASPxTextBoxLastName.Value.ToString()
		AccessDataSource1.UpdateParameters("FirstName").DefaultValue = ASPxTextBoxFirstName.Value.ToString()
		AccessDataSource1.UpdateParameters("BirthDate").DefaultValue = Convert.ToDateTime(ASPxDateEditBirthDate.Value).ToShortDateString()

		'for example purpose only, because online editing is not supported
		Throw New Exception("Editing in online example is not supported") 'remove this line when testing the project

		AccessDataSource1.Update() 'Uncomment this line

		Dim gridView As ASPxGridView = DirectCast(sender, ASPxGridView)
		gridView.DataBind()
	End Sub
End Class