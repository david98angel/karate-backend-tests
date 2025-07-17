Feature: Buscar usuario por ID

  Background:
    * url baseUrl
    * configure headers = headers

  Scenario: Obtener un usuario existente por su ID
    Given path 'usuarios', '4XjyXJ7OvbcMO8Zz'
    When method get
    Then status 200
    And match response._id == '4XjyXJ7OvbcMO8Zz'
    And match response.nome == 'Pat Fisher'
    And match response.email == 'Keith.Morissette@yahoo.com'

  Scenario: Validar error de un usuario inexistente por su ID
    Given path 'usuarios', '1234567890123456'
    When method get
    Then status 400
    And match response.message == 'Usuário não encontrado'