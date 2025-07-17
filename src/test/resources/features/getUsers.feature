Feature: Obtener lista de usuarios registrados

  Background:
    * url baseUrl
    * configure headers = headers

  Scenario: Obtener todos los usuarios exitosamente
    Given path 'usuarios'
    When method get
    Then status 200
    And match response == { quantidade: '#number', usuarios: '#[]' }


  Scenario: Validar esquema de respuesta para lista de usuarios
    Given path 'usuarios'
    When method get
    Then status 200
    And match response.usuarios[0] contains { nome: '#string', email: '#string', password: '#string', administrador: '#string', _id: '#string' }

