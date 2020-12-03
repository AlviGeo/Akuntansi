<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditJurnal.aspx.cs" Inherits="Akuntansi.EditJurnal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container mx-auto py-4" >
        <form id="form1" runat="server">
            <div class="form-group">
                <asp:HiddenField Id="RowID" runat="server"/>
            </div>
            <div class="form-group">
                <asp:label runat="server">Jurnal Name</asp:label>
                <asp:TextBox ID="RowDate" runat="server" CssClass="form-control"  placeholder="Masukkan Tanggal"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:label runat="server">Jurnal Name</asp:label>
                <asp:TextBox ID="JurnalName" runat="server" CssClass="form-control"  placeholder="Masukan Nama"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:label runat="server">Ref</asp:label>
                <asp:TextBox ID="JurnalRef" runat="server" CssClass="form-control"  placeholder="Masukan No Ref"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:label runat="server">Debit</asp:label>
                <asp:TextBox ID="Debit" runat="server" CssClass="form-control"  placeholder="Masukan Angka Debit"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:label runat="server">Kredit</asp:label>
                <asp:TextBox ID="Kredit" runat="server" CssClass="form-control"  placeholder="Masukan Angka Kredit"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:label runat="server">Category</asp:label>
                <asp:TextBox ID="Category" runat="server" CssClass="form-control"  placeholder="Masukan Kategori"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnedit" runat="server" CssClass="btn btn-info" Text="Edit" OnClick="btnedit_click"/>
            </div>
        </form>
   </div>
</body>
</html>
