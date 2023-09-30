using Microsoft.EntityFrameworkCore.Migrations;

namespace DealCart.DAL.Migrations
{
    public partial class AddProductImages : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsAvailable",
                table: "tblProducts");

            migrationBuilder.RenameColumn(
                name: "IsOffer",
                table: "tblProducts",
                newName: "IsShippingFree");

            migrationBuilder.RenameColumn(
                name: "ImageUrl",
                table: "tblProducts",
                newName: "Status");

            migrationBuilder.AlterColumn<string>(
                name: "ShortDescription",
                table: "tblProducts",
                type: "nvarchar(300)",
                maxLength: 300,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "tblProducts",
                type: "nvarchar(150)",
                maxLength: 150,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "tblProducts",
                type: "nvarchar(500)",
                maxLength: 500,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AddColumn<int>(
                name: "Inventory",
                table: "tblProducts",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<float>(
                name: "ShippingCharges",
                table: "tblProducts",
                type: "real",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "tblProductImages",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductID = table.Column<int>(type: "int", nullable: false),
                    SortOrder = table.Column<int>(type: "int", nullable: false),
                    ImagePath = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tblProductImages", x => x.ID);
                    table.ForeignKey(
                        name: "FK_tblProductImages_tblProducts_ProductID",
                        column: x => x.ProductID,
                        principalTable: "tblProducts",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_tblProductImages_ProductID",
                table: "tblProductImages",
                column: "ProductID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "tblProductImages");

            migrationBuilder.DropColumn(
                name: "Inventory",
                table: "tblProducts");

            migrationBuilder.DropColumn(
                name: "ShippingCharges",
                table: "tblProducts");

            migrationBuilder.RenameColumn(
                name: "Status",
                table: "tblProducts",
                newName: "ImageUrl");

            migrationBuilder.RenameColumn(
                name: "IsShippingFree",
                table: "tblProducts",
                newName: "IsOffer");

            migrationBuilder.AlterColumn<string>(
                name: "ShortDescription",
                table: "tblProducts",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(300)",
                oldMaxLength: 300);

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "tblProducts",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(150)",
                oldMaxLength: 150);

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "tblProducts",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(500)",
                oldMaxLength: 500);

            migrationBuilder.AddColumn<bool>(
                name: "IsAvailable",
                table: "tblProducts",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }
    }
}
