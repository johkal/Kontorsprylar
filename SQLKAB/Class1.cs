using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


namespace SQLKAB
{
    public class SQL
    {
        static string CON_STR = "Data Source=.;Initial Catalog=Dunder;Integrated Security=True";

        public static List<Category> GenerateProductMenu()
        {
            List<Category> kategorier = new List<Category>();

            SqlConnection persConnection = new SqlConnection(CON_STR);

            try
            {
                persConnection.Open();

                SqlCommand command = new SqlCommand("ReadAllCategories", persConnection);

                SqlDataReader dr = command.ExecuteReader();

                while (dr.Read())
                {
                    kategorier.Add(new Category(dr["ID"].ToString(), dr["Name"].ToString(), dr["ParentID"].ToString()));
                }
            }
            catch (Exception)
            {

            }
            finally
            {
                persConnection.Close();
            }
            return kategorier;
        }

        public static string GenerateLeftMenu(List<Category> categories)
        {
            string leftMenuInnerText = "<ul>";

            foreach (var category in categories)
            {
                if(category.ParentID == "")
                {
                    leftMenuInnerText += $@"<li><a href='category.aspx?ID={category.ID}'>{category.Name}</a></li>";

                    foreach (var nextCategory in categories)
                    {
                        if (nextCategory.ParentID == category.ID)
                        {
                            leftMenuInnerText += $@"<ul><li><a href='category.aspx?ID={nextCategory.ID}'>{nextCategory.Name}</a></li>";

                            foreach (var thirdCategory in categories)
                            {
                                if (thirdCategory.ParentID == nextCategory.ID)
                                {
                                    leftMenuInnerText += $@"<ul><li><a href='category.aspx?ID={thirdCategory.ID}'>{thirdCategory.Name}</a></li></ul>";
                                }
                            }
                            leftMenuInnerText += "</ul>";
                        }
                    }
                }
            }

            leftMenuInnerText += "</ul>";
            return leftMenuInnerText;
        }

        public bool CreateOrder()
        {
            bool success = false;

            return success;
        }
    }


    public class Category
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string ParentID { get; set; }

        public Category(string id, string name, string parentID)
        {
            ID = id;
            Name = name;
            ParentID = parentID;
        }
    }
}
