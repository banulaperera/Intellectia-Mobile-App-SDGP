const assert = require('assert');
const sinon = require('sinon');
const NoteController = require('../controllers/note_controller');
const NoteService = require('../services/note_service');

const req = { user: { userID: 'someUserID' }, body: {}, params: {} };
const res = { status: sinon.stub(), json: sinon.stub() };

describe('NoteController', function() {
  describe('#addNote()', function() {
    it('should add a note successfully', async function() {
      const req = { body: { title: 'Test Note', content: 'This is a test note' }, user: { userID: 'someUserID' } };
      const res = {
        status: sinon.stub().returnsThis(),
        json: sinon.stub()
      };
      sinon.stub(NoteService, 'addNote').resolves();

      await NoteController.addNote(req, res);

      sinon.assert.calledWith(NoteService.addNote, 'someUserID', { title: 'Test Note', content: 'This is a test note' });
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.json, { Message: "The Note Successfully Added" });

      NoteService.addNote.restore();
    });

    it('should handle errors', async function() {
      const req = { body: { title: 'Test Note', content: 'This is a test note' }, user: { userID: 'someUserID' } };
      const res = {
        status: sinon.stub().returnsThis(),
        json: sinon.stub()
      };
      sinon.stub(NoteService, 'addNote').throws(new Error('Test error'));

      await NoteController.addNote(req, res);

      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });

      NoteService.addNote.restore();
    });
  });

  describe('#getAllNote()', function() {
    it('should get all notes successfully', async function() {
      const req = { user: { userID: 'someUserID' } };
      const res = {
        status: sinon.stub().returnsThis(),
        json: sinon.stub()
      };
      sinon.stub(NoteService, 'getAllNotes').resolves([{ title: 'Note 1', content: 'Content 1' }, { title: 'Note 2', content: 'Content 2' }]);

      await NoteController.getAllNote(req, res);

      sinon.assert.calledWith(NoteService.getAllNotes, 'someUserID');
      sinon.assert.calledWith(res.status, 200);
      sinon.assert.calledWith(res.json, { notes: [{ title: 'Note 1', content: 'Content 1' }, { title: 'Note 2', content: 'Content 2' }] });

      NoteService.getAllNotes.restore();
    });

    it('should handle errors', async function() {
      const req = { user: { userID: 'someUserID' } };
      const res = {
        status: sinon.stub().returnsThis(),
        json: sinon.stub()
      };
      sinon.stub(NoteService, 'getAllNotes').throws(new Error('Test error'));

      await NoteController.getAllNote(req, res);

      sinon.assert.calledWith(res.status, 400);
      sinon.assert.calledWith(res.json, { Message: "The request is not completed " });

      NoteService.getAllNotes.restore();
    });
  });
});
