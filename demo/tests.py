from django.test import SimpleTestCase


class RutasBasicasTests(SimpleTestCase):
    def test_health_responde_ok(self):
        respuesta = self.client.get('/health/')
        self.assertEqual(respuesta.status_code, 200)
        self.assertEqual(respuesta.json(), {'status': 'ok'})

    def test_raiz_lista_los_enlaces(self):
        respuesta = self.client.get('/')
        self.assertEqual(respuesta.status_code, 200)
        datos = respuesta.json()
        self.assertEqual(datos['health'], '/health/')
        self.assertEqual(datos['users'], '/api/users/')
