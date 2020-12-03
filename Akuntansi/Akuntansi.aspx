<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Akuntansi.aspx.cs" Inherits="Akuntansi.Akuntansi" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">  
    <asp:UpdatePanel ID="upCrudGrid" runat="server">  
        <ContentTemplate>  
            <br />  
			<asp:Button ID="btnadd" runat="server" Text="Add New Journal" CssClass="btn btn-info" OnClick="btnadd_click" />  
            <br />  
            <br />
			 <asp:TextBox ID="txtcari" AutoPostBack="true" runat="server" ToolTip="Search by part of EmployeeName" Height="18px"></asp:TextBox> 
			<asp:Button ID="btncari" Text="Search" runat="server" CausesValidation="false" OnClick="btncari_Click" /> 
            <br />  
            <br />
            <div style="background-color: steelblue; height: 59px; width: 1067px; margin: 0; padding: 0">  
				<table cellspacing="0" cellpadding="0" rules="all" border="1" id="tblHeader"  
					style="font-family: Arial; font-size: 12pt; width: 1070px; color: white; border-collapse: collapse; height: 100%;">  
					<tr>  
						<td style="width: 50px; text-align: center">DATE</td>  
                        
                        <td style="width: 100px; text-align: center">NAMA JURNAL</td>  
                        <td style="width: 200px; text-align: center">REF</td>  
                        <td style="width: 100px; text-align: center">DEBIT</td>  
                        <td style="width: 200px; text-align: center">KREDIT</td>  
                        <td style="width: 200px; text-align: center">CATEGORY</td>  
						<td style="width: 50px; text-align: center">ACTION</td>  
                    </tr>  
                </table> 
            </div>
			
			<div style="height: 500px; width: 1069px; overflow: auto;">  
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Font-Names="Arial" ShowHeader="false" Font-Size="11pt" DataKeyNames="ean" OnRowCommand="GridView1_RowCommand" AlternatingRowStyle-BackColor="#C2D69B" Height="50px" Width="1067px">
					<AlternatingRowStyle BackColor="#C2D69B" />
					<Columns>  
						<asp:TemplateField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center">  
							<ItemTemplate>  
								<%# Container.DataItemIndex + 1 %>
							</ItemTemplate>  
							<ItemStyle HorizontalAlign="Center" Width="50px" /> 
						</asp:TemplateField>  
						<asp:BoundField ItemStyle-Width="50px" HeaderText="RowID" DataField="RowID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">  
                            <HeaderStyle CssClass="hiddencol" />  
                            <ItemStyle CssClass="hiddencol" Width="50px" />  
                        </asp:BoundField>  
                        <asp:BoundField ItemStyle-Width="100px" DataField="RowDate" HeaderText="RowDate" ItemStyle-HorizontalAlign="Center">  
                            <ItemStyle HorizontalAlign="Center" Width="100px" />  
                        </asp:BoundField>  
                        <asp:BoundField ItemStyle-Width="200px" DataField="AccountName" HeaderText="AccountName" ItemStyle-HorizontalAlign="Center">  
                            <ItemStyle HorizontalAlign="Center" Width="200px" />  
                        </asp:BoundField>  
                        <asp:BoundField ItemStyle-Width="100px" DataField="RowRef" HeaderText="RowRef" ItemStyle-HorizontalAlign="Center">  
                            <ItemStyle HorizontalAlign="Center" Width="100px" />  
                        </asp:BoundField>  
                        <asp:BoundField ItemStyle-Width="200px" DataField="Debit" HeaderText="Debit" ItemStyle-HorizontalAlign="Center">  
                            <ItemStyle HorizontalAlign="Center" Width="200px" />  
                        </asp:BoundField>
						<asp:BoundField ItemStyle-Width="100px" DataField="Kredit" HeaderText="Kredit" ItemStyle-HorizontalAlign="Center">  
                            <ItemStyle HorizontalAlign="Center" Width="100px" />  
                        </asp:BoundField> 
						<asp:BoundField ItemStyle-Width="200px" DataField="Category" HeaderText="Category" ItemStyle-HorizontalAlign="Center">  
                            <ItemStyle HorizontalAlign="Center" Width="200px" />  
                        </asp:BoundField>
  
                        <asp:ButtonField ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Right" CommandName="btnedit" ControlStyle-CssClass="btn btn-info"  
                            ButtonType="Button" Text="Edit" HeaderText="btnedit">  
                            <ControlStyle CssClass="btn btn-outline-success btn-block mg-b-10"></ControlStyle>  
                            <ItemStyle HorizontalAlign="Right" Width="100px" />  
                        </asp:ButtonField>  

                        <asp:ButtonField ItemStyle-Width="100px" CommandName="btndelete" ControlStyle-CssClass="btn btn-danger"  
                            ButtonType="Button" Text="Delete" HeaderText="btndelete">  
                            <ControlStyle CssClass="btn btn-outline-warning btn-block mg-b-10"></ControlStyle>  
                            <ItemStyle Width="100px" />  
                        </asp:ButtonField>  
                    </Columns>  
                </asp:GridView>  
            </div>  
        </ContentTemplate>  
        <Triggers>  
        </Triggers>  
    </asp:UpdatePanel>  
    <div class="card-body pd-x-25 pd-b-25 pd-t-0">  
		<div class="row no-gutters">  
                    <div id="addModal" class="modal fade">  
                        <div class="modal-dialog modal-sm" role="document">  
                            <div class="modal-content tx-size-sm">  
                                <div class="modal-header pd-x-20">  
                                    <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Add Journal</h6>  
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">  
                                        <span aria-hidden="true">×</span>  
                                    </button>  
                                </div>  
  
                                <asp:UpdatePanel ID="upAdd" runat="server">  
  
                                    <ContentTemplate>  
  
                                        <div class="modal-body pd-20">  
  
                                            <table style="border-width: 0px;">   
	                                                <tr>  
	                                                    <td>Row Date</td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="RowDate" placeholder="Enter Date" runat="server"></asp:TextBox>  
	                                                    </td>  
	                                                </tr>  
	                                                 <tr>  
	                                                    <td>Account Name</td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="AccountName" placeholder="Enter Name" runat="server"></asp:TextBox>  
	                                                    </td>  
	                                                </tr>  
	                                                 <tr>  
	                                                    <td>Row Ref</td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="RowRef" placeholder="Ref" runat="server"></asp:TextBox>  
	                                                    </td>  
	                                                </tr>  
	                                                 <tr>  
	                                                    <td>Debit</td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="Debit" placeholder="Enter Debit" runat="server"></asp:TextBox>  
	                                                    </td>  
	                                                </tr>  
													<tr>  
	                                                    <td>Kredit</td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="Kredit" placeholder="Enter Kredit" runat="server"></asp:TextBox>  
	                                                    </td>  
	                                                </tr>
													<tr>  
	                                                    <td>Category</td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="Category" placeholder="Enter Category" runat="server"></asp:TextBox>  
	                                                    </td>  
	                                                </tr> 
	                                            </table>  
	  
	                                        </div>  
	                                        <!-- modal-body -->  
	                                        <div class="modal-footer">  
	                                            <asp:Button ID="btnAddRecord" runat="server" Text="Add" CssClass="btn btn-info" OnClick="btnadd_click" ValidationGroup="save-modal" />  
	                                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>  
	                                        </div>  
	                                    </ContentTemplate>  
	                                    <Triggers>   
	                                        <asp:AsyncPostBackTrigger ControlID="btnadd" EventName="Click" />  
	                                    </Triggers>  
	                                </asp:UpdatePanel>  
	                            </div>  
	                        </div>  
	                        <!-- modal-dialog edit -->  
	                    </div>  
	                    <div id="editModal" class="modal fade">  
	                        <div class="modal-dialog modal-sm" role="document">  
	                            <div class="modal-content tx-size-sm">  
	                                <div class="modal-header pd-x-20">  
	                                    <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Edit Product</h6>  
	                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">  
	                                        <span aria-hidden="true">×</span>  
	                                    </button>  
	                                </div>  
	  
	                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
	  
	                                    <ContentTemplate>  
	  
	                                        <div class="modal-body pd-20">  
	  
	                                            <table style="border-width: 0px;">  
	                                                <tr>  
	                                                    <td>Date</td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                       <asp:TextBox CssClass="form-control" ID="txtEditCategory" placeholder="Ex: 100" runat="server"></asp:TextBox>  
	                                                        <asp:Label ID="RowDate" runat="server"></asp:Label>  
	                                                    </td>  
	                                                </tr>  
	                                            
	                                                <tr>  
	                                                    <td>Account Name </td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="txtEditProductName" placeholder="Ex: Coca Cola" runat="server"></asp:TextBox>  
	                                                        <asp:Label ID="AccountName" runat="server"></asp:Label>  
	                                                    </td>  
	                                                </tr>  
	  
	                                                <tr>  
	                                                    <td>Ref </td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="txtEditPrice" placeholder="Ex: 100" runat="server"></asp:TextBox>  
	                                                        <asp:Label ID="RowRef" runat="server"></asp:Label>  
	                                                    </td>  
	                                                </tr>  
	                                                <tr>  
	                                                    <td>Debit</td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="txtEditDesc" placeholder="Ex: Name Descreption" runat="server"></asp:TextBox>  
	                                                        <asp:Label ID="Label2" runat="server"></asp:Label>  
	                                                    </td>  
	                                                </tr>
													<tr>  
	                                                    <td>Kredit</td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="TextBox1" placeholder="Ex: Name Descreption" runat="server"></asp:TextBox>  
	                                                        <asp:Label ID="Label1" runat="server"></asp:Label>  
	                                                    </td>  
	                                                </tr>
													<tr>  
	                                                    <td>Category</td>  
	                                                    <td>: </td>  
	                                                    <td> </td>  
	                                                    <td>  
	                                                        <asp:TextBox CssClass="form-control" ID="TextBox2" placeholder="Ex: Name Descreption" runat="server"></asp:TextBox>  
	                                                        <asp:Label ID="Label3" runat="server"></asp:Label>  
	                                                    </td>  
	                                                </tr>  
	                                            </table>  
	  
	                                        </div>  
	                                        <!-- modal-body -->  
	                                        <div class="modal-footer">  
	                                            <asp:Label ID="lblResult" Visible="false" runat="server"></asp:Label>  
	                                            <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btn btn-info" OnClick="btnSave_Click" />  
	                                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>  
	                                        </div>  
	                                    </ContentTemplate>  
	                                    <Triggers>  
	                                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />  
	                                    </Triggers>  
	                                </asp:UpdatePanel>  
	                            </div>  
	                        </div>  
	                    </div>  
	                    <div id="deleteModal" class="modal fade">  
	  
	                        <div class="modal-dialog modal-sm" role="document">  
	                            <div class="modal-content tx-size-sm">  
	                                <div class="modal-header pd-x-20">  
	                                    <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Delete Product</h6>  
	                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">  
	                                        <span aria-hidden="true">×</span>  
	                                    </button>  
	                                </div>  
	                                <asp:UpdatePanel ID="upDel" runat="server">  
	                                    <ContentTemplate>  
	                                        <div class="modal-body  pd-20">  
	                                            Are you sure you want to delete the record?  
	                             
	                                    <asp:HiddenField ID="hfCode" runat="server" />  
	                                        </div>  
	                                        <div class="modal-footer">  
	                                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-info" OnClick="btnDelete_Click" />  
	                                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cancel</button>  
	                                        </div>  
	                                    </ContentTemplate>  
	                                    <Triggers>  
	                                        <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />  
	                                    </Triggers>  
	                                </asp:UpdatePanel>  
	                            </div>  
	  
	                        </div>  
	                        <!-- row -->  
	                    </div>  
	                </div>  
	  
	            </div>  
	  
	  
	    <script src="lib/popper.js/popper.js"></script>  
	    <script src="lib/bootstrap/bootstrap.js"></script>  
	    <script>  
			$(function () {
				$("#txtDate").datepicker();
				$('.date_field').datepicker({
					beforeShow: function () {
						setTimeout(function () {
							$('.ui-datepicker').css('z-index', 99999999999999);
                        }, 0);
                    }  
	            });
			});

        </script>  
	</asp:Content>  
