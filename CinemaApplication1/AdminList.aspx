<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminList.aspx.cs" Inherits="CinemaApplication1.WebForm24" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gvAdmin {
            width: 100%;
            border: solid 2px black;
            margin-left: auto;
            margin-right: auto;
            border-radius: 0px 0px 15px 15px;
        }

            .gvAdmin a /** FOR THE PAGING ICONS **/ {
                padding: 5px 5px 5px 5px;
                text-decoration: none;
            }

                .gvAdmin a:hover /** FOR THE PAGING ICONS HOVER STYLES**/ {
                    background: cornflowerblue;
                    color: blue;
                }

            .gvAdmin span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
                background-color: #fff;
                color: #000;
                padding: 5px 5px 5px 5px;
            }

            .gvAdmin td {
                padding: 5px;
                border: solid 2px black;
            }

            .gvAdmin th {
                padding: 5px;
                border: solid 2px black;
            }

        body {
            background-image: url(../image/cinemaBk4.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <br />
    <div class="container">
        <div class="panel panel-info">
            <div class="panel-body">
                <asp:Button ID="btnBack" CssClass="btn-dark text-light btn-outline-warning px-5 py-1" runat="server" Text="Back" OnClick="btnBack_Click" />&nbsp;&nbsp;
                <br /><br />
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CinemaApplication1.CinemaDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Admins">
                </asp:LinqDataSource>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

                <asp:GridView CssClass="gvAdmin bg-dark text-light" ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AdminID" DataSourceID="LinqDataSource1">
                    <Columns>
                        <asp:BoundField DataField="AdminID" HeaderText="AdminID" ReadOnly="True" SortExpression="AdminID" />
                        <asp:TemplateField HeaderText="adminName" SortExpression="adminName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Text='<%# Bind("adminName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="The name can not be null" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="The name is used" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
                                <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Cannot Insert Invalid Name" ForeColor="Red" OnServerValidate="CustomValidator7_ServerValidate">*</asp:CustomValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("adminName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="adminEmail" SortExpression="adminEmail">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" MaxLength="100" Text='<%# Bind("adminEmail") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="The email can not be null" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="The email format is wrong" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("adminEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="adminPassword" HeaderText="adminPassword" ReadOnly="True" SortExpression="adminPassword" />
                        <asp:BoundField DataField="dateJoin" HeaderText="dateJoin" ReadOnly="True" SortExpression="dateJoin" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
