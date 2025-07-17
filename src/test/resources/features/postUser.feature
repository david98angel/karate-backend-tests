Feature: Registrar nuevo usuario

  Background:
    * url baseUrl
    * configure headers = headers
    * def UUID = Java.type('java.util.UUID')

  Scenario: Registrar usuario exitosamente
    * def emailUnico = 'david.lopez.' + UUID.randomUUID() + '@correo.com'
    * def nuevoUsuario =
      """
      {
        "nome": "David Lopez",
        "email": "#(emailUnico)",
        "password": "123456",
        "administrador": "true"
      }
      """
    Given path 'usuarios'
    And request nuevoUsuario
    When method post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

  Scenario: Validar error al registrar usuario con email existente
    * def usuarioEmailExistente = read('classpath:data/usuarioEmailExistente.json')

    Given path 'usuarios'
    And request usuarioEmailExistente
    When method post
    Then status 400
    And match response.message == 'Este email já está sendo usado'