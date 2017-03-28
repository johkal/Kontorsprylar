using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLKAB;

namespace Kontorsprylar
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<SQLKAB.Category> kategorier = SQLKAB.SQL.GetAllCategories();

            foreach (var kategori in kategorier)
            {
                DropDownListCategory.Items.Add(kategori.Name);
            }

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