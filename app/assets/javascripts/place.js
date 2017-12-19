//Create an object
class Comment{
  constructor(name, description, place_id) {
    this.name = name;
    this.description= description;
    this.place_id = place_id;
  }
}
//create a prototype

Comment.prototype.makeComment = function() {
  let html = ''
  html += `<p class="comments">${this.description}</p>`
  html += `<p class="comment_by">By: ${this.name}</p>`
  return html
}

//render show page with 'next' option
function nextPage(){
  $("a.next").on("click", function(e){
    e.preventDefault();
  })
}

//load comments index using json
$(function(){
  $("a.load_comments").on("click", function(e){
    $("a.load_comments").hide();
    $.getJSON(this.href).success(function(json){
      var $ul = $("div.comments ul")
      $ul.html("")
      json.forEach(function(comment){
        $ul.append("<li>" + comment.description + "</li>");
        $ul.append("<li>" + "-" + comment.name + "</li>" + "<br>" + "<br>");
      })
    })
    e.preventDefault();
  })
})

//create a new comment
$(function(){
  $(".form-submit").on("click", function(e){
    e.preventDefault();
    $.ajax({
      type:"POST",
      url: e.target.form.action,
      data: $(e.target.form).serialize(),
      dataType: "JSON"
    }).success(function(response){
      let comment = new Comment(response.name, response.description, response.place_id)
      $("#comment_description").val("");
      var $ul = $("div.comments ul")
      $ul.append(comment.makeComment())
    });
  })
});

function nextTrip(){
  //for next button
  $(".next_link").on("click"), function(e){
    e.preventDefault();
    var nextId = parseInt($(".next_link").attr("data-attribute")) + 1;
    $.get("/trips/" + nextId + ".json", function(data){
      $(".trip")
    })
  }
}

function previousTrip(){
  //for last button
}
