<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AddQ.aspx.cs" Inherits="New_Zealand_Driving_Test_Web_Application.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 140px;
            font-size: 18px;
        }

        .auto-style2 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 80%">
        <tr>
            <td colspan="2">
                <h1>Add Questions</h1>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">ID:&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox ID="txtId" runat="server" Enabled="false" Height="25px" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Question text:&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:TextBox ID="txtQuestion" runat="server" Height="25px" Width="90%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuestion" ForeColor="Red" ErrorMessage="must fill the Question text">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Option A:&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:TextBox ID="txtOptionA" runat="server" Height="25px" Width="90%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOptionA" ForeColor="Red" ErrorMessage="must fill Option A">*</asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">Option B:&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:TextBox ID="txtOptionB" runat="server" Height="25px" Width="90%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOptionB" ForeColor="Red" ErrorMessage="must fill Option B">*</asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">Option C:&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:TextBox ID="txtOptionC" runat="server" Height="25px" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Option D:&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:TextBox ID="txtOptionD" runat="server" Height="25px" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Answer:&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:TextBox ID="txtAnswer" runat="server" Height="25px" Width="90%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAnswer" ForeColor="Red" ErrorMessage="must fill the answer">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAnswer"
                     ValidationExpression="[A-D]" ErrorMessage="Enter A to D" ForeColor="Red">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Description:&nbsp;&nbsp;&nbsp;

            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" Height="25px" Width="90%"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">Image :&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:FileUpload ID="fileUploadImg" runat="server" Width="290px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>

                <asp:Button ID="btnUpload" runat="server" Text="Upload" Width="240px" OnClick="btnUpload_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
