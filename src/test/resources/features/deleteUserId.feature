Feature: Eliminar un usuario por ID

  Background:
    * url baseUrl
    * configure headers = headers
    * def UUID = Java.type('java.util.UUID')

  Scenario: Eliminar usuario exitosamente
    # Crear un nuevo usuario primero
    * def emailUnico = 'borrar.' + UUID.randomUUID() + '@correo.com'
    * def nuevoUsuario =
      """
      {
        "nome": "Usuario para eliminar",
        "email": "#(emailUnico)",
        "password": "123456",
        "administrador": "false"
      }
      """
    Given path 'usuarios'
    And request nuevoUsuario
    When method post
    Then status 201
    * def idUsuario = response._id

    # Eliminar el usuario
    Given path 'usuarios', idUsuario
    When method delete
    Then status 200
    And match response.message == 'Registro excluído com sucesso'

  Scenario: Eliminar usuario inexistente
    Given path 'usuarios', '1234567890123456'
    When method delete
    Then status 200
    And match response.message == 'Nenhum registro excluído'

  Scenario: Validar error al eliminar usuario con carrito
    Given path 'usuarios', '0uxuPY0cbmQhpEz1'
    When method delete
    Then status 400
    And match response.message == 'Não é permitido excluir usuário com carrinho cadastrado'