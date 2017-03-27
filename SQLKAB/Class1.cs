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
        static string CON_STR = "Data Source=.;Initial Catalog = Dunder; Integrated Security = True";

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

        public static string GenerateIndexCarousel(List<Category> categories)
        {
            string innerHTML = "<div id = 'myCarousel' class='carousel slide container' data-ride='carousel'><ol class='carousel-indicators'>";


            string firstID = "";
            string firstName = "";
            foreach (var item in categories)
            {
                if (item.ParentID == "")
                {
                    innerHTML += $"<li data-target='#myCarousel' data-slide-to='0' class='active'></li>";
                    firstID = item.ID;
                    firstName = item.Name;
                    break;
                }
            }
            int i = 1;
            foreach (var item in categories)
            {
                if (item.ParentID == "" && item.ID != firstID)
                {
                    innerHTML += $"<li data-target='#myCarousel' data-slide-to='{i}'</li>";
                    i++;
                }
            }
            innerHTML += $"</ol><div class='carousel-inner' role='listbox'><div class='item active'><img class='carousel - image' src='img/kontorsstol.jpg' alt='{firstName}'><div class='carousel-caption'><h3>{firstName}</h3></div></div>";

            foreach (var item in categories)
            {
                if (item.ParentID == "" && item.ID != firstID)
                {
                    innerHTML += $"<div class='item'><img class='carousel-image' src='img/Kontorsbel.jpg' alt='{item.Name}'><div class='carousel-caption'><h3>{item.Name}</h3></div></div>";

                }
            }
            innerHTML += "</div><a class='left carousel-control' href='#myCarousel' role='button' data-slide='prev'><span class='glyphicon glyphicon-chevron-left' aria-hidden='true'></span><span class='sr-only'>Previous</span></a><a class='right carousel-control' href='#myCarousel' role='button' data-slide='next'><span class='glyphicon glyphicon-chevron-right' aria-hidden='true'></span><span class='sr-only'>Next</span></a></div>";

            return innerHTML;
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
