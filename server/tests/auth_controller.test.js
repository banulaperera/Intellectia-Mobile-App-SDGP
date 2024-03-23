const assert = require('assert');
const sinon = require('sinon');
const AuthController = require('../controllers/auth_controller');
const jwt = require('jsonwebtoken');

const req = { body: {} };
const res = { sendStatus: sinon.stub(), status: sinon.stub(), send: sinon.stub() };

describe('AuthController', function() {
  describe('#newToken()', function() {
    it('should generate a new access token successfully', async function() {
      const req = { body: { refreshToken: 'validRefreshToken' } };
      const res = {
        status: sinon.stub().returnsThis(),
        send: sinon.stub()
      };
      sinon.stub(jwt, 'verify').callsArgWith(2, null, { userID: 'someUserID' });
      sinon.stub(jwt, 'sign').returns('newAccessToken');

      await AuthController.newToken(req, res);

      sinon.assert.calledWith(jwt.verify, 'validRefreshToken', process.env.REFRESH_TOKEN_KEY, sinon.match.func);
      sinon.assert.calledWith(jwt.sign, { userID: 'someUserID' }, process.env.ACCESS_TOKEN_KEY, { expiresIn: '5m' });
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.send, { accessToken: 'newAccessToken' });

      jwt.verify.restore();
      jwt.sign.restore();
    });

    it('should handle missing refreshToken', async function() {
      const req = { body: {} };
      const res = {
        sendStatus: sinon.stub()
      };

      await AuthController.newToken(req, res);

      sinon.assert.calledWith(res.sendStatus, 401);
    });

    it('should handle invalid refreshToken', async function() {
      const req = { body: { refreshToken: 'invalidRefreshToken' } };
      const res = {
        sendStatus: sinon.stub()
      };
      sinon.stub(jwt, 'verify').callsArgWith(2, new Error('Invalid token'));

      await AuthController.newToken(req, res);

      sinon.assert.calledWith(res.sendStatus, 401);

      jwt.verify.restore();
    });

    it('should handle errors', async function() {
      const req = { body: { refreshToken: 'validRefreshToken' } };
      const res = {
        status: sinon.stub().returnsThis(),
        json: sinon.stub()
      };
      sinon.stub(jwt, 'verify').callsArgWith(2, new Error('Test error'));

      await AuthController.newToken(req, res);

      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });

      jwt.verify.restore();
    });
  });
});