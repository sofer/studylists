// cache testing: 1

String.prototype.simplify = function () {
  return this.replace(/[,.!?\-\\']/g, '').toLowerCase();
};

String.prototype.stripAccents = function () {
  var str = this;
  str = str.replace(/À|Á|Â|Ã|Ä|Å|à|á|â|ã|ä|å/ig,'a');
  str = str.replace(/Ò|Ó|Ô|Õ|Ö|Ø|ò|ó|ô|õ|ö|ø/ig,'o');
  str = str.replace(/È|É|Ê|Ë|è|é|ê|ë/ig,'e');
  str = str.replace(/Ç|ç/ig,'c');
  str = str.replace(/Ì|Í|Î|Ï|ì|í|î|ï/ig,'i');
  str = str.replace(/Ù|Ú|Û|Ü|ù|ú|û|ü/ig,'u');
  str = str.replace(/ÿ/ig,'y');
  str = str.replace(/Ñ|ñ/ig,'n');
  return str;
};

String.prototype.stripExtraSpaces = function () {
  var str = this;
  str = str.replace(/^\s+/g, '');
  str = str.replace(/\s+$/g, '');
  str = str.replace(/\s+/g, ' ');
  return str;
};

String.prototype.stripAllSpaces = function () {
  return this.replace(/\s/g, '');
};

String.prototype.reverse = function () {
  return this.split('').reverse().join('')
}; 

String.prototype.isBoolean = function () {
  if (this === 'true' || this === 'false' || this === 'yes' || this === 'no' ) {
    return true
  }
};

//http://stackoverflow.com/questions/5223/length-of-javascript-associative-array
Object.size = function(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};

// see http://stackoverflow.com/questions/2010892/storing-objects-in-html5-localstorage
Storage.prototype.setObject = function(key, value) {
    this.setItem(key, JSON.stringify(value));
}
Storage.prototype.getObject = function(key) {
    return JSON.parse(this.getItem(key));
}

var SL = {}

SL.DOMnodes = {
  question: '#question',
  answer: '#answer',
  responseForm: '#response-form',
  responseField: '#response-field',
  alert: "#alert" 
}

// careful with this. get from SLData while testing
SL.getData = function() {
//  return localStorage.getObject('subjects');
  //return SLData.subjects;
}

SL.session = {

  subjects: [], //SL.getData(),
  currentSubject: null,
  currentTopic: null,
  currentExercise: null,
  stacks: [ [], [], [], [] ],
  currentStack: 0,
  stackLimit: 3, // 4 or more will cause breakage
  previouslyIncorrect: false,
  finished: false,
  
  updateCourseList: function() {
    alert("Not yet implemented");
  },
  
  getCourses: function() {
    //localStorage.removeItem('subjects');
    this.subjects = localStorage.getObject('subjects') || [];
    if (this.subjects.length > 0) {
      this.loadCourses();
    } else {
      this.getRemoteCourses();
    }
  },
  
  // json request
  getRemoteCourses: function() {
    var that = this;
    var jsonUrl = 'http://' + document.location.host + '/subjects.json';
    $.ajax({
      url: jsonUrl,
      dataType: 'json',
      error: function () {
        alert("Failed to retrieve course list. Please try again later.");
      },
      success: function(json){
        localStorage.setObject('subjects', json);
        that.getCourses();
      }
    });
  },
  
  loadCourses: function() {
    $("#courses ul").empty();
    for (var subject in this.subjects) {
      var s = this.subjects[subject];
      //var link = this.updateLink("topics", subject, s.name, this.courseInfo(subject), "course");
      var link = this.updateLink("topics", subject, s.name, this.courseInfo(subject), "course");
      $("#courses ul").append(link);
    }
  },
  
  courseInfo: function(subjectId) {
    if (this.subjects[subjectId].topics) {
      var topicCount = Object.size(this.subjects[subjectId].topics);
      return "("+ topicCount + " topics) Check for updates";      
    } else {
      return "download now";
    }
  },
  
  // slightly silly way of doing this
  updateLink: function(page, id, title, info, klass) {
    var item = $("#link-template").html();
    item = item.replace( /\[page\]/g,  page);
    item = item.replace( /\[id\]/g,  id);
    item = item.replace( /\[title\]/g,  title);
    item = item.replace( /\[info\]/g,  info);
    item = item.replace( /\[class\]/g,  klass);
    return item;
  },

  preloadCourse: function(subjectId) {
    this.currentSubject = this.subjects[subjectId];
    $("#topics .toolbar h1").text(this.currentSubject.name);
    this.loadTopics();
  },
  
  preloadTopic: function(topicId) {
    this.currentTopic = this.currentSubject.topics[topicId];
    $("#lesson .toolbar h1").text(this.currentTopic.name);
    this.stacks[0] = this.currentTopic.exercises;
    this.loadNextExercise();
  },
    
  loadTopics: function() {
    $("#topics ul").empty();
    for (topic in this.currentSubject.topics) {
      var link = this.updateLink("lesson", topic, this.currentSubject.topics[topic].name, "(no description)", "topic");
      $("#topics ul").append(link);    
    }
  },
  
  loadNextExercise: function() {
    $(SL.DOMnodes.responseField).val('');
    this.previouslyIncorrect = false;
    if (this.currentExercise && this.currentStack < this.stackLimit) {
      this.stacks[this.currentStack+1].push(this.currentExercise);
    }
    this.currentExercise = null;
    this.currentStack = 0;
    while ((this.currentStack < this.stackLimit) && (!this.currentExercise)) {
      this.currentExercise = this.stacks[this.currentStack].shift();
      if (!this.currentExercise) {
        this.currentStack++;
      }
    }
    if (this.currentExercise) {
      $(SL.DOMnodes.question).html(this.currentExercise.phrase);
      if (this.currentStack == 0) {
        this.showAnswer();
      } else {
        this.awaitResponse();
      }
    } else {
      this.finished = true;
      $(SL.DOMnodes.question).html('');
      $(SL.DOMnodes.responseField).hide();
      $(SL.DOMnodes.alert).text("Today's lesson finished. Well done!");
      $(SL.DOMnodes.alert).show();
    }
  },
  
  showResponseMessage: function(message,klass) {
    $(SL.DOMnodes.alert).addClass(klass);
    $(SL.DOMnodes.alert).text(message);
    $(SL.DOMnodes.alert).show().fadeOut(1000);
  },
  
  showAnswer: function() {
    $(SL.DOMnodes.responseField).hide();
    $(SL.DOMnodes.answer).show();
    $(SL.DOMnodes.answer).text(this.currentExercise.response);
    $(SL.DOMnodes.tryNow).focus();
    //this.showResponseMessage('touch or click to go', 'go')
  },
  
  awaitResponse: function() {
    //$(SL.DOMnodes.formattedResponse).val('');
    $(SL.DOMnodes.alert).hide();
    $(SL.DOMnodes.answer).hide();
    $(SL.DOMnodes.responseField).val('');
    $(SL.DOMnodes.responseField).removeClass('incorrect');
    $(SL.DOMnodes.responseField).show();
    $(SL.DOMnodes.responseField).focus();
  },
  
  tryAgain: function () {
    $(SL.DOMnodes.responseField).addClass('incorrect');
    this.previouslyIncorrect = true; // allow one re-try
    this.showResponseMessage('Try again', 'go');
    $(SL.DOMnodes.responseField).focus();
  },
  
  wrong: function () {
    this.stacks[0].unshift(this.currentExercise);
    this.showResponseMessage('check and try again','stop');
    this.loadNextExercise();
  },
  
  correct: function() {
    this.previouslyIncorrect = false;
    this.showResponseMessage('correct','go');
    this.loadNextExercise();
  },
  
  checkResponse: function (response) {
    if (this.finished === true) {
      return false;
    }
    response = response.stripExtraSpaces();
    if (response === '') {
      this.showResponseMessage('enter a response','go');
      this.awaitResponse();
      return false;
    }
    var expected = this.currentExercise.response.stripExtraSpaces();
    if (!this.currentTopic.caseSensitive) {
      response = response.toLowerCase();
      expected = expected.toLowerCase();
    }
    var match = false;
    if (expected.isBoolean()) {
      if (expected.charAt(0) === response.charAt(0)) {
        match = true;
      } 
    } else {
      if (this.currentTopic.ignorePunctuation === true) {
        expected = expected.simplify();
        response = response.simplify();
      }
      if (true) { //($(SL.DOMnodes.ignoreAccentsCheckbox).is(':checked')) 
        expected = expected.stripAccents();
        response = response.stripAccents();
      }
      if (false) { // (this.thisTopic.rtl) 
        response = response.reverse();
      }
      expected = expected.stripAllSpaces();
      response = response.stripAllSpaces();
      if (expected.match(/\|/)) { // i.e. it looks like a regex
        var pattern = new RegExp(expected);
        if (pattern.test(response)) {
          match = true;
        }
      } else {
        if (expected == response) {
          match = true;
        }
      }
    }
    if (match) {
      this.correct();
    } else {
      // incorrect
      if (this.previouslyIncorrect) { // || expected.isBoolean()) {
        this.wrong();
      } else {
        this.tryAgain();
      }
    }
  }

}

jQuery(function() {

  SL.session.getCourses();
  
  $(".course").tap(function(){
    SL.session.preloadCourse($(this).attr("data"));
  });

  $(".topic").tap(function(){
    SL.session.preloadTopic($(this).attr("data"));
  });

  $("#update-course-list").tap(function(){
    SL.session.getCourses();
    return false;
  });

  $("#lesson").click(function(){
    SL.session.awaitResponse();
  });

  $("#response-form").submit(function(){
    var response = $(SL.DOMnodes.responseField).val();
    SL.session.checkResponse(response);
    return false;
  });

  $(SL.DOMnodes.responseField).keydown(function(){
    $(SL.DOMnodes.responseField).removeClass('incorrect');
  });

});


