<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to implement a focusable preview row</title>
	<style>
		.myFocusedRow
		{
			color: white;
			background-color: rgb(141, 141, 141);
		}
	</style>
	<script src="Scripts/jquery-1.7.1.js"></script>
</head>
<body>
	<script type="text/javascript">
		function onRowClick(rowIndex) {
			ASPxGridView1.SetFocusedRowIndex(rowIndex);
		}
		function focusedRowChanged(s, e) {
			$('.myFocusedRow').removeClass('myFocusedRow');
			$('.dxgvFocusedRow').next('.dxgvPreviewRow').addClass('myFocusedRow');
		}
	</script>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" PreviewFieldName="Notes" ClientInstanceName="ASPxGridView1"
				OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared" KeyFieldName="EmployeeID">
				<ClientSideEvents FocusedRowChanged="focusedRowChanged" />
				<Columns>
					<dx:GridViewDataTextColumn FieldName="EmployeeID"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="LastName"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="FirstName"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Title"></dx:GridViewDataTextColumn>
				</Columns>
				<Settings ShowPreview="true" />
				<SettingsBehavior AllowFocusedRow="true" />
			</dx:ASPxGridView>
		</div>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyNorthwind%>" SelectCommand="SELECT EmployeeID, LastName, FirstName, Title, Notes FROM Employees" />
	</form>
</body>
</html>