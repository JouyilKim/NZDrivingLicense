<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditQ.aspx.cs" Inherits="New_Zealand_Driving_Test_Web_Application.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnAddQ" runat="server" Text="Add Question" OnClick="btnAddQ_Click" />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <a href="<%# "EditQDetail.aspx?question_id=" + Eval("Id") %>">
                <asp:Image runat="server" ImageUrl='<%#"~/images/questionImages/" + Eval("image") %>' />
                <span style="background-color: #FAFAD2; color: #284775;">Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    question:
            <asp:Label ID="questionLabel" runat="server" Text='<%# Eval("question") %>' />
                    <br />
                    <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' Visible="false" />
                    <br />
                    <br />
                </span>
            </a>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #FFCC66; color: #000080;">Id:
            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                question:
            <asp:TextBox ID="questionTextBox" runat="server" Text='<%# Bind("question") %>' />
                <br />
                <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
                <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Id:
            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                <br />
                question:
            <asp:TextBox ID="questionTextBox" runat="server" Text='<%# Bind("question") %>' />
                <br />
                <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
                <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            <a href="<%# "EditQDetail.aspx?question_id=" + Eval("Id") %>">
                <asp:Image runat="server" ImageUrl='<%#"~/images/questionImages/" + Eval("image") %>' />
                <span style="background-color: #FAFAD2; color: #284775;">Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    question:
            <asp:Label ID="questionLabel" runat="server" Text='<%# Eval("question") %>' />
                    <br />
                    <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' Visible="false" />
                    <br />
                    <br />
                </span>
            </a>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #FFCC66; font-weight: bold; color: #000080;">Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                question:
            <asp:Label ID="questionLabel" runat="server" Text='<%# Eval("question") %>' />
                <br />

                <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' />
                <br />
                <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [Id], [question], [image] FROM [tblQuestion]"></asp:SqlDataSource>
</asp:Content>
