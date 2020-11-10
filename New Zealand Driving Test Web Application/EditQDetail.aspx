<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditQDetail.aspx.cs" Inherits="New_Zealand_Driving_Test_Web_Application.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="80%" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Fields>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" DeleteCommand="DELETE FROM [tblQuestion] WHERE [Id] = @original_Id AND [question] = @original_question AND [optionA] = @original_optionA AND [optionB] = @original_optionB AND (([optionC] = @original_optionC) OR ([optionC] IS NULL AND @original_optionC IS NULL)) AND (([optionD] = @original_optionD) OR ([optionD] IS NULL AND @original_optionD IS NULL)) AND [answer] = @original_answer AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL))" InsertCommand="INSERT INTO [tblQuestion] ([Id], [question], [optionA], [optionB], [optionC], [optionD], [answer], [description], [image]) VALUES (@Id, @question, @optionA, @optionB, @optionC, @optionD, @answer, @description, @image)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tblQuestion] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [tblQuestion] SET [question] = @question, [optionA] = @optionA, [optionB] = @optionB, [optionC] = @optionC, [optionD] = @optionD, [answer] = @answer, [description] = @description, [image] = @image WHERE [Id] = @original_Id AND [question] = @original_question AND [optionA] = @original_optionA AND [optionB] = @original_optionB AND (([optionC] = @original_optionC) OR ([optionC] IS NULL AND @original_optionC IS NULL)) AND (([optionD] = @original_optionD) OR ([optionD] IS NULL AND @original_optionD IS NULL)) AND [answer] = @original_answer AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_question" Type="String" />
            <asp:Parameter Name="original_optionA" Type="String" />
            <asp:Parameter Name="original_optionB" Type="String" />
            <asp:Parameter Name="original_optionC" Type="String" />
            <asp:Parameter Name="original_optionD" Type="String" />
            <asp:Parameter Name="original_answer" Type="String" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_image" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="optionA" Type="String" />
            <asp:Parameter Name="optionB" Type="String" />
            <asp:Parameter Name="optionC" Type="String" />
            <asp:Parameter Name="optionD" Type="String" />
            <asp:Parameter Name="answer" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="image" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="question_id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="optionA" Type="String" />
            <asp:Parameter Name="optionB" Type="String" />
            <asp:Parameter Name="optionC" Type="String" />
            <asp:Parameter Name="optionD" Type="String" />
            <asp:Parameter Name="answer" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_question" Type="String" />
            <asp:Parameter Name="original_optionA" Type="String" />
            <asp:Parameter Name="original_optionB" Type="String" />
            <asp:Parameter Name="original_optionC" Type="String" />
            <asp:Parameter Name="original_optionD" Type="String" />
            <asp:Parameter Name="original_answer" Type="String" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_image" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
