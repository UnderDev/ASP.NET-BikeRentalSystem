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


    private SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LogInConnectionString"].ConnectionString);
    private SqlCommand _com;


    private Dictionary<string, int> dicRentalPrice = new Dictionary<string, int>();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //COULD GET PRICES FROM A FILE, ALOWING FOR PRICE CHANGE
       //When loading the page set the rental prices
        dicRentalPrice.Add("HalfDaySatori",35);
        dicRentalPrice.Add("FullDaySatori", 50);

        dicRentalPrice.Add("HalfDayDh", 45);
        dicRentalPrice.Add("FullDayDh", 65);

        dicRentalPrice.Add("HalfDayKids", 20);
        dicRentalPrice.Add("FullDayKids", 30);
    }

    protected void txtBoxBcEntry_TextChanged(object sender, EventArgs e)
    {
        if(IsPostBack){

            //Gets the Scanned barcode entered into txtBoxBcEntry from the dataBase         
            String barcode = txtBoxBcEntry.Text;
            bool found = get_BarCode(barcode);

            //If The BarCode was found
            if (found)
            {
                _conn.Open();

                //Gets the following fields from the data base and stores the individually 
                String Tr = "Select timesRented from BikeRentalTbl where barCode ='" + barcode + "'";
                String time = "Select timeInOut from BikeRentalTbl where barCode ='" + barcode + "'";
                String date = "Select date from BikeRentalTbl where barCode ='" + barcode + "'";


                //Gets and Sets from the Database the amout of times a bike was rented.
                getSet_timesRented(Tr);

                //Gets and or Sets the TimeOutIn in the Database
                getSet_TimeInOutCost(time, barcode);

                //Gets and or Sets the date in the Database
                getSet_Date(date);

                _conn.Close();
            }
        }
    }

    private bool get_BarCode(string barcode)
    {
        bool check=false;
        //Open the connection
        _conn.Open();
        //Get the Data From the database from the BarCode scanned into hte textBox
        String chkBarCode = "Select barCode from BikeRentalTbl where barCode  ='" + barcode + "'";

        _com = new SqlCommand(chkBarCode, _conn);

        //if the barcode was found in the database temp will be = 1 ********************************* SURROUND IN A TRY CATCH FAILS IF NOT FOUND KEY IN DB
        string result = Convert.ToString(_com.ExecuteScalar().ToString());

        if (result.Equals(""))
            check = false;
        else
            check = true;

        _conn.Close();
        return check;
    }

    private void getSet_Date(String date)
    {
        _com = new SqlCommand(date, _conn);
        _date = Convert.ToDateTime(_com.ExecuteScalar());
    }


    private void getSet_TimeInOutCost(string dateTime, string barCode)
    {

        double rentPrice = 0;
        DateTime tempDate;

        //IF THE FIELD IS NULL ADD THE CURRENT TIME TO THE DATABASE
        _com = new SqlCommand(dateTime, _conn);

        //gets the dateTime from the datbase, IF NULL string is Empty
        string date = Convert.ToString(_com.ExecuteScalar());
      
        //Gets the current Date and Time
        tempDate = DateTime.Now;

        //Formats the Time into Month/Day/Year Hours:Seconds:Years
        string sqlFormattedDate = tempDate.ToString("MM/dd/yyyy HH:mm:ss");
        tempDate = Convert.ToDateTime(sqlFormattedDate);

        //If the Field was Empty (Null)
        if (date.Equals(""))
        {
            //Enter into the DataBase the Date and time
            String insetTime = "UPDATE BikeRentalTbl SET timeInOut= '" + tempDate + "' where barCode ='" + barCode + "'";
            _com = new SqlCommand(insetTime, _conn);
            _com.ExecuteScalar();
        }
        else
        {
            //Date and time was in the DataBase
            _timeInOut = Convert.ToDateTime(date);

            // Its the 2nd time the Barcodes been scaned in
            //Take the Time in the DataBase away from the Current Time

            System.TimeSpan diff2 = (tempDate - _timeInOut);

            //Gets The amount of Hours The Bikes Been Rented for     (messes up the time if its accross days)*******************
            int hours = diff2.Hours;

            //Get How much the rental costs 
            rentPrice = getRentalCost(barCode, hours);

            getSet_total(barCode, rentPrice);  
   
            //Reset The timeInOut to Null

            String insetTime = "UPDATE BikeRentalTbl SET timeInOut= '"+DBNull.Value+"' where barCode ='" + barCode + "'";
            _com = new SqlCommand(insetTime, _conn);
            _com.ExecuteScalar();
        }

        //ServerSide move to another WebPage        if refreshed, steps get repeated
        Server.Transfer("Default.aspx", true);
    }

    private void getSet_total(String barCode, double rentPrice)
    {
        String tot = "Select total from BikeRentalTbl where barCode ='" + barCode + "'";

        //gets the current total from the DataBase
        _com = new SqlCommand(tot, _conn);

        //Add the rentPrice from The Db onto the new input
        rentPrice += Convert.ToDouble(_com.ExecuteScalar().ToString());


        //UPDATE STATMENT TO UPDATE THE TOTAL IN THE DB using rentPrice
        String insetTotal = "UPDATE BikeRentalTbl SET total= '" + rentPrice + "' where barCode ='" + barCode + "'";
        _com = new SqlCommand(insetTotal, _conn);
        _com.ExecuteScalar();

    }

    private int getRentalCost(string barCode, int hours)
    {
        int price=0;
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
        int bikeRentCost = Convert.ToInt32(barCode.Substring(3,1));
        string BikeModel="";

        switch(bikeRentCost){
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


    private void getSet_timesRented(String Tr)
    {
        _com = new SqlCommand(Tr, _conn);
        _timesRented = Convert.ToInt32(_com.ExecuteScalar().ToString());
    }


}
        //Barcode entered 
        //Connect to the database
        //Get the required fields from the DB

        //Set the current Field of time into a var for later use

        //Get the current date and time
        //Calculate the COST based on the time

        //Update the Fields


        //Once scanned in the 2nd time, reset the value to null
