using System;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e) {
        AccessDataSource1.UpdateParameters["EmployeeID"].DefaultValue = ASPxTextBoxEmployeeID.Value.ToString();
        AccessDataSource1.UpdateParameters["LastName"].DefaultValue = ASPxTextBoxLastName.Value.ToString();
        AccessDataSource1.UpdateParameters["FirstName"].DefaultValue = ASPxTextBoxFirstName.Value.ToString();
        AccessDataSource1.UpdateParameters["BirthDate"].DefaultValue = Convert.ToDateTime(ASPxDateEditBirthDate.Value).ToShortDateString();
        //AccessDataSource1.Update(); //Uncomment this line

        ASPxGridView gridView = (ASPxGridView)sender;
        gridView.DataBind();
    }
}