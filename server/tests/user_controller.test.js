const assert = require('assert');
const sinon = require('sinon');
const UserController = require('../controllers/user_controller');
const UserService = require('../services/user_service');
const passwordUtil = require('../util/password_util');
const jwt = require('jsonwebtoken');

const req = { body: {}, user: { userID: 'someUserID' } };
const res = { status: sinon.stub(), json: sinon.stub() };

describe('UserController', function() {
  describe('#registerUser()', function() {
    it('should register a user successfully', async function() {
      req.body.email = 'test@example.com';
      req.body.password = 'password';
      
      const res = {
          status: sinon.stub().returnsThis(), 
          json: sinon.stub()
      };

      sinon.stub(UserService, 'checkUserEmail').resolves(null);
      sinon.stub(UserService, 'userRegistration').resolves();
      
      await UserController.registerUser(req, res);

      sinon.assert.calledOnce(UserService.checkUserEmail);
      sinon.assert.calledWith(UserService.userRegistration, 'test@example.com', 'password');
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.json, { Message: "User Registered Successfully" });

      UserService.checkUserEmail.restore();
      UserService.userRegistration.restore();
    });

    it('should handle existing email', async function() {
      req.body.email = 'existing@example.com';
      req.body.password = 'password';
  
      const res = {
          status: sinon.stub().returnsThis(), 
          json: sinon.stub()
      };
  
      sinon.stub(UserService, 'checkUserEmail').resolves({ email: 'existing@example.com' });
  
      await UserController.registerUser(req, res);
  
      sinon.assert.calledOnce(UserService.checkUserEmail);
      sinon.assert.calledWith(res.status, 409);
      sinon.assert.calledWith(res.json, { Message: "Email Address is already taken" });
  
      UserService.checkUserEmail.restore();
    });
  

    it('should handle errors', async function() {
      req.body.email = 'test@example.com';
      req.body.password = 'password';
  
      const res = {
          status: sinon.stub().returnsThis(), 
          json: sinon.stub()
      };
  
      sinon.stub(UserService, 'checkUserEmail').throws(new Error('Test error'));
  
      await UserController.registerUser(req, res);
  
      sinon.assert.calledOnce(UserService.checkUserEmail);
      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });
  
      UserService.checkUserEmail.restore();
    });
  
  });

});
