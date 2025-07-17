Feature: Actualizar un usuario por ID

  Background:
    * url baseUrl
    * configure headers = headers
    * def UUID = Java.type('java.util.UUID')

  Scenario: Actualizar usuario exitosamente
    * def emailNuevo = 'usuario.' + UUID.randomUUID() + '@correo.com'
    * def usuarioActualizado =
      """
      {
        "nome": "David Angel",
        "email": "#(emailNuevo)",
        "password": "teste",
        "administrador": "true"
      }
      """
    Given path 'usuarios', '0uxuPY0cbmQhpEz1'
    And request usuarioActualizado
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

  Scenario: Validad error al actualizar usuario con email existente
    * def usuarioEmailExistente = read('classpath:data/usuarioEmailExistente.json')

    Given path 'usuarios', '4XjyXJ7OvbcMO8Zz'
    And request usuarioEmailExistente
    When method put
    Then status 400
    And match response.message == 'Este email já está sendo usado'
