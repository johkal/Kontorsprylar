using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kontorsprylar
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListCategory.Items.Add("Möbler");
            DropDownListCategory.Items.Add("Belysning");
            DropDownListCategory.Items.Add("Kattungar");

            DropDownListVAT.Items.Add("Normal moms 25%");
            DropDownListVAT.Items.Add("Bokmoms 6%");

            ButtonSubmit.Text="Lägg till";
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            //SQLKAB.SQL.CreateProduct();
        }
    }
}