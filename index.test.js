const request = require('supertest');
const server = require('./index');

describe('Express App', () => {
  afterAll(() => {
    server.close();
  });

  it('should respond with "Hello from Farmers Market! Demo" when hitting the root endpoint', async () => {
    const response = await request(server).get('/');
    expect(response.status).toBe(200);
    expect(response.text).toBe('Hello from Farmers Market!');
  });

/*   it('should respond with "Hello from /test Node!" when hitting the /test endpoint', async () => {
    const response = await request(server).get('/test');
    expect(response.status).toBe(200);
    expect(response.text).toBe('Hello from /test Node!');
  }); */
});
