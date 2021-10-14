using Microsoft.EntityFrameworkCore.Migrations;

namespace jskr.Data.Migrations
{
    public partial class LeadTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "LeadId",
                table: "Event",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Lead",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    LeadSourceId = table.Column<int>(nullable: true),
                    Url = table.Column<string>(nullable: true),
                    Company = table.Column<string>(nullable: true),
                    Role = table.Column<string>(nullable: true),
                    Salary = table.Column<float>(nullable: false),
                    Hourly = table.Column<float>(nullable: false),
                    Location = table.Column<string>(nullable: true),
                    State = table.Column<string>(nullable: true),
                    ReserchNotes = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Lead", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Lead_Source_LeadSourceId",
                        column: x => x.LeadSourceId,
                        principalTable: "Source",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Event_LeadId",
                table: "Event",
                column: "LeadId");

            migrationBuilder.CreateIndex(
                name: "IX_Lead_LeadSourceId",
                table: "Lead",
                column: "LeadSourceId");

            migrationBuilder.AddForeignKey(
                name: "FK_Event_Lead_LeadId",
                table: "Event",
                column: "LeadId",
                principalTable: "Lead",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Event_Lead_LeadId",
                table: "Event");

            migrationBuilder.DropTable(
                name: "Lead");

            migrationBuilder.DropIndex(
                name: "IX_Event_LeadId",
                table: "Event");

            migrationBuilder.DropColumn(
                name: "LeadId",
                table: "Event");
        }
    }
}
