﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisualWebPart1UserControl.ascx.cs" Inherits="DataSheetView.VisualWebPart1.VisualWebPart1UserControl" %>
<SharePoint:CssLink ID="cssLink1" runat="server" DefaultUrl="DataSheetView/DataSheetView.css" />
<SharePoint:SPGridView CssClass="mGrid" ID="gridView" AutoGenerateColumns="false" runat="server" OnRowEditing="gridView_RowEditing"
    AllowPaging="true" PageSize="3" OnPageIndexChanging="gridView_PageIndexChanging"
    OnRowCancelingEdit="gridView_RowCancelingEdit" OnRowUpdating="gridView_RowUpdating">

    <Columns>
        <asp:TemplateField HeaderText="Serial No">
            <ItemTemplate>
                <asp:Label ID="lblsid" runat="server" Text='<%# Eval("sid")%>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <asp:Label ID="lblName" runat="server" Text='<%#Eval("name") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Address">
            <ItemTemplate>
                <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("address") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtAddress" runat="server" Text='<%#Bind("address") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" HeaderText="" />
        <asp:TemplateField HeaderText="">
            <ItemTemplate>
                <asp:ImageButton ID="imgDelete" runat="server" ImageUrl="/_layouts/images/delete.gif"
                    OnClick="imgDelete_Click" Style="height: 15px" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

    <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle"
Font-Size="14pt" />
</SharePoint:SPGridView>

