const sinon = require('sinon');
const assert = require('assert');
const QuizController = require('../controllers/quiz_controller');
const quizService = require('../services/quiz_service');

describe('QuizController', function() {
  describe('#generateQuiz()', function() {
    let req, res;

    beforeEach(function() {
      req = { body: { content: 'Some quiz content' } };
      res = {
        status: sinon.stub().returnsThis(),
        json: sinon.stub()
      };
    });

    afterEach(function() {
      sinon.restore();
    });

    it('should add scheduled quiz details successfully', async function() {
      req.user = { userID: 'user123' };
      req.body = { scheduledQuizDetails: { quizID: 'quiz123', scheduleTime: '2024-04-01' } };
      sinon.stub(quizService, 'addScheduleQuizDetails').resolves();
    
      await QuizController.addScheduledQuizDetails(req, res);
    
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.json, { Message: "The Quiz Successfully Scheduled" });
    });
    
    it('should handle add scheduled quiz details error', async function() {
      req.user = { userID: 'user123' };
      req.body = { scheduledQuizDetails: { quizID: 'quiz123', scheduleTime: '2024-04-01' } };
      sinon.stub(quizService, 'addScheduleQuizDetails').throws(new Error('Add schedule quiz details error'));
    
      await QuizController.addScheduledQuizDetails(req, res);
    
      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });
    });

    it('should get all scheduled quiz details successfully', async function() {
      req.user = { userID: 'user123' };
      sinon.stub(quizService, 'getAllScheduledQuizDetails').resolves([
        { quizID: 'quiz1', scheduleTime: '2024-04-01' },
        { quizID: 'quiz2', scheduleTime: '2024-04-02' }
      ]);
    
      await QuizController.getAllScheduledQuizDetails(req, res);
    
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.json, { scheduleDetails: [
        { quizID: 'quiz1', scheduleTime: '2024-04-01' },
        { quizID: 'quiz2', scheduleTime: '2024-04-02' }
      ] });
    });
    
    it('should handle get all scheduled quiz details error', async function() {
      req.user = { userID: 'user123' };
      sinon.stub(quizService, 'getAllScheduledQuizDetails').throws(new Error('Get all scheduled quiz details error'));
    
      await QuizController.getAllScheduledQuizDetails(req, res);
    
      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });
    });
    
    it('should delete scheduled quiz details successfully', async function() {
      req.user = { userID: 'user123' };
      req.params = { scheduledQuizDetailsID: 'quiz123' };
      sinon.stub(quizService, 'deleteScheduledQuizDetails').resolves();
    
      await QuizController.deleteScheduledQuizDetails(req, res);
    
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.json, { Message: "The Quiz Preference Deleted" });
    });
    
    it('should handle delete scheduled quiz details error', async function() {
      req.user = { userID: 'user123' };
      req.params = { scheduledQuizDetailsID: 'quiz123' };
      sinon.stub(quizService, 'deleteScheduledQuizDetails').throws(new Error('Delete scheduled quiz details error'));
    
      await QuizController.deleteScheduledQuizDetails(req, res);
    
      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });
    });
    
    it('should update scheduled quiz details successfully', async function() {
      req.user = { userID: 'user123' };
      req.body = { scheduledQuizDetails: { quizID: 'quiz123', scheduleTime: '2024-04-01' } };
      sinon.stub(quizService, 'updateScheduledQuizDetails').resolves();
    
      await QuizController.updateScheduledQuizDetails(req, res);
    
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.json, { Message: "The Quiz Preference Changed" });
    });
    
    it('should handle update scheduled quiz details error', async function() {
      req.user = { userID: 'user123' };
      req.body = { scheduledQuizDetails: { quizID: 'quiz123', scheduleTime: '2024-04-01' } };
      sinon.stub(quizService, 'updateScheduledQuizDetails').throws(new Error('Update scheduled quiz details error'));
    
      await QuizController.updateScheduledQuizDetails(req, res);
    
      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });
    });
    

    it('should handle errors', async function() {
      sinon.stub(quizService, 'generateQuiz').throws(new Error('Test error'));

      await QuizController.generateQuiz(req, res);

      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });
    });
  });
});
