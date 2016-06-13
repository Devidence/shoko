
// Entry
var Entry = function(type, primaryFields) {

  this.hide = function() {
    primaryFields.forEach(function(fieldName){
      $("#new-question-" + fieldName).hide();
      $("#new-question-" + fieldName).val("");
    })

  };

  this.show = function() {
    $("#new-question-hidden-type").val(type);

    primaryFields.forEach(function(fieldName){
      $("#new-question-" + fieldName).show();
    })

    $("#new-question-description").focus();

  };

}; // end of Entry


// Appointment
var Appointment = function() {
  var Appointment = {};
  var entries = {};

  entries["q"] = new Entry("question",
                          ["description", "answer"])

  var readyKeys = _.keys(entries);
  var recordingKeys = ["escape"];
  var currentEntry;
  var listener = new window.keypress.Listener();

  var executeEntry = function(e) {
    currentEntry = entries[e.key];
    setToRecording();
    currentEntry.show();
  }

  var setToRecording = function() {
    listener.simple_combo("escape", function(e){
      currentEntry.hide();
      setToReady();
    });

    readyKeys.forEach(function(key) {
      listener.unregister_combo(key);
    });
  }

  var setToReady = function() {
    readyKeys.forEach(function(key) {
      listener.simple_combo(key, function(e) {
        executeEntry(e);
      });
    });
  }

  this.setup = function() {
    setToReady();
  }

  this.reset = function() {
    currentEntry.hide();
    setToReady();
  }

}; // end of Appointment



$(document).ready(function() {
  var appointment = new Appointment();
  appointment.setup();

  $('#new_question').bind('ajax:complete', function() {
    appointment.reset();
  });
});
