Feature: HU-1 Login y validación de Compra SauceDemo

  @Scenario03
  Scenario: ES-003 Agregar producto al carrito
    Given el usuario ha ingresado sesión con éxito a SauceDemo
    When debe ser redirigido a la página de productos    
    When hace clic en el botón Add to cart de un producto
    Then el ícono del carrito debe mostrar la cantidad de productos actualizada

  @Scenario04
  Scenario: ES-004 Visualizar productos en el carrito
    Given el usuario ha ingresado sesión con éxito a SauceDemo
    When debe ser redirigido a la página de productos  
    When hace clic en el botón Add to cart de un producto
    And hace clic en el ícono del carrito
    Then debe visualizar el productos seleccionado con su nombre, descripción y precio

  @Scenario05
  Scenario: ES-005 Completar proceso de compra
    Given el usuario ha ingresado sesión con éxito a SauceDemo
    When debe ser redirigido a la página de productos
    And hace clic en el botón Add to cart de un producto
    And hace clic en el ícono del carrito
    And hace clic en Checkout
    And completa el formulario con su información
    And hace clic en Continue y luego en Finish
    Then debe mostrarse un mensaje de confirmación de la compra
