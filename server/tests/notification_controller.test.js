const assert = require('assert');
const sinon = require('sinon');
const NotificationController = require('../controllers/notification_controller');
const NotificationService = require('../services/notification_service');
const NoteService = require('../services/note_service');
const { google } = require('googleapis');

const req = { user: { userID: 'someUserID' }, body: {}, params: {} };
const res = { status: sinon.stub(), json: sinon.stub() };

describe('NotificationController', function() {
  let req, res;

  beforeEach(function () {
    req = { body: {}, params: {}, user: { userID: 'someUserID' } };
    res = {
      status: sinon.stub().returnsThis(),
      json: sinon.stub(),
      sendStatus: sinon.stub()
    };
  });

  describe('#getAllNotification()', function() {
    it('should get all notifications successfully', async function() {
      sinon.stub(NotificationService, 'getAllNotification').resolves([{ message: 'notification 1' }, { message: 'notification 2' }]);

      await NotificationController.getAllNotification(req, res);

      sinon.assert.calledOnce(NotificationService.getAllNotification);
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.json, { notifications: [{ message: 'notification 1' }, { message: 'notification 2' }] });

      NotificationService.getAllNotification.restore();
    });

    it('should handle errors', async function() {
      sinon.stub(NotificationService, 'getAllNotification').throws(new Error('Test error'));

      await NotificationController.getAllNotification(req, res);

      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });

      NotificationService.getAllNotification.restore();
    });
  });

  describe('#addNotification()', function() {
    it('should add a notification successfully', async function() {
      req.body = { message: 'New notification' };

      sinon.stub(NotificationService, 'addNotification').resolves();

      await NotificationController.addNotification(req, res);

      sinon.assert.calledOnce(NotificationService.addNotification);
      sinon.assert.calledWith(NotificationService.addNotification, 'someUserID', { message: 'New notification' });
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.json, { Message: "The Notification Successfully Added" });

      NotificationService.addNotification.restore();
    });

    it('should handle errors', async function() {
      req.body = { message: 'New notification' };

      sinon.stub(NotificationService, 'addNotification').throws(new Error('Test error'));

      await NotificationController.addNotification(req, res);

      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });

      NotificationService.addNotification.restore();
    });
  });

  describe('#deleteNotification()', function() {
    it('should delete a notification successfully', async function() {
      req.params.notificationID = 'notificationID123';

      sinon.stub(NotificationService, 'deleteNotification').resolves();

      await NotificationController.deleteNotification(req, res);

      sinon.assert.calledOnce(NotificationService.deleteNotification);
      sinon.assert.calledWith(NotificationService.deleteNotification, 'someUserID', 'notificationID123');
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.json, { Message: "The Notification Successfully Deleted" });

      NotificationService.deleteNotification.restore();
    });

    it('should handle errors', async function() {
      req.params.notificationID = 'notificationID123';

      sinon.stub(NotificationService, 'deleteNotification').throws(new Error('Test error'));

      await NotificationController.deleteNotification(req, res);

      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });

      NotificationService.deleteNotification.restore();
    });
  });

});