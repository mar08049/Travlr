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
  $("#new_comment").on("submit", function(e){
    $.ajax({
      type:"POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        $("#comment_description").val("");
        $("#comment_name").val("");
        var $ul = $("div.comments ul")
        $ul.append(response);
      }
    });
    e.preventDefault();
  })
});
