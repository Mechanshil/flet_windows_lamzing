import flet as ft

APP_VERSION = "v1.0.0"

def main(page: ft.Page):
    page.title = "Lamzing — Windows Test Build"
    page.theme_mode = ft.ThemeMode.DARK
    page.vertical_alignment = ft.MainAxisAlignment.CENTER
    page.horizontal_alignment = ft.CrossAxisAlignment.CENTER

    page.add(
        ft.Column(
            controls=[
                ft.Icon(ft.Icons.ROCKET_LAUNCH, size=60, color=ft.Colors.BLUE_400),
                ft.Text(
                    "Lamzing",
                    size=32,
                    weight=ft.FontWeight.BOLD,
                ),
                ft.Text(
                    f"Version {APP_VERSION}",
                    size=14,
                    color=ft.Colors.GREY_400,
                ),
                ft.Container(height=16),
                ft.Text(
                    "✅ Windows build is working!",
                    size=18,
                    color=ft.Colors.GREEN_400,
                ),
            ],
            horizontal_alignment=ft.CrossAxisAlignment.CENTER,
            alignment=ft.MainAxisAlignment.CENTER,
            spacing=8,
        )
    )

if __name__ == '__main__':
    ft.run(main)