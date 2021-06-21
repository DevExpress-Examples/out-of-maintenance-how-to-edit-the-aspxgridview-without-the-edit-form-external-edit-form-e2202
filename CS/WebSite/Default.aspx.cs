using System;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e) {
        AccessDataSource1.UpdateParameters["EmployeeID"].DefaultValue = ASPxTextBoxEmployeeID.Value.ToString();
        AccessDataSource1.UpdateParameters["LastName"].DefaultValue = ASPxTextBoxLastName.Value.ToString();
        AccessDataSource1.UpdateParameters["FirstName"].DefaultValue = ASPxTextBoxFirstName.Value.ToString();
        AccessDataSource1.UpdateParameters["BirthDate"].DefaultValue = Convert.ToDateTime(ASPxDateEditBirthDate.Value).ToShortDateString();

        //for example purpose only, because online editing is not supported
        throw new Exception("Editing in online example is not supported"); //remove this line when testing the project

        AccessDataSource1.Update(); //Uncomment this line

        ASPxGridView gridView = (ASPxGridView)sender;
        gridView.DataBind();
    }
}