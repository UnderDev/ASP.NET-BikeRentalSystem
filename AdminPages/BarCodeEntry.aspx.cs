using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    private static SqlConnection _conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BPIConnectionString"].ConnectionString);
    private static SqlCommand _com;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Make sure the textBox always has focus
        txtBoxBcEntry.Focus();
    }

    /*Method waites for the Text in the textbox to be changed, once the event fires off, it checks the contents of the textbox
     * against the database to see if the Barcode was found. If not , it displayes a message to the user and waites for more input.
     * if the code is found it calls all the listed methods to update the database with the new data.
     */
    protected void txtBoxBcEntry_TextChanged(object sender, EventArgs e)
    {
        int rentCount;
        TimeSpan timeRented;
        double rentCost, total;
        string timeInOut;
        DateTime dateTime;

        lblUserMessage.Text = "";

        if (IsPostBack)
        {
            _conn.Close();
            _conn.Open();

            //Gets the Scanned barcode entered into txtBoxBcEntry from the dataBase         
            String barCode = txtBoxBcEntry.Text;
            bool found = get_BarCode(barCode);

            //If The BarCode(pk) was found
            if (found)
            {
                //Get The TimeInOut (DateTime) From the DB
                timeInOut = get_TimeInOut(barCode);

                    if (!timeInOut.Equals(""))
                    {
                        dateTime = Convert.ToDateTime(timeInOut);

                        //Gets diffrence between the current and database time
                        timeRented = get_TimeDif(dateTime);

                            //Gets how much the Rental Cost of the bike is
                            rentCost = getRentalCost(barCode, timeRented);

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

                            //Statment makes sure the bike gets rented again after it was not scanned back
                            if (timeRented.TotalHours >=13)
                                timeInOut = Get_CurrentDateTime();
                            else
                                timeInOut = "NULL";//Used to reset the field in timeInOut
                    }
                    //Bike Has Just Been Rented Out
                    else
                        timeInOut = Get_CurrentDateTime();

                    if (!timeInOut.Equals("NULL"))
                    {
                        //Makes sure the Date time is in the correct formate
                        DateTime temp = Convert.ToDateTime(timeInOut);
                        timeInOut = Convert.ToString(temp.ToString("MM/dd/yyyy HH:mm:ss"));
                    }

                    //Update the DB with new timeInOut or the Current time in out if bike was scanned twice by mistake
                    set_TimeInOut(barCode, timeInOut);

            }//End if(found)
            _conn.Close();
        }//End IsPostBack

        txtBoxBcEntry.Text = "";
    }

    /*Method returns the diffrence between the DataTime passed in and The current DateTime 
     */
    private TimeSpan get_TimeDif(DateTime dt)
    {
        DateTime currDateTime = (DateTime.Now);
        //Get the Time Diffrence between the Current DateTime and Database DateTime
        System.TimeSpan diff2 = (currDateTime - dt);

        //Gets the time diffrence between 2 dates
        return diff2;
    }

    /* Gets the Scanned input from the user and compares it against the dataBase
     * returning True if the BarCode was found and the BcInUse value returned was Y*/
    private bool get_BarCode(string barcode)
    {
        bool checkBarCode = false;//default value

        try
        {

            String checkInAction = "Select BcInUse from BikeRentalTbl where BarCode  ='" + barcode + "'";
            _com = new SqlCommand(checkInAction, _conn);
            checkInAction = Convert.ToString(_com.ExecuteScalar().ToString());

            if (checkInAction.Equals("Y"))
            {
                String chkBarCode = "Select BarCode from BikeRentalTbl where BarCode  ='" + barcode + "'";
                _com = new SqlCommand(chkBarCode, _conn);
                //If the barcode was found in the database result will be = to that barcode otherwise it will be an empty string
                string result = Convert.ToString(_com.ExecuteScalar().ToString());
                checkBarCode = true;
                lblUserMessage.Text = "BarCode Found!";
            }
            else
                lblUserMessage.Text = "Bike not currently in Use";
        }
        catch (Exception)
        {
            lblUserMessage.Text = "The Barcode You Entered Could Not Be Found!";
        }

        return checkBarCode;
    }

    /*Updates the DataBase with the Current Date
     */
    private void set_Date(String barCode)
    {
        DateTime temp = Convert.ToDateTime(Get_CurrentDateTime());
        String dateTime = Convert.ToString(temp.ToString("MM/dd/yyyy HH:mm:ss"));

        String curDate = "UPDATE BikeRentalTbl SET Date= '" + dateTime + "' where BarCode ='" + barCode + "'";

        _com = new SqlCommand(curDate, _conn);
        _com.ExecuteScalar();
    }

    /*Gets the Current DateTime 
     */
    private String Get_CurrentDateTime()
    {
        string dateTimeNow = Convert.ToString(DateTime.Now);

        return dateTimeNow;
    }

    /*Method gets the Date field from the database
     */
    private DateTime get_Date(string barCode)
    {
        String date = "Select Date from BikeRentalTbl where BarCode ='" + barCode + "'";
        _com = new SqlCommand(date, _conn);
        date = Convert.ToString(_com.ExecuteScalar());

        return Convert.ToDateTime(date);
    }


    /*Gets the TimeInOut data from the DataBase
  * and returns the result as a string to the caller
  */
    private String get_TimeInOut(string barCode)
    {
        String time = "Select TimeInOut from BikeRentalTbl where BarCode ='" + barCode + "'";

        _com = new SqlCommand(time, _conn);
        time = Convert.ToString(_com.ExecuteScalar());

        return time;
    }

    //************* FIX METHOD *************
    /*Updates the dataBase with the Current time or Null(If Bike Was Returned) 
     */
    private void set_TimeInOut(string barCode, string value)
    {
        String insetTime;
        if (value.Equals("NULL"))
            insetTime = "UPDATE BikeRentalTbl SET TimeInOut= CAST(" + value + " AS DATETIME) where BarCode ='" + barCode + "'";
        else
            insetTime = "UPDATE BikeRentalTbl SET TimeInOut= CAST('" + value + "' AS DATETIME) where BarCode ='" + barCode + "'";

        _com = new SqlCommand(insetTime, _conn);
        _com.ExecuteScalar();
    }


    /*Gets the Total from the dataBase and returns it as a Double
     * To the caller
     */
    private double get_Total(String barCode)
    {
        Double rentPrice;
        String tot = "Select Total from BikeRentalTbl where BarCode ='" + barCode + "'";

        _com = new SqlCommand(tot, _conn);
        rentPrice = Convert.ToDouble(_com.ExecuteScalar().ToString());

        return rentPrice;
    }

    /*Updates the DataBase with the New Total after a bike has been returned
     */
    private void set_total(String barCode, double total)
    {
        String insetTotal = "UPDATE BikeRentalTbl SET Total= '" + total + "' where BarCode ='" + barCode + "'";
        _com = new SqlCommand(insetTotal, _conn);
        _com.ExecuteScalar();
    }


    /*Gets the "RentalCost" based on the the amount of hours the bike was 
     * Rented out for and returns an int to the caller
     */
    private int getRentalCost(string barCode, TimeSpan time)
    {
        int price = 0;
        string priceQuere = "";
        int bikeModelNum = Convert.ToInt32(barCode.Substring(3, 1));

        //If the Time dif is greater than 30 min and less than 5 hours its a Half Day. This is also the default incase the bike never got scanned back in
        if ((time.TotalMinutes >= 30 && time.TotalHours > 5) || (time.TotalDays >= 1 || time.TotalHours >= 19))
            priceQuere = "Select HalfDay from BikeCostTbl where Id ='" + bikeModelNum + "'";
        else if ((time.TotalHours > 5 || time.TotalHours > 10) || time.TotalHours < 19)
            priceQuere = "Select FullDay from BikeCostTbl where Id ='" + bikeModelNum + "'";

        _com = new SqlCommand(priceQuere, _conn);
        price = Convert.ToInt16(_com.ExecuteScalar());

        return price;
    }

    /* Gets From the DataBase the total amout of times a bike has been rented,
     * adds 1 to that number and returns the rentCount to the caller
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

    /*Updates the database with the new total num of times a bikes been rented
     */
    private void Set_TimesRented(string barCode, int rentCount)
    {
        String setRented = "UPDATE BikeRentalTbl SET TimesRented= '" + rentCount + "' where BarCode ='" + barCode + "'";
        _com = new SqlCommand(setRented, _conn);
        _com.ExecuteScalar();
    }

}