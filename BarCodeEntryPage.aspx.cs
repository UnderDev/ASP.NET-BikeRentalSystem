using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class BarCodeEntryPage : System.Web.UI.Page
{
    private int _timesRented;
    private DateTime _timeInOut;
    private DateTime _date;


    private SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BPIConnectionString"].ConnectionString);
    private SqlCommand _com;


    private Dictionary<string, int> dicRentalPrice = new Dictionary<string, int>();

    protected void Page_Load(object sender, EventArgs e)
    {
        //COULD GET PRICES FROM A FILE, ALOWING FOR PRICE CHANGE
        //When loading the page set the rental prices
        dicRentalPrice.Add("HalfDaySatori", 35);
        dicRentalPrice.Add("FullDaySatori", 50);

        dicRentalPrice.Add("HalfDayDh", 45);
        dicRentalPrice.Add("FullDayDh", 65);

        dicRentalPrice.Add("HalfDayKids", 20);
        dicRentalPrice.Add("FullDayKids", 30);
    }

    protected void txtBoxBcEntry_TextChanged(object sender, EventArgs e)
    {
        int rentCount,hoursRented;
        double rentCost,total;
        string timeInOut;
        DateTime dateTime;

        if (IsPostBack)
        {

            _conn.Open();

            //Gets the Scanned barcode entered into txtBoxBcEntry from the dataBase         
            String barCode = txtBoxBcEntry.Text;
            bool found = get_BarCode(barCode);

            //If The BarCode was found
            if (found)
            {

                //Get The TimeInOut (DateTime) From the DB
                timeInOut = get_TimeInOut(barCode);

                //If the DateTime != "", bikes been returned (scanned twice)
                if (!timeInOut.Equals(""))
                {
                    dateTime = Convert.ToDateTime(timeInOut);

                    //Gets the amount of hours a bike was rented
                    hoursRented= getTimeDif(dateTime);

                    //gets how much the Rental Cost of the bike is
                    rentCost = getRentalCost(barCode, hoursRented);

                    //Get the total from the dataBase
                    total = get_Total(barCode);

                    //Add the total from the Db to the RentCost
                    total += rentCost;

                    //Updates the database with the new Total
                    set_total(barCode, total);



                    //Gets and or Sets the date in the Database
                    set_Date(barCode);


                    //Gets the Rent Count from the Db, adds 1, then updates the Db with the new count
                    rentCount = get_TimesRented(barCode);
                    Set_TimesRented(barCode, rentCount);


                    timeInOut = "NULL";
                }
                //first time the bikes barCode has been scanned in
                else
                {
                    //Gets the Current dateTime now 
                    timeInOut = Get_CurrentDateTime();
                }

                set_TimeInOut(barCode, timeInOut);

            }
            _conn.Close();
        }
        Server.Transfer("Default.aspx", true);
    }

    private bool get_BarCode(string barcode)
    {
        bool check = false;

        //Get the Data From the database from the BarCode scanned into hte textBox
        String chkBarCode = "Select BarCode from BikeRentalTbl where BarCode  ='" + barcode + "'";

        _com = new SqlCommand(chkBarCode, _conn);

        //if the barcode was found in the database temp will be = 1 ********************************* SURROUND IN A TRY CATCH FAILS IF NOT FOUND KEY IN DB
        string result = Convert.ToString(_com.ExecuteScalar().ToString());

        if (result.Equals(""))
            check = false;
        else
            check = true;

        return check;
    }

    private void set_Date(String barCode)
    {
        String curDate = "UPDATE BikeRentalTbl SET Date= '" + Get_CurrentDateTime() + "' where BarCode ='" + barCode + "'";

        _com = new SqlCommand(curDate, _conn);
        _com.ExecuteScalar();
    }


    /*Gets the TimeInOut from the DataBase
     */
    private String get_TimeInOut(string barCode)
    {
        String time = "Select TimeInOut from BikeRentalTbl where BarCode ='" + barCode + "'";

        _com = new SqlCommand(time, _conn);
        time = Convert.ToString(_com.ExecuteScalar());

        return time;
    }


    private String Get_CurrentDateTime()
    {
        string dateTimeNow = Convert.ToString(DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));
        return dateTimeNow;
    }


    private int getTimeDif(DateTime DateTimeDb)
    {
        int hours;
        DateTime currDateTime = Convert.ToDateTime(Get_CurrentDateTime());
        //Get the Time Diffrence between the Current DateTime and Database DateTime
        System.TimeSpan diff2 = (currDateTime - DateTimeDb);

        //Gets The amount of Hours The Bikes Been Rented for     (messes up the time if its accross days)*******************
       return  hours = diff2.Hours;
    }


    private void set_TimeInOut(string barCode, string value)
    {

        String insetTime = "UPDATE BikeRentalTbl SET TimeInOut= CAST('" + value + "'AS DATETIME) where BarCode ='" + barCode + "'";
        _com = new SqlCommand(insetTime, _conn);
        _com.ExecuteScalar();
    }



    private double get_Total(String barCode)
    {
        Double rentPrice;
        String tot = "Select Total from BikeRentalTbl where BarCode ='" + barCode + "'";

        _com = new SqlCommand(tot, _conn);
        rentPrice = Convert.ToDouble(_com.ExecuteScalar().ToString());

        return rentPrice;
    }

    private void set_total(String barCode, double total)
    {
        String insetTotal = "UPDATE BikeRentalTbl SET Total= '" + total + "' where BarCode ='" + barCode + "'";
        _com = new SqlCommand(insetTotal, _conn);
        _com.ExecuteScalar();
    }



    private int getRentalCost(string barCode, int hours)
    {
        int price = 0;
        string BikeModel = get_BikeModel(barCode);


        //if the Time dif is greater than 1 hour rented and < than 5 hours its a Half Day
        if (hours >= 0 && hours <= 5)
        {
            //If The barcode read in starts with "sat" the bikes a satori
            if (BikeModel.Equals("Satori-Process"))
            {
                //get the cost from the Dictonary depending on the Barcode
                dicRentalPrice.TryGetValue("HalfDaySatori", out price);
            }
            else if (BikeModel.Equals("HalfPrecept"))
            {
                dicRentalPrice.TryGetValue("HalfDayDH", out price);
            }
            else if (BikeModel.Equals("HalfDayKids"))
            {
                dicRentalPrice.TryGetValue("FullDayDh", out price);
            }

        }
        else if (hours >= 1 && hours > 5)
        {
            //If The barcode read in starts with "sat" the bikes a satori
            if (BikeModel.Equals("Satori-Process"))
            {
                //get the cost from the Dictonary depending on the Barcode
                dicRentalPrice.TryGetValue("FullDaySatori", out price);
            }
            else if (BikeModel.Equals("Precept"))
            {
                dicRentalPrice.TryGetValue("FullDayKids", out price);
            }
            else if (BikeModel.Equals("Kids"))
            {
                dicRentalPrice.TryGetValue("FullDayDh", out price);
            }
        }
        return price;
    }

    //Get the model of the bike from the barcodes 4th number
    private string get_BikeModel(string barCode)
    {
        int bikeRentCost = Convert.ToInt32(barCode.Substring(3, 1));
        string BikeModel = "";

        switch (bikeRentCost)
        {
            case 1:
            case 2:
            case 3:
                BikeModel = "Satori-Process";
                break;

            case 4:
            case 5:
            case 6:
                BikeModel = "Precept";
                break;

            case 7:
                BikeModel = "Kids";
                break;
        }
        return BikeModel;
    }




    /* Gets From the DataBase the total amout of times a bike has been rented 
     */
    private int get_TimesRented(String barCode)
    {
        String getRented = "Select TimesRented from BikeRentalTbl where BarCode ='" + barCode + "'";

        int rentCount;
        _com = new SqlCommand(getRented, _conn);
        rentCount = Convert.ToInt32(_com.ExecuteScalar().ToString());
        //returns the num from the DB and Adds 1 to it
        return rentCount + 1;
    }

    private void Set_TimesRented(string barCode, int rentCount)
    {
        String setRented = "UPDATE BikeRentalTbl SET TimesRented= '" + rentCount + "' where BarCode ='" + barCode + "'";
        _com = new SqlCommand(setRented, _conn);
        _com.ExecuteScalar();
    }


    private void updateSqlCommand(string columnName, string value, string barCode)
    {
        String insetTime = "UPDATE BikeRentalTbl SET '" + columnName + "' = '" + value + "' where BarCode ='" + barCode + "'";
        _com = new SqlCommand(insetTime, _conn);
        _com.ExecuteScalar();
    }



}