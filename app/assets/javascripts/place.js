$(document).ready(function(){ // a page cannot be manipulated until document is 'ready'
  nextTrip();           //code inside this function will run only when doc is ready
  previousTrip()     //(page reads from top to bottom)
})

//Create a class object in ES6 syntax
class Comment{
  constructor(name, description, place_id) { //use constructor
    this.name = name;    //use keys that match variables
    this.description = description;
    this.place_id = place_id;
  }
}

//create a prototype
Comment.prototype.makeComment = function() { //prototype function on Comment class
  let html = ''    //set html = to empty string
  html += `<p class="comments">${this.description}</p>` //html can be empty or more
  html += `<p class="comment_by">By: ${this.name}</p>`
  return html; //return the new html
};

//load comments index using json
 $(function(){
   $("a.load_comments").on("click", function(e){ //binds to page; on click of load comments button
     $("a.load_comments").hide();                 //hide load_comments button on click
     $.getJSON(this.href).success(function(json){ //on success, append comment
       var $ul = $("div.comments ul"); //set ul var to the comments ul div
       $ul.html(""); //get the html contents of the variable
       json.forEach(function(comment){ //for each json, perform function
         $ul.append("<li>" + comment.description + "</li>"); // appends comment desc in li tags
         $ul.append("<li>" + "-" + comment.name + "</li>" + "<br>" + "<br>" // appends comment name in li tags
       );
       });
     });
     e.preventDefault();
   });
 });

//create a new comment
$(function(){ //$ is used for jquery functions
  $(".form-submit").on("click", function(e){ //when form submit button clicked, perform request
    e.preventDefault(); //stops default action
    $.ajax({            //Perform an asynchronous(callback when data is recieved) HTTP (Ajax) request.
      type:"POST",     // post request
      url: e.target.form.action,
      data: $(e.target.form).serialize(),//creates text string of form
      dataType: "JSON"
    }).success(function(response){   //on success
      let comment = new Comment(response.name, response.description, response.place_id);
      $("#comment_description").val("");// when successful post request, create new comment
      var $ul = $("div.comments ul"); //creates ul variable equal to the commment list div
      $ul.append(comment.makeComment()); //append new comment, call makeComment on comment
    });
  });
});

function nextTrip(){
  $(".next_link").on("click", function(e){ // on click of the next button...
    e.preventDefault(); //stop default action
    var nextId = parseInt($(".next_link").attr("data-attribute")) + 1; //set id, turn string into int
    $.get("/trips/" + nextId + ".json", function(data){ //load data from server using HTTP GET request
      $(".tripInfo").text(data["name"]);//name text from tripInfo class
      var html = "";
      data["places"].forEach(function(place){

        html += "<p><a href='/trips/" + data.id + "/places/" + place.id + "'>" + place.name + "</a></p>"
      })
      $(".placeInfo").html(html);

      $(".next_link").attr("data-attribute", data["id"]); // sets id for next link
      $(".previous_link").attr("data-attribute", data["id"] - 1); // sets id for previous link which is id -1
    })
  });
};

function previousTrip(){
  $(".previous_link").on("click", function(e){ // on click of the previous button...
    e.preventDefault(); //stop default action
    var previousId = parseInt($(".previous_link").attr("data-attribute")) - 1; //set id, turn string into int
    $.get("/trips/" + previousId + ".json", function(data){ //load data from server using HTTP GET request
      $(".tripInfo").text(data["name"]); //name text from trip Info Class
      var html = "";
      data["places"].forEach(function(place){
        html += "<p><a href='/trips/" + data.id + "/places/" + place.id + "'>" + place.name + "</a></p>"
      });
      $(".placeInfo").html(html);

      $(".previous_link").attr("data-attribute", data["id"]); // sets id for next link
      $(".next_link").attr("data-attribute", data["id"] + 1); // sets id for previous link which is id -1
    });
  });
};
