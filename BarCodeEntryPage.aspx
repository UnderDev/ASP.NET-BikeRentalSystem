<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BarCodeEntryPage.aspx.cs" Inherits="BarCodeEntryPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BarCode Entry WebPage</title>
    <link href="Styles/StyleSheet.css" rel="stylesheet" type="text/css" />

</head>

<body>
    <form id="form1" runat="server" defaultfocus="txtBoxBcEntry">
    
    <div class= "centerBox">
    
        <asp:TextBox ID="txtBoxBcEntry" runat="server" 
            ontextchanged="txtBoxBcEntry_TextChanged" ViewStateMode="Enabled"></asp:TextBox>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceRental" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LogInConnectionString %>" 
        DeleteCommand="DELETE FROM [BikeRentalTbl] WHERE [barCode] = @original_barCode AND [bikeNum] = @original_bikeNum AND [timesRented] = @original_timesRented AND (([timeInout] = @original_timeInout) OR ([timeInout] IS NULL AND @original_timeInout IS NULL)) AND [total] = @original_total AND [date] = @original_date" 
        InsertCommand="INSERT INTO [BikeRentalTbl] ([barCode], [bikeNum], [timesRented], [timeInout], [total], [date]) VALUES (@barCode, @bikeNum, @timesRented, @timeInout, @total, @date)" 
        SelectCommand="SELECT [barCode], [bikeNum], [timesRented], [timeInout], [total], [date] FROM [BikeRentalTbl]" 
        
        UpdateCommand="UPDATE [BikeRentalTbl] SET [bikeNum] = @bikeNum, [timesRented] = @timesRented, [timeInout] = @timeInout, [total] = @total, [date] = @date WHERE [barCode] = @original_barCode AND [bikeNum] = @original_bikeNum AND [timesRented] = @original_timesRented AND (([timeInout] = @original_timeInout) OR ([timeInout] IS NULL AND @original_timeInout IS NULL)) AND [total] = @original_total AND [date] = @original_date" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_barCode" Type="String" />
            <asp:Parameter Name="original_bikeNum" Type="Byte" />
            <asp:Parameter Name="original_timesRented" Type="Int16" />
            <asp:Parameter DbType="Time" Name="original_timeInout" />
            <asp:Parameter Name="original_total" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="original_date" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="barCode" Type="String" />
            <asp:Parameter Name="bikeNum" Type="Byte" />
            <asp:Parameter Name="timesRented" Type="Int16" />
            <asp:Parameter DbType="Time" Name="timeInout" />
            <asp:Parameter Name="total" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="date" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="bikeNum" Type="Byte" />
            <asp:Parameter Name="timesRented" Type="Int16" />
            <asp:Parameter DbType="Time" Name="timeInout" />
            <asp:Parameter Name="total" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="date" />
            <asp:Parameter Name="original_barCode" Type="String" />
            <asp:Parameter Name="original_bikeNum" Type="Byte" />
            <asp:Parameter Name="original_timesRented" Type="Int16" />
            <asp:Parameter DbType="Time" Name="original_timeInout" />
            <asp:Parameter Name="original_total" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="original_date" />
        </UpdateParameters>
    </asp:SqlDataSource>

    </form>
</body>
</html>
