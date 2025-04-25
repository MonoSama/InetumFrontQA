Feature: HU-1 Login y validación de Compra SauceDemo

  @Scenario01
  Scenario: ES-001 Inicio de sesión exitoso
    Given el usuario se encuentra en el login de SauceDemo
    When ingresa un nombre de usuario válido y contraseña válida
    And hace clic en el botón Login
    Then debe ser redirigido a la página de productos

  @Scenario02
  Scenario: ES-002 Inicio de sesión fallido
    Given el usuario se encuentra en el login de SauceDemo
    When ingresa un nombre de usuario inválido o contraseña inválida
    And hace clic en el botón Login
    Then debe mostrarse un mensaje de error indicando que las credenciales son incorrectas


