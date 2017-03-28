using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQLKAB;

namespace Kontorsprylar
{
    public partial class master : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Category> categories = SQL.GenerateProductMenu();
            string leftMenuInnerHtml = SQL.GenerateLeftMenu(categories);
            leftMenu.InnerHtml = leftMenuInnerHtml;
        }

        protected void ButtonMySearch_Click(object sender, EventArgs e)
        {
            List<Product> allProducts = SQL.GetAllProducts();
            List<Product> matchingProducts = new List<Product>();
            List <Category> allCategories = SQL.GetAllCategories();
            List<Category> matchingCategories = new List<Category>();

            //foreach (var prod in allProducts)
            //{
            //    if (prod.Name.ToLower().StartsWith(TextBoxMyQuery.Text.ToLower()))
            //    {
            //        matchingProducts.Add(prod);
            //    }
            //}

            //foreach (var cat in allCategories)
            //{
            //    if (cat.Name.ToLower().StartsWith(TextBoxMyQuery.Text.ToLower()))
            //    {
            //        matchingCategories.Add(cat);
            //    }
            //}

            foreach (var cat in matchingCategories)
            {
                List<Product> moreProducts = SQL.GetProductsInCategory(Convert.ToInt32(cat.ID));

                foreach (var prod in moreProducts)
                {
                    matchingProducts.Add(prod);
                }
            }

            
        }
    }
}