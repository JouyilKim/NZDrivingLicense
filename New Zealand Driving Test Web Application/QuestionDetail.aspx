<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="QuestionDetail.aspx.cs" Inherits="New_Zealand_Driving_Test_Web_Application.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="70%" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image runat="server" ImageUrl='<%#"~/images/questionImages/" + Eval("image") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="question" HeaderText="question" SortExpression="question" />
            <asp:BoundField DataField="optionA" HeaderText="optionA" SortExpression="optionA" />
            <asp:BoundField DataField="optionB" HeaderText="optionB" SortExpression="optionB" />
            <asp:BoundField DataField="optionC" HeaderText="optionC" SortExpression="optionC" />
            <asp:BoundField DataField="optionD" HeaderText="optionD" SortExpression="optionD" />
            <asp:BoundField DataField="answer" HeaderText="answer" SortExpression="answer" />
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [Id], [question], [optionA], [optionB], [optionC], [optionD], [answer], [description], [image] FROM [tblQuestion] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="question_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
