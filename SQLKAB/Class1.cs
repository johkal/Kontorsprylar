using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;


namespace SQLKAB
{
    public class SQL
    {
        static string CON_STR = "Data Source=.;Initial Catalog = Dunder; Integrated Security = True";

        public static Category FindCategory(string id)
        {
            Category category = new Category("","","");

            SqlConnection persConnection = new SqlConnection(CON_STR);

            try
            {
                persConnection.Open();

                SqlCommand command = new SqlCommand("ReadCategory", persConnection);

                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", id));

                SqlDataReader dr = command.ExecuteReader();

                while (dr.Read())
                {
                    category.ID = dr["ID"].ToString();
                    category.Name = dr["Name"].ToString();
                    category.ParentID = dr["ParentID"].ToString();
                }
            }
            catch (Exception)
            {

            }
            finally
            {
                persConnection.Close();
            }

            return category;
        }

        public static List<Product> GetAllProducts()
        {
            List<Product> produkter = new List<Product>();

            SqlConnection persConnection = new SqlConnection(CON_STR);

            try
            {
                persConnection.Open();

                SqlCommand command = new SqlCommand("ReadAllProduct", persConnection);

                command.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = command.ExecuteReader();

                while (dr.Read())
                {
                    produkter.Add(new Product(dr["ID"].ToString(), dr["Name"].ToString(), dr["ItemNumber"].ToString(), dr["NetPrice"].ToString(), dr["Picture"].ToString(), dr["ItemInfo"].ToString(), Convert.ToInt32(dr["NrInStock"]), dr["VATID"].ToString(), Convert.ToBoolean(dr["IsActive"])));
                }
            }
            catch (Exception)
            {

            }
            finally
            {
                persConnection.Close();
            }

            return produkter;
        }

        public static List<Product> GetProductsInCategory(int id)
        {
            List<Category> kategorier = GenerateProductMenu();

            List<Product> produkter = GetAllProducts();

            List<Product> prodHits = new List<Product>();

            List<ProductToCategory> PTC = new List<ProductToCategory>();

            List<int> pid = new List<int>();

            int newId = id;

            SqlConnection persConnection = new SqlConnection(CON_STR);

            try
            {
                persConnection.Open();

                SqlCommand command = new SqlCommand("select * from ProductsToCategories", persConnection);

                SqlDataReader dr = command.ExecuteReader();

                while (dr.Read())
                {
                    PTC.Add(new ProductToCategory(Convert.ToInt32(dr["ID"]), Convert.ToInt32(dr["PID"]), Convert.ToInt32(dr["CAID"])));
                }
            }
            catch (Exception)
            {

            }
            finally
            {
                persConnection.Close();
            }

            foreach (var kategori in kategorier)
            {
                if (kategori.ID == newId.ToString() || kategori.ParentID == newId.ToString() || FindCategory(kategori.ParentID).ParentID == newId.ToString())
                {
                    foreach (var entry in PTC)
                    {
                        if (entry.CAID == Convert.ToInt32(kategori.ID))
                        {
                            pid.Add(entry.PID);
                        }

                    }
                }
            }

            foreach (var produkt in produkter)
            {
                foreach (var nr in pid)
                {
                    if (nr == Convert.ToInt32(produkt.ID))
                    {
                        prodHits.Add(produkt);
                    }
                }
            }

            return prodHits;
        }

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

        public static string GenerateDetailsInnerHTML(string PID)
        {
            string innerHTML = "";

            Product chosenProduct = new Product();

            SqlConnection myConnection = new SqlConnection(CON_STR);
            SqlCommand myCommand = new SqlCommand("ReadProductsOnID", myConnection);




            return innerHTML;

            //              <h1> Namn på produkt</h1>

            //     <table class="nav-justified">
            //    <tr>
            //        <td class="auto-style1">
            //            <img src = "img/KAB-logo.png" alt="Bild på produkten" style="width:50%; height:50%"/>
            //            </td>
            //        <td class="auto-style2">&nbsp;</td>
            //        <td class="auto-style3">Produktbeskrivning<br />
            //            <asp:TextBox ID = "TextBox1" runat="server" Height="38px" Width="124px"></asp:TextBox>
            //            <asp:Button class="button" ID="Add" runat="server" Height="38px" Text="Lägg i varukorg" Width="120px" />
            //        </td>
            //    </tr>
            //</table>
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
                if (category.ParentID == "")
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

    public class Product
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string ItemNumber { get; set; }
        public string NetPrice { get; set; }
        public string Picture { get; set; }
        public string ItemInfo { get; set; }
        public int NrInStock { get; set; }
        public string VATID { get; set; }
        public bool IsActive { get; set; }

        public Product()
        {

        }

        public Product(string id, string name, string itemNumber, string netPrice, string picture, string intemInfo, int nrInStock, string vatId, bool isActive)
        {
            ID = id;
            Name = name;
            ItemNumber = itemNumber;
            NetPrice = netPrice;
            Picture = picture;
            ItemInfo = ItemInfo;
            NrInStock = nrInStock;
            VATID = vatId;
            IsActive = isActive;
        }
    }

    class ProductToCategory
    {
        public int ID { get; set; }
        public int PID { get; set; }
        public int CAID { get; set; }

        public ProductToCategory(int id, int pid, int caid)
        {
            ID = id;
            PID = pid;
            CAID = caid;
        }
    }
}
