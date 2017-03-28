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

            List<SQLKAB.VAT> moms = SQLKAB.SQL.GetAllVAT();

            foreach (var mom in moms)
            {
                DropDownListVAT.Items.Add($"{ mom.Category} {mom.Rate}");
            }
        }

        public void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string[] momsText = DropDownListVAT.SelectedItem.Text.Split(' ');

            double momsSum = Convert.ToDouble(momsText[1]);

            int momsID = 1;

            List<SQLKAB.VAT> vatList = SQLKAB.SQL.GetAllVAT();

            foreach (var vat in vatList)
            {
                if (vat.Rate==momsSum)
                {
                    momsID = Convert.ToInt32(vat.ID);
                }
            }

            SQLKAB.Product produkt = new SQLKAB.Product("1", TextBoxProductName.Text, TextBoxProductNumber.Text, Convert.ToInt32(TextBoxNetPrice.Text), TextBoxProductDescription.Text, Convert.ToInt32(TextBoxNrInStock.Text), momsID, true);

            bool success = SQLKAB.SQL.CreateProduct(produkt);

            if (success)
            {
                LabelSubmit.Text = "Produkten lades till";
            }
            else
            {
                LabelSubmit.Text = TextBoxProductDescription.Text.ToString();
            }
        }
    }
}